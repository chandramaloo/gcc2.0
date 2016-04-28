// TODO order of evaluation for a + a++ + a
// helper functions
string newlabel(){
	return "L"+to_string(labelcount++);
}

bool myPush(abstract_astnode* child){
	if(child->type.getWidth()!=4) return false;
	if(!child->regValid) return false;
	if(child->label == "Id") return true;
	if(child->type.type=="int") tstack.push(child->reg);
	else if(child->type.type=="float") ftstack.push(child->reg);
	else return false;
	return true;
}

bool myPop(abstract_astnode* child, bool forPtr = false){
	child->regValid = false;
	if(child->type.getWidth()!=4)
		return false;
	if((child->type.type=="int" || forPtr) && tstack.size()>0){
		child->reg = tstack.top();
		child->regValid = true;
		tstack.pop();
		return true;
	}
	else if(child->type.type=="float" && ftstack.size()>0 && !forPtr){
		child->reg = ftstack.top();
		child->regValid = true;
		ftstack.pop();
		return true;
	}
	return false;
}

bool checkPrintfParams(vector<ExpAst*> temp){
	for(int i = 0; i < temp.size(); i++){
		if(temp[i]->label =="StringConst" ||
			temp[i]->label =="IntConst" ||
			temp[i]->label =="FloatConst")
			continue;
		if(temp[i]->type.ptr!=0 || temp[i]->type.vec.size()!=0 || temp[i]->type.isStruct)
			return false;
	}
	return true;
}

void setArrayWidth(vector<string> arr){
	if(arr.size()==0) return;
	int mult = 1;
	for(int i=0; i<arr.size(); i++){
		mult*= stoi(arr[i]);
	}
	ste->width = ste->width * mult;
	return;
}

// create space for local variables on stack
string genSpaceForLocalVar(const LocalSymbolTable& lstt){
  int local_vars_width = 0;
	for(int i=0; i < lstt.rows.size(); i++){
		if(lstt.rows[i].symbol_scope=="local"){
			local_vars_width += lstt.rows[i].width;
		}
	}
	string ret = "";
	ret += "# space for local variables\n";
	ret += "\taddi $sp, $sp, -" + to_string(local_vars_width) + "\n\n";
	return ret;
}

// offsetFrom(from) should point to top of block
// offsetFrom < 0 if something below top is passed
// offsetTo(to) should point to top of block
// e.g. from = "($sp)"; to = "($t0)"
// neither of these can be "$(t1)"
// assumes space already created on stack
string copy(int width, string from, string to, int offsetFrom, int offsetTo){
	string ret = "";
	// cpoying from low to high addresses, top to bottom
	for (int i=0; i<width; i += 4) {
		ret += "\tlw $t1, " + to_string(i + offsetFrom) + from + "\n";
		ret += "\tsw $t1, " + to_string(i + offsetTo) + to + "\n";
	}
	ret += "\n";
	return ret;
}

//Symbol_Type Class Functions
Symbol_Type::Symbol_Type(){
	type="";
	ptr = 0;
	isStruct = false;
	vec.resize(0);
}

Symbol_Type::Symbol_Type(const Symbol_Type& s){
	ptr = s.ptr;
	isStruct = s.isStruct;
	type = s.type;
	for(int i=0; i<s.vec.size(); i++)
		vec.push_back(s.vec[i]);
}

void Symbol_Type::print(){
	if(isStruct)
		fprintf(stderr, "struct %s", this->type.c_str());
	else
		fprintf(stderr, "%s", this->type.c_str());
	int i;
	for(i=0; i<this->ptr; i++)
		fprintf(stderr, "*");

	if(this->ptr < 0) i-=this->ptr;
	for(int i=0; i<this->vec.size(); i++)
		fprintf(stderr, "[%s]", this->vec[i].c_str());
}

bool Symbol_Type::operator==(Symbol_Type a){
	if(ptr!=a.ptr) return false;
	if(isStruct!=a.isStruct) return false;
	if(type!=a.type) return false;
	if(vec.size()!=a.vec.size()) return false;
	for(int i=0; i<a.vec.size(); i++)
		if(vec[i]!=a.vec[i]) return false;
	return true;
}

// if pure int or float
bool Symbol_Type::pureType(){
	return (!ptr && !vec.size() && !isStruct);
}

// can this be assigned a variable of type a
bool Symbol_Type::canCast(Symbol_Type a){
	// all equal
	int thisPtr = ptr + vec.size();
	int aPtr = a.ptr + a.vec.size();
	if(*this == a) return true;
	if(aPtr==1 && a.type=="void" && thisPtr>0) return true;
	if(thisPtr==1 && type=="void" && aPtr>0) return true;
	if(isStruct!=a.isStruct) return false;
	if(thisPtr!=aPtr) return false;
	if(type==a.type) return true;
	if(type=="int" && a.type=="float" && thisPtr==0) return true;
	if(type=="float" && a.type=="int" && thisPtr==0) return true;
	return false;
}

// call this only if canCast
Symbol_Type Symbol_Type::castType(Symbol_Type a){
	if(this->type == "float" && a.type == "int"){
		return *this;
	}
	else if(this->type == "int" && a.type == "float"){
		return a;
	}
	return *this;
}

int Symbol_Type::getWidth(){
	if(ptr!=0 || type =="int" || type=="float" || vec.size()>0) return 4;
	else if(isStruct) return gst.getLst(type).meta->width;
	else if(type=="void") return 0;
	return -1;
}

//SymtabEntry Class Functions
SymTabEntry::SymTabEntry(){

}

SymTabEntry::SymTabEntry(const SymTabEntry& ste){
	this->symbol_name = ste.symbol_name;
	this->symbol_class = ste.symbol_class;
	this->symbol_scope = ste.symbol_scope;
	this->symbol_type = ste.symbol_type;
	this->width = ste.width;
	this->offset = ste.offset;
}

SymTabEntry::SymTabEntry(string symbol_name,string symbol_class,string symbol_scope,
	Symbol_Type symbol_type, int width, int offset){
	this->symbol_name = symbol_name;
	this->symbol_class = symbol_class;
	this->symbol_scope = symbol_scope;
	this->symbol_type = symbol_type;
	this->width = width;
	this->offset = offset;
}

SymTabEntry::SymTabEntry(string symbol_name,string symbol_class,string symbol_scope,
	Symbol_Type symbol_type, int width, int offset, LocalSymbolTable* symtab){
	this->symbol_name = symbol_name;
	this->symbol_class = symbol_class;
	this->symbol_scope = symbol_scope;
	this->symbol_type = symbol_type;
	this->width = width;
	this->offset = offset;
	this->symtab = symtab;
}

void SymTabEntry::print(){
	fprintf(stderr, "%s %s %s ",this->symbol_name.c_str(), this->symbol_class.c_str(),
		this->symbol_scope.c_str());
	this->symbol_type.print();
	fprintf(stderr, " %d %d\n", this->width, this->offset);
}

// LocalSymbolTable Class Functions
LocalSymbolTable::LocalSymbolTable(){
	this->meta = new SymTabEntry();
	this->rows.resize(0);
}

LocalSymbolTable::LocalSymbolTable(const LocalSymbolTable& lst){
	this->meta = new SymTabEntry(*(lst.meta));
	this->rows = lst.rows;
}

void LocalSymbolTable::print(){
	fprintf(stderr, "Contents of LST for meta data: ");
	this->meta->print();
	fprintf(stderr, "Entries in the LST:\n");
	for(int i=0; i < this->rows.size(); i++)
		this->rows[i].print();
	fprintf(stderr, "\n");
}

void LocalSymbolTable::clean(){
	delete this->meta;
	this->meta = new SymTabEntry();
	this->rows.resize(0);
}

void LocalSymbolTable::addParam(SymTabEntry symtab){
	this->rows.push_back(symtab);
}

void LocalSymbolTable::addParams(vector<SymTabEntry> rows){
	this->rows.insert(this->rows.end(), rows.begin(), rows.end());
}

bool LocalSymbolTable::match(vector<ExpAst*> temp){
	int j = 0;
	for(int i = 0; i < this->rows.size(); i++){
		if(this->rows[i].symbol_scope != "param") continue;
		if(j == temp.size()) return false;
		if(!(temp[j]->type.canCast(this->rows[i].symbol_type))){
			return false;
		}
		if(temp[j]->type.vec.size() != this->rows[i].symbol_type.vec.size()){
			return false;
		}
		for(int k=1; k<temp[j]->type.vec.size(); k++){
			if(temp[j]->type.vec[k] != this->rows[i].symbol_type.vec[k]){
				return false;
			}
		}
		j++;
	}
	return (j == temp.size());
}

void LocalSymbolTable::adjustParamOffset(){

	for(int i=0; i<rows.size(); i++){
		if(rows[i].symbol_scope=="param"){
			rows[i].offset = meta->width - rows[i].offset + 12;
		}
	}
}

void LocalSymbolTable::checkStructContents(){
	for(int i=0; i<rows.size(); i++){
		rows[i].offset += 4;
		if(rows[i].symbol_type.isStruct && !gst.containsFun(rows[i].symbol_type.type)){
			if(rows[i].symbol_type.ptr == 0 || lst.meta->symbol_name != rows[i].symbol_type.type){
				cerr << file << ": In definition of 'struct " << lst.meta->symbol_name << "':\n";
				cerr << file << ": error: storage size of variable of 'struct " << rows[i].symbol_type.type << "' isn't known\n";
				exit(0);
			}
		}
	}
}

SymTabEntry LocalSymbolTable::getEntry(string symbol_name) const{
	for(int i=0; i<rows.size(); i++){
		if(rows[i].symbol_name == symbol_name)
			return rows[i];
	}
	SymTabEntry a;
	a.symbol_type.type = "null";
	return a;
}

bool LocalSymbolTable::contains(string symbol_name) const{
	for(int i=0; i<rows.size(); i++){
		if(rows[i].symbol_name == symbol_name)
			return true;
	}
	return false;
}

Symbol_Type LocalSymbolTable::getType(string symbol_name) const{
	for(int i=0; i<rows.size(); i++){
		if(rows[i].symbol_name == symbol_name)
			return rows[i].symbol_type;
	}
	Symbol_Type a;
	a.type="null";
	return a;
}

// GlobalSymbolTable Class Functions
GlobalSymbolTable::GlobalSymbolTable(){

}

void GlobalSymbolTable::print(){
	fprintf(stderr, "\nformat: name var/fun/struct scope type/ret.type width offset\nContents of the GST:\n");
	for(int i=0; i < this->GlobalSymbols.size(); i++)
		this->GlobalSymbols[i].print();
	fprintf(stderr, "\nContents in LSTs:\n");
	for(map<string, LocalSymbolTable>::iterator it = this->mapper.begin(); it != this->mapper.end(); it++)
		if (it->first != "printf")
			it->second.print();
	fprintf(stderr, "\n");
}

LocalSymbolTable GlobalSymbolTable::getLst(string symbol_name){
	return this->mapper[symbol_name];
}

bool GlobalSymbolTable::containsVar(string symbol_name){
	for(int i=0; i<GlobalSymbols.size(); i++){
		if(GlobalSymbols[i].symbol_name == symbol_name
			&& GlobalSymbols[i].symbol_class == "var")
			return true;
	}
	return false;
}

bool GlobalSymbolTable::containsFun(string symbol_name){
	for(int i=0; i<GlobalSymbols.size(); i++){
		if(GlobalSymbols[i].symbol_name == symbol_name
			&& GlobalSymbols[i].symbol_class != "var")
			return true;
	}
	return false;
}

void GlobalSymbolTable::addLocalSymbolTable(string funcName, LocalSymbolTable funcTable){
	this->mapper[funcName] = funcTable;
	this->GlobalSymbols.push_back(*(funcTable.meta));
}

void GlobalSymbolTable::addGlobalSymbol(SymTabEntry entry){
	this->GlobalSymbols.push_back(entry);
}

// All about ASTs
StmtAst::StmtAst(){
	astnode_type = StmtAstType;
	reg = "";
	regValid = false;
}

ExpAst::ExpAst(){
	astnode_type = ExpAstType;
}

RefAst::RefAst(){
	astnode_type = RefAstType;
}

Block::Block(string label, StmtAst* child1){
	this->label = label;
	this->child1 = child1;
}

void Block::print(){
	child1 ->print();
}

string Block::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	currentDepth++;
	ret += label + ":\n";
	ret += "\taddi $sp, $sp, -8\n\tsw $ra, 4($sp)\n\tsw $fp, 0($sp)\n\tmove $fp, $sp\n\n";	// store dynamic link
	ret += genSpaceForLocalVar(lstt);
	ret += child1->generate_code(lstt, location);
	ret += "\n" + label + "Return:\n\tlw $ra, 4($fp)\n\tmove $sp, $fp\n\tlw $fp, 0($fp)\n\taddi $sp, $sp, 8\n\tjr $ra\n\n";
	currentDepth--;
	return ret;
}

void Block::assignReg() {
	child1->assignReg();
}

Empty::Empty(){
	label = "Empty";
}

void Empty::print(){
	cerr << label;
}

string Empty::generate_code(const LocalSymbolTable& lstt, bool location) {
	return "\n";
}

void Empty::assignReg() {
	reqReg = 0;
}

Seq::Seq(std::vector<StmtAst*> children){
	label = "Block";
	this->children = children;
}

void Seq::print(){
	cerr << "(" << label << " [";
	for(int i=0; i < children.size(); i++){
		cerr << "(";
		children[i] ->print();
		cerr << ") ";
	}
	cerr << "])" << endl;
}

string Seq::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Seq\n";
	for(int i = 0; i < children.size(); i++){
		ret += children[i]->generate_code(lstt, location);
	}
	ret += "\n";
	return ret;
}

void Seq::assignReg() {
	for(int i = 0; i < this->children.size(); i++){
		children[i]->assignReg();
	}
}

Return::Return(ExpAst* child1, string funcName){
	label = "Return";
	value = funcName;
	this->child1 = child1;
}

void Return::print(){
	cerr << label << " (" ;
	child1 ->print();
	cerr << ") ";
}

string Return::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Return\n";
	ret += child1->generate_code(lstt, 0);
	int f_width = gst.getLst(value).meta->width, rv_width = gst.getLst(value).meta->symbol_type.getWidth();
	if(myPush(child1)){
		if(child1->type.type=="int"){
			ret += "\tsw " + child1->reg + ", " + to_string(f_width + 8) + "($fp)\n";
		}
		else{
			ret += "\ts.s " + child1->reg + ", " + to_string(f_width + 8) + "($fp)\n";
		}
	} else {
		ret += copy(rv_width, "($sp)", "($fp)", 0, f_width + 8);
	}
	ret += "\tj " + value + "Return\n\n";
	return ret;
}

void Return::assignReg() {
	child1->assignReg();
}

If::If(ExpAst* child1, StmtAst* child2, StmtAst* child3){
	label = "If";
	this->child1 = child1;
	this->child2 = child2;
	this->child3 = child3;
}

void If::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr << ") (";
	child3 ->print();
	cerr << ") " << endl;
}

string If::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#If\n";
	ret += child1->generate_code(lstt, location);
	string label = newlabel(), label2 = newlabel();

	// if(!top(rstack)) goto label
	if(myPush(child1)){
		if(child1->type.type=="int"){
			ret += "\tmove $t0, " + child1->reg + "\n";
		}
		else{
			ret += "\tmfc1 $t0, " + child1->reg + "\n\tcvt.w.s $t0, $t0\n";
		}
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	ret += "\tbeq $t0, $0, " + label + "\n";

	ret += child2->generate_code(lstt, location);

	ret += "\tj " + label2 + "\n";

	ret += label + ":\n";
	ret += child3->generate_code(lstt, location);

	ret += label2 + ":\n\n";
	return ret;
}

void If::assignReg() {
	child1->assignReg();
	child2->assignReg();
}

While::While(ExpAst* child1, StmtAst* child2){
	label = "While";
	this->child1 = child1;
	this->child2 = child2;
}

void While::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr << ") " << endl;
}

string While::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#While\n";
	string label = newlabel(), label2 = newlabel();
	ret += label + ":\n";
	ret += child1->generate_code(lstt, 0);

	// if(!top(rstack)) goto label2
	if(myPush(child1)){
		if(child1->type.type=="int"){
			ret += "\tmove $t0, " + child1->reg + "\n";
		}
		else{
			ret += "\tmfc1 $t0, " + child1->reg + "\n\tcvt.w.s $t0, $t0\n";
		}
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	ret += "\tbeq $t0, $0, " + label2 + "\n";


	ret += child2->generate_code(lstt, location);
	ret += "\tj " + label + "\n" + label2 + ":\n\n";
	return ret;
}

void While::assignReg() {
	child1->assignReg();
	child2->assignReg();
}

For::For(ExpAst* child1, ExpAst* child2, ExpAst* child3, StmtAst* child4){
	label = "For";
	this->child1 = child1;
	this->child2 = child2;
	this->child3 = child3;
	this->child4 = child4;
}

void For::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr << ") (";
	child3 ->print();
	cerr << ") (";
	child4 ->print();
	cerr << ") " << endl;
}

string For::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret="#For\n";
	string label = newlabel(), label2 = newlabel();
	ret += child1->generate_code(lstt, 0);
	ret += label + ":\n";
	ret += child2->generate_code(lstt, 0);

	if(myPush(child2)){
		if(child2->type.type=="int"){
			ret += "\tmove $t0, " + child2->reg + "\n";
		}
		else{
			ret += "\tmfc1 $t0, " + child2->reg + "\n\tcvt.w.s $t0, $t0\n";
		}
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	ret += "\tbeq $t0, $0, " + label2 + "\n";

	ret += child4->generate_code(lstt, location);
	ret += child3->generate_code(lstt, location);
	ret += "\tj " + label + "\n" + label2 + ":\n\n";

	return ret;
}

void For::assignReg() {
	child1->assignReg();
	child2->assignReg();
	child3->assignReg();
	child4->assignReg();
}

OpUnary::OpUnary(string label, ExpAst* child1){
	this->label = label;
	this->child1 = child1;
}

void OpUnary::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") ";
}

string OpUnary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#OpUnary\n";

	if (label == "PP") {
		ret += child1->generate_code(lstt, 1);

		if(myPush(child1)){
			ret += "\tmove $t0, " + child1->reg + "\n";
		}
		else{
			ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
		}

		if (child1->type.type == "int"){
			ret += "\tlw $t1, 0($t0)\n\taddi $t1, $t1, 1\n\tsw $t1, 0($t0)\n";

			if(myPop(this)){
				ret += "\tmove " + this->reg + ", $t1\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\tsw $t1, 0($sp)\n";
			}
			return ret;
		} else {
			ret += "\tl.s $f0, 0($t0)\n\tli.s $f1, 1\n\tadd.s $f0, $f0, $f1\n\tsw $f0, 0($t0)\n";

			if(myPop(this)){
				ret += "\tmov.s " + this->reg + ", $f0\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n";
			}
			return ret;
		}
	}

	ret += child1->generate_code(lstt, 0);

	if (label == "NOT") {
		if (child1->type.type == "int") {
			if(myPush(child1)){
				ret += "\tmove $t0, " + child1->reg + "\n";
			}
			else{
				ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}

			ret += "\tnot $t0, $t0\n";
			if(myPop(this)){
				ret += "\tmove " + this->reg + ", $t0\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
			}
			return ret;
		} else {
			if(myPush(child1)){
				ret += "\tmfc1 $t0, " + child1->reg + "\n";
			}
			else{
				ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}

			ret += "\tnot $t0, $t0\n";
			if(myPop(this)){
				ret += "\tmove " + this->reg + ", $t0\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
			}
			return ret;

		}
	}
	else if (label == "UMINUS") {
		if (child1->type.type == "int") {
			if(myPush(child1)){
				ret += "\tmove $t0, " + child1->reg + "\n";
			}
			else{
				ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}

			ret += "\tneg $t0, $t0\n";

			if(myPop(this)){
				ret += "\tmove " + this->reg + ", $t0\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
			}
			return ret;

		} else if (child1->type.type == "float") {
				if(myPush(child1)){
					ret += "\tmov.s $f0, " + child1->reg + "\n";
				}
				else{
					ret += "\tl.s $f0, 0($sp)\n\taddi $sp, $sp, 4\n";
				}

				ret += "\tneg.s $f0, $f0\n";

				if(myPop(this)){
				ret += "\tmov.s " + this->reg + ", $f0\n";
			} else {
				ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
			}
			return ret;
		}
	}
}

void OpUnary::assignReg() {
	child1->assignReg();
	reqReg = child1->reqReg;
}

OpBinary::OpBinary(string label, ExpAst* child1, ExpAst* child2){
	this->label = label;
	this->child1 = child1;
	this->child2 = child2;
}

void OpBinary::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string OpBinary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#OpBinary\n";
	ret += child1->generate_code(lstt, 0);
	ret += child2->generate_code(lstt, 0);

	// type.type=int -> child1 and child2 have to be int
	if (type.type == "int") {
		if(myPush(child2)){
			ret += "\tmove $t1, " + child2->reg + "\n";
		} else {
			ret += "\tlw $t1 0($sp)\n\taddi $sp, $sp, 4\n";
		}
		if(myPush(child1)){
			ret += "\tmove $t0, " + child1->reg + "\n";
		} else {
			ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
		}
		// pop the two children from stack and perform the binary operation
		ret += "# operating to produce an integer\n";

		if(this->label == "OR") {
			ret += "\tor $t0, $t0, $t1\n";
		}
		else if(this->label == "AND") {
			ret += "\tand $t0, $t0, $t1\n";
		}
		else if(this->label == "EQ") {
			ret += "\tseq $t0, $t0, $t1\n";
		}
		else if(this->label == "NE") {
			ret += "\tsne $t0, $t0, $t1\n";
		}
		else if(this->label == "LT-INT") {
			ret += "\tslt $t0, $t0, $t1\n";
		}
		else if(this->label == "LE_OP-INT") {
			ret += "\tsle $t0, $t0, $t1\n";
		}
		else if(this->label == "GE_OP-INT") {
			ret += "\tsge $t0, $t0, $t1\n";
		}
		else if(this->label == "GT-INT") {
			ret += "\tsgt $t0, $t0, $t1\n";
		}
		else if(this->label == "PLUS-INT") {
			ret += "\tadd $t0, $t0, $t1\n";
		}
		else if(this->label == "MINUS-INT") {
			ret += "\tsub $t0, $t0, $t1\n";
		}
		else if(this->label == "MULT-INT") {
			ret += "\tmul $t0, $t0, $t1\n";
		}
	  else if(this->label == "DIV-INT") {
	      ret += "\tdiv $t0, $t0, $t1\n";
	  }

  	if(myPop(this)){
			ret += "\tmove " + this->reg + ", $t0\n";
  	} else {
			ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
  	}
	}
	else {
		// pop the two children from stack and perform the binary operation
		ret += "# operating to produce a float\n";
		string label = newlabel(), label2 = newlabel();

		if(myPush(child2)){
			if (child2->type.type == "int"){
				ret += "\tmtc1 " + child2->reg + ", $f1\n";
				ret += "\tcvt.s.w $f1, $f1\n";
			} else if(child2->type.type == "float"){
				ret += "\tmov.s $f1, " + child2->reg + "\n";
			}
		}
		else {
			ret += "\tl.s $f1, 0($sp)\n\taddi $sp, $sp, 4\n";
			if (child2->type.type == "int"){
				ret += "\tcvt.s.w $f1, $f1\n";
			}
		}

		if(myPush(child1)){
			if (child1->type.type == "int"){
				ret += "\tmtc1 " + child1->reg + ", $f0\n";
				ret += "\tcvt.s.w $f0, $f0\n";
			} else if(child1->type.type == "float"){
				ret += "\tmov.s $f0, " + child1->reg + "\n";
			}
		}
		else {
			ret += "\tl.s $f0, 0($sp)\n\taddi $sp, $sp, 4\n";
			if (child1->type.type == "int"){
				ret += "\tcvt.s.w $f0, $f0\n";
			}
		}

		if(this->label == "LT-FLOAT") {
			ret += "\tc.lt.s $f0, $f1\nbczt " + label + "\n";
			ret += "\taddi$sp, $sp, -4\n\tsw $0, 0($sp)\n";
			ret += label + ":\n\taddi $t0, $0, 1\n\taddi $sp, $sp, -4\n\tsw $t0, 0($sp\n)";
			ret += label2 + ":\n";
		}
		else if(this->label == "LE_OP-FLOAT") {
			ret += "\tc.le.s $f0, $f1\nbczt " + label + "\n";
			ret += "\taddi$sp, $sp, -4\n\tsw $0, 0($sp)\n";
			ret += label + ":\n\taddi $t0, $0, 1\n\taddi $sp, $sp, -4\n\tsw $t0, 0($sp\n)";
			ret += label2 + ":\n";
		}
		else if(this->label == "GE_OP-FLOAT") {
			ret += "\tc.le.s $f1, $f0\nbczt " + label + "\n";
			ret += "\taddi$sp, $sp, -4\n\tsw $0, 0($sp)\n";
			ret += label + ":\n\taddi $t0, $0, 1\n\taddi $sp, $sp, -4\n\tsw $t0, 0($sp\n)";
			ret += label2 + ":\n";
		}
		else if(this->label == "GT-FLOAT") {
			ret += "\tc.lt.s $f1, $f0\nbczt " + label + "\n";
			ret += "\taddi$sp, $sp, -4\n\tsw $0, 0($sp)\n";
			ret += label + ":\n\taddi $t0, $0, 1\n\taddi $sp, $sp, -4\n\tsw $t0, 0($sp\n)";
			ret += label2 + ":\n";
		}
		else if(this->label == "PLUS-FLOAT") {
			ret += "\tadd.s $f0, $f0, $f1\n";
		}
		else if(this->label == "MINUS-FLOAT") {
			ret += "\tsub.s $f0, $f0, $f1\n";
		}
		else if(this->label == "MULT-FLOAT") {
			ret += "\tmul.s $f0, $f0, $f1\n";
		}
		else if(this->label == "DIV-FLOAT") {
			ret += "\tdiv.s $f0, $f0, $f1\n";
		}
		if(myPop(this)){
			ret += "\tmov.s " + this->reg + ", $f0\n";
		}
		else {
			ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
		}
	}
	return ret;
}

void OpBinary::assignReg() {
	child1->assignReg();
	child2->assignReg();
	if(child1->reqReg == 0) child1->reqReg = 1;
	if (child1->reqReg == child2->reqReg) reqReg = child2->reqReg + 1;
		else reqReg = max(child1->reqReg, child2->reqReg);
}

Assign::Assign(ExpAst* child1, ExpAst* child2){
	label = "Assign";
	this->child1 = child1;
	this->child2 = child2;
}

void Assign::print(){
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string Assign::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Assign\n";
	ret += child2->generate_code(lstt, 0);
	ret += child1->generate_code(lstt, 1);
	if(myPush(child1)){
		ret += "\tmove $t0, " + child1->reg + "\n";
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	// handle separately the case that typecasting needs to be done
	if (child1->type.type == "int" && child1->type.pureType()) {
		if (child2->type.type == "float" && child2->type.pureType()) {
			// typecast from float to int
			if(myPush(child2)){
				ret += "\tmov.s $f0, " + child2->reg + "\n";
			}
			else {
				ret += "\tl.s $f0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}
			ret += "\n\tcvt.w.s $f0, $f0\n\ts.s $f0, 0($t0)\n";
			return ret;
		}
		else if (child2->type.type == "int" && child2->type.pureType()) {
			if(myPush(child2)){
				ret += "\tsw " + child2->reg + ", 0($t0)\n";
				myPop(this);
				return ret;
			} else {
				// handled in obj_width copying
			}
		}
	} else if(child1->type.type == "float" && child1->type.pureType()) {
		if (child2->type.type == "int" && child2->type.pureType()) {
			if(myPush(child2)){
				ret += "\tmtc1 " + child2->reg + ", $f0\n";
			}
			else {
				ret += "\tl.s $f0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}
			ret += "\n\tcvt.s.w $f0, $f0\n\ts.s $f0, 0($t0)\n";
			return ret;
		} else if (child2->type.type == "float" && child2->type.pureType()) {
			if(myPush(child2)){
				ret += "\tmov.s " + child2->reg + ", $f0\n";
			}
			else {
				ret += "\tl.s $f0, 0($sp)\n\taddi $sp, $sp, 4\n";
			}
			ret += "\ts.s $f0, 0($t0)\n";
			return ret;
		}
	}
	// copy width bytes from current $sp to $t0
	int obj_width = child2->type.getWidth();
	ret += copy(obj_width,"($sp)", "($t0)", 0, 4-obj_width);
	return ret;
}

void Assign::assignReg() {
	child2->assignReg();
}

Funcall::Funcall(RefAst* child1, vector<ExpAst*> children){
	label = "Funcall";
	this->child1 = child1;
	this->children = children;
}

void Funcall::print(){
	cerr << " (" << label;
	child1 ->print();
	for(int i=0; i < children.size(); i++){
		cerr << ") (";
		children[i] ->print();
	}
	cerr << ") " << endl;
}

string Funcall::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Funcall\n";

    if (child1->value == "printf") {
        // do a syscall for each stringconst, float, int in the children
        for (int i=0; i<children.size(); i++) {
            if (children[i]->label == "StringConst") {
							ret += "# printf prints a string const\n";
							ret += "\tla $a0, " + children[i]->string_label + "\n\taddi $v0, $0, 4\n\tsyscall\n";
            } else if (children[i]->label == "IntConst") {
							ret += "# printf prints an int const\n";
              ret += "\taddi $a0, $0, " + children[i]->value + "\n\taddi $v0, $0, 1\n\tsyscall\n";
            } else if (children[i]->label == "FloatConst") {
							ret += "# printf prints a float const\n";
	         		ret += "\tli.s $f12, " + children[i]->value + "\n\taddi $v0, $0, 2\n\tsyscall\n";
            } else if (children[i]->label == "Id") {
              if (children[i]->type.type == "int") {
                ret += "# printf prints an int identifier\n";
                ret += children[i]->generate_code(lstt, 0);
                if(myPush(children[i])){
                	ret += "\tmove $a0, " +children[i]->reg + "\n";
                }
                else{
                  ret += "\tlw $a0, 0($sp)\n\taddi $sp, $sp, 4\n";
                }
                ret += "\taddi $v0, $0, 1\n\tsyscall\n";
              } else if (children[i]->type.type == "float") {
                ret += "# printf prints a float identifier\n";
                ret += children[i]->generate_code(lstt, 0);
                if(myPush(children[i])){
                	ret += "\tmov.s $f12, " + children[i]->reg + "\n";
                }
                else{
                  ret += "\tl.s $f12, 0($sp)\n\taddi $sp, $sp, 4\n";
                }
                ret += "\taddi $v0, $0, 2\n\tsyscall\n";
              }
            } else {
              ret += "# printf prints an expression\n";
              ret += children[i]->generate_code(lstt, 0);
							if (children[i]->type.type == "int") {
								if(myPush(children[i])){
                	ret += "\tmove $a0, " +children[i]->reg + "\n";
                }
                else{
                  ret += "\tlw $a0, 0($sp)\n\taddi $sp, $sp, 4\n";
                }
              	ret += "\taddi $v0, $0, 1\n\tsyscall\n";
							} else if (children[i]->type.type == "float") {
								if(myPush(children[i])){
              		ret += "\tmov.s $f12, " + children[i]->reg + "\n";
                }
                else{
									ret += "\tl.s $f12, 0($sp)\n\taddi $sp, $sp, 4\n";
                }
								ret += "\taddi $v0, $0, 2\n\tsyscall\n";
							}
            }
        }
        return ret;
    	}

	// get the width of the function return value from the gst using child1 as identifier
	int rv_width = gst.getLst(child1->value).meta->symbol_type.getWidth();
    // get space on the stack for rv
	ret += "\taddi $sp, $sp, " + to_string((-1)*rv_width) + "\n";
	// get the total width of the function parameters
	int f_width = gst.getLst(child1->value).meta->width;

	// gen code for all the children
	for(int i=0; i<children.size(); i++){
	  if(children[i]->type.vec.size()>0){
	  	if(lstt.getEntry(children[i]->value).symbol_scope!="param"){
	    	ret += children[i]->generate_code(lstt, 1);
	    	if(myPush(children[i])){
	    		if(children[i]->type.type=="int"){
	      		ret += "\taddi $sp, $sp, -4\n\tsw " + children[i]->reg + ", 0($sp)\n";
	    		}
	      	else{
	      		ret += "\taddi $sp, $sp, -4\n\ts.s " + children[i]->reg + ", 0($sp)\n";
	      	}
	    	}
	  	}
	    else {
	      ret += children[i]->generate_code(lstt, 0);
	      if(myPush(children[i])){
	    		if(children[i]->type.type=="int"){
	      		ret += "\taddi $sp, $sp, -4\n\tsw " + children[i]->reg + ", 0($sp)\n";
	    		}
	      	else {
	      		ret += "\taddi $sp, $sp, -4\n\ts.s " + children[i]->reg + ", 0($sp)\n";
	      	}
	    	}
	    }
    }
	  else{
      ret += children[i]->generate_code(lstt, 0);
      if(myPush(children[i])){
    		if(children[i]->type.type=="int"){
      		ret += "\taddi $sp, $sp, -4\n\tsw " + children[i]->reg + ", 0($sp)\n";
    		}
      	else{
      		ret += "\taddi $sp, $sp, -4\n\ts.s " + children[i]->reg + ", 0($sp)\n";
      	}
      }
	  }
	}
	// call the function
	ret += "\tjal " + child1->value + "\n";
	// pop the parameters from the stack
	ret += "\taddi $sp, $sp, " + to_string(f_width) + "\n\n";
	return ret;
}

void Funcall::assignReg() {
	for(int i=0; i < children.size(); i++){
		children[i]->assignReg();
	}
}

FloatConst::FloatConst(string value){
	label = "FloatConst";
	this->value = value;
}

void FloatConst::print(){
	cerr<< label << value;
}

// TODO float typecasting for FloatConst generate_code
string FloatConst::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#FloatConst\n";
	if (location) ret += "#trying to get location of read only data\n";
	if(myPop(this)){
		ret += "\tli.s " + this->reg + ", " + value + "\n";
	} else {
		ret += "\tli.s $f0, " + value + "\n\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
	}
	return ret;
}

void FloatConst::assignReg() {
	reqReg = 0;
}

IntConst::IntConst(string value){
	this->label = "IntConst";
	this->value = value;
}

void IntConst::print(){
	cerr << label << value;
}

string IntConst::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#IntConst\n";
	if (location) ret += "#trying to get location of read only data\n";
	if(myPop(this)){
		ret += "\taddi " + this->reg + ", $0, " + value + "\n";
	}
	else {
		ret += "\taddi $t0, $0, " + value + "\n\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
	}
	return ret;
}

void IntConst::assignReg() {
	reqReg = 0;
}

StringConst::StringConst(string value){
	label = "StringConst";
	string_label = newlabel();
	const_strings.push(make_pair(string_label, value));
	this->value = value;
}

void StringConst::print(){
	cerr << label << " \"" << value << "\"";
}

string StringConst::generate_code(const LocalSymbolTable& lstt, bool location) {
	// TODO add this string at the top of the mips code with a label and return the address of that label
	return "#trying to generate code for constant strings\n";
}

void StringConst::assignReg() {
	reqReg = 0;
}

Pointer::Pointer(ExpAst* child1){
	label = "Pointer";
	this->child1 = child1;
}

void Pointer::print(){
	cerr << label << " (";
	child1 ->print();
	cerr<<") ";
}

string Pointer::generate_code(const LocalSymbolTable& lstt, bool location) {
	return child1->generate_code(lstt, 1);
}

void Pointer::assignReg() {

}

Member::Member(ExpAst* child1, RefAst* child2){
	label = "Member";
	this->child1 = child1;
	this->child2 = child2;
}

void Member::print(){
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string Member::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Member\n";
	// We need address of left child
	ret += child1->generate_code(lstt, 1);
	// child1 will always be on stack as it is a struct & not a ptr or int or float
	// no need to generate code for child2 (it is an identifier), need it for calculating the offset
	// look child1->type.type up in the lst; child2 ka offset nikalo is struct k liye
	int offset = gst.getLst(child1->type.type).getEntry(child2->value).offset;
	ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	ret += "\taddi $t0, $t0," + to_string(offset) + "\n";

	if (location) {
		// push to stack sum of the return values of stack
		if(myPop(this, true)){
			ret += "\tmove " + this->reg + ", $t0\n";
		}
		else{
			ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
		}
	} else {
		if(myPop(this)){
			if(this->type.type=="int"){
				ret += "\tlw " + this->reg + ", 0($t0)\n";
			}
			else{
				ret += "\tl.s" + this->reg + ", 0($t0)\n";
			}
		}
		else{
			int obj_width = type.getWidth();
			ret += "\taddi $sp, $sp, " + to_string(-1*obj_width) + "\n";
			ret += copy(obj_width, "($t0)", "($sp)", 4-obj_width, 0);
		}
	}
	return ret;
}

void Member::assignReg() {

}

Arrow::Arrow(ExpAst* child1, RefAst* child2){
	this->label = "Arrow";
	this->child1 = child1;
	this->child2 = child2;
}

void Arrow::print(){
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

// VERIFIED
string Arrow::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Arrow\n";
	ret += child1->generate_code(lstt, 0);
	// no need to generate code for child2 (it is an identifier), need it for calculating the offset
	// look up child1->type.type in the lst; child2 ka offset nikalo is struct k liye
	int offset = gst.getLst(child1->type.type).getEntry(child2->value).offset;

	// child1 cannot be float, so just move will do
	if(myPush(child1)){
		ret += "\tmove $t0, " + child1->reg + "\n";
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	ret += "\taddi $t0, $t0," + to_string(offset) + "\n";
	if (location) {
		// push to stack sum of the return values of stack
		if(myPop(this), true){
			ret += "\tmove " + this->reg + ", $t0\n";
		}
		else{
			ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
		}
	}
	else {
		if(myPop(this)){
			if(this->type.type=="int"){
				ret += "\tlw " + this->reg + ", 0($t0)\n";
			}
			else{
				ret += "\tl.s" + this->reg + ", 0($t0)\n";
			}
		}
		else{
			int obj_width = type.getWidth();
			ret += "\taddi $sp, $sp, " + to_string(-1*obj_width) + "\n";
			ret += copy(obj_width, "($t0)", "($sp)", 4-obj_width, 0);
		}
	}
	return ret;
}

void Arrow::assignReg() {

}

Deref::Deref(ExpAst* child1){
	label = "Deref";
	this->child1 = child1;
}

void Deref::print(){
	cerr << label << " (";
	child1 ->print();
	cerr<<") ";
}

// VERIFIED
string Deref::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Deref\n";
	ret += child1->generate_code(lstt, 0);
	// child1 will always be a pointer
	if (location){
		if(myPush(child1)){
			if(myPop(this, true)){
				ret += "\tmove " + this->reg + ", " + child1->reg + "\n";
			}
			else {
				ret += "\taddi $sp, $sp, -4\n\tsw " + child1->reg + ", 0($sp)\n";
			}
		}
		return ret;
	}

	if(myPush(child1)){
		if(child1->type.type=="int"){
			ret += "\tmove $t0, " + child1->reg + "\n";
		}
		else{
			ret += "\tmov.s $f0, " + child1->reg + "\n";
		}
	}
	// TODO handle floats here
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	if(myPop(this)){
		if(this->type.type=="int"){
			ret += "\tlw " + this->reg + ", 0($t0)\n";
		}
		else{
			ret += "\tl.s " + this->reg + ", 0($t0)\n";
		}
	}
	else{
		int obj_width = type.getWidth();
		ret += "\taddi $sp, $sp, " + to_string(-1*obj_width) + "\n";
		ret += copy(obj_width, "($t0)", "($sp)", 4-obj_width, 0);
	}
	return ret;
}

void Deref::assignReg() {

}

Identifier::Identifier(string value){
	label = "Id";
	this->value = value;
}

void Identifier::print(){
	cerr << label << " \"" << value << "\"";
}

// add a boolean parameter PushToStack; if it is true; you NEED to push it to the stack

// if location not needed
// if register is set for this offset, set reg = that;
// else try and allot it, if successful, store from the stack to that register
// if unable to allot a register, push to stack and set reg = ""
string Identifier::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#Identifier\n";
	int varoffset = lstt.getEntry(value).offset;
	if (!location) {
		int obj_width = type.getWidth();

		if (obj_width == 4){
			if (type.type == "float"){
				reg = cache.isCached(varoffset, 0);

				if (reg == "") {
					reg = cache.AllotRegister(varoffset, 0);
					if (reg != "") {
						// load value from stack to the register
						ret += "\tl.s " + reg + ", " + to_string(varoffset) + "($fp)\n";
						regValid = true;
						return ret;
					} else {
						regValid = false;
					}
				} else {
					regValid = true;
					return "";
				}
			} else {
				reg = cache.isCached(varoffset, 1);

				if (reg == "") {
					reg = cache.AllotRegister(varoffset, 1);

					if (reg != "") {
						regValid = true;

						// load value from stack to the register
						return "\tlw " + reg + ", " + to_string(varoffset) + "($fp)\n";
					} else {
						regValid = false;
					}
				} else {
					regValid = true;
					return "";
				}
			}
		}
		ret += "\taddi $sp, $sp, -" + to_string(obj_width) + "\n";
		ret += copy(obj_width, "($fp)", "($sp)", (4-obj_width+varoffset), 0);
	}
	else {
		// return the l-value for the identifier
		// get the address of this identifier on the stack and push that on the stack
		ret += "\taddi $t0, $fp, " + to_string(varoffset) + "\n";
		if(myPop(this, true)){
			ret += "\tmove " + this->reg + ", $t0\n";
		}
		else{
			ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
		}
	}
	return ret;
}

void Identifier::assignReg() {
	reqReg = 0;
}

ArrayRef::ArrayRef(ExpAst* child1, ExpAst* child2){
	label = "ArrayRef";
	this->child1 = child1;
	this->child2 = child2;
}

void ArrayRef::print(){
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string ArrayRef::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "#ArrayRef\n";

    abstract_astnode* t = child1;
	while(t->label!="Id") t = t->child1;
	string id = t->value;

	// if array is local, location = 1 for child1, = 0 otherwise
	if (lstt.getEntry(id).symbol_scope=="local")
		ret += child1->generate_code(lstt, 1);
	else
		ret += child1->generate_code(lstt, 0);


	ret += child2->generate_code(lstt, 0);

	int n=1;
	for(int i=0; i<type.vec.size(); i++)
		n = n*stoi(type.vec[i]);
	// multiply by type width and offset is negative wrt to pointer
	n *= type.getWidth();
	n *= -1;
	ret += "\taddi $t0, $0, " + to_string(n) + "\n";
	// computing the address of the array reference
	if(myPush(child2)){
		if(child2->type.type=="int"){
			ret += "\tmove $t1, " + child2->reg + "\n";
		}
		else{
			ret += "\tmfc1 $t1, " + child2->reg + "\n\tcvt.w.s $t1, $t1\n";
		}
	}
	else{
		ret += "\tlw $t1, 0($sp)\n\taddi $sp, $sp, 4\n";
		if(child2->type.type=="float"){
			ret += "\tcvt.w.s $t1, $t1\n";
		}
	}
	ret += "\tmul $t1, $t1, $t0\n";
	if(myPush(child1)){
		ret += "\tmove $t0, " + child1->reg + "\n";
	}
	else{
		ret += "\tlw $t0, 0($sp)\n\taddi $sp, $sp, 4\n";
	}
	ret += "\tadd $t0, $t0, $t1\n";

	if (!location) {
		if(myPop(this)){
			if(this->type.type=="int"){
				ret += "\tlw " + this->reg + ", 0($t0)\n";
			}
			else{
				ret += "\tl.s " + this->reg + ", 0($t0)\n";
			}
		}
		else{
			int obj_width = type.getWidth();
			ret += "\taddi $sp, $sp, -" + to_string(obj_width) + "\n";
			ret += copy(obj_width, "($t0)", "($sp)", 4-obj_width, 0);
		}
	} else {
		if(myPop(this, true)){
			ret += "\tmove " + this->reg + ", $t0\n";
		}
		else{
			ret += "\taddi $sp, $sp, -4\n\tsw $t0, 0($sp)\n\n";
		}
	}
	return ret;
}

void ArrayRef::assignReg() {

}

CacheBlock::CacheBlock(string reg) {
	identifier = "";
	this->reg = reg;
	valid = 0;
	depth = -1;
	offset = 0;
}

Cache::Cache() {
	string s = "$s", f = "$f";
	for (int i=0; i<8; i++)
		intcache.push_back(CacheBlock(s+to_string(i)));

	for (int i=13; i<32; i++)
		floatcache.push_back(CacheBlock(f+to_string(i)));
}

// off is the offset for which we are checking
string Cache::isCached(int off, bool integer) {
	if (integer) {
		for(int i=0; i<intcache.size(); i++) {
			if (intcache[i].valid && intcache[i].depth == currentDepth && intcache[i].offset == off)
					return intcache[i].reg;
		}
		return "";

	}
	else {
		for(int i=0; i<floatcache.size(); i++) {
			if (floatcache[i].valid && floatcache[i].depth == currentDepth && floatcache[i].offset == off)
					return floatcache[i].reg;
		}
		return "";
	}
}

string Cache::AllotRegister(int off, bool integer) {
	if (integer) {
		for(int i=0; i<intcache.size(); i++) {
			if (!intcache[i].valid){
				return intcache[i].reg;
			}
		}
	}
	else {
		for(int i=0; i<floatcache.size(); i++) {
			if (!floatcache[i].valid){
				return floatcache[i].reg;
			}
		}
	}
	return "";
}
