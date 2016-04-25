// helper functions
string newlabel(){
	return "L"+to_string(labelcount++);
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
string genLocalVar(const LocalSymbolTable& lstt){
    int ret = 0;
	for(int i=0; i < lstt.rows.size(); i++){
		if(lstt.rows[i].symbol_scope=="local"){
			ret += lstt.rows[i].width;
		}
	}
	return "\taddi $sp, $sp, -" + to_string(ret) + "\n";
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
	return (j==temp.size());
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
	ret += label + ":\n";
	ret += "\taddi $sp, $sp, -8\n\tsw $ra, 4($sp)\n\tsw $fp, 0($sp)\n\tmove $fp, $sp\n";	// store dynamic link
	ret += genLocalVar(lstt);
	ret += child1->generate_code(lstt, location);
    ret += "\n" + label + "Return:\n\tlw $ra, 4($fp)\n\tmove $sp, $fp\n\tlw $fp, 0($fp)\n\taddi $sp, $sp, 8\n\tjr $ra\n\n";
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << "(" << label << " [";
	for(int i=0; i < children.size(); i++){
	   	cerr << "(";
		children[i] ->print();
	   	cerr << ") ";
	}
	cerr << "])" << endl;
}

string Seq::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (" ;
	child1 ->print();
	cerr << ") ";
}

string Return::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
    
    ret += child1->generate_code(lstt, 0);
    
    int f_width = gst.getLst(value).meta->width, rv_width = gst.getLst(value).meta->symbol_type.getWidth();

    
    ret += "# struct_width found to be " + to_string(rv_width) + "\n";

    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<rv_width; i += 4) {
        ret += "\tlw $s1, " + to_string(i) + "($sp)\n";
        ret += "\tsw $s1, " + to_string(f_width+8+i) + "($fp)\n";
    }

    ret += "\n";

    
    
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr << ") (";
	child3 ->print();
	cerr << ") " << endl;
}

string If::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	ret += child1->generate_code(lstt, location);
	string label = newlabel(), label2 = newlabel();

	// if(!top(rstack)) goto label
	ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n\tbeq $s0, $0, " + label + "\n";

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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr << ") " << endl;
}

string While::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	string label = newlabel(), label2 = newlabel();
	ret += label + ":\n";
	ret += child1->generate_code(lstt, 0);
	
	// if(!top(rstack)) goto label2
	ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n\tbeq $s0, $0, " + label2 + "\n";
	
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
	cerr << "#";
	type.print();
	cerr << "#";
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
	string ret="";
	string label = newlabel(), label2 = newlabel();
	ret += child1->generate_code(lstt, 0);
	ret += label + ":\n";
	ret += child2->generate_code(lstt, 0);

	// if(!top(rstack)) goto label
	ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n\tbeq $s0, $0, " + label2 + "\n";

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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr << ") ";
}

string OpUnary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	if (label == "PP") {
		ret += child1->generate_code(lstt, 1);
		ret += "\tlw $s0, 0($sp)\n\tlw $s1, 0($s0)\n\taddi $s2, $s1, 1\n\tsw $s2, 0($s0)\n";
		ret += "\tsw $s2, 0($sp)\n\n";
		return ret;
	}

	ret += child1->generate_code(lstt, 0);
	ret += "\tlw $s0, 0($sp)\n";

	if (label == "UMINUS") {
		ret += "\tneg $s0, $s0\n";
	}
	else if (label == "NOT") {
		ret += "\tnot $s0, $s0\n";
	}
	ret += "\tsw $s0, 0($sp)\n\n";
	return ret;
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string OpBinary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	ret += child1->generate_code(lstt, 0);
	ret += child2->generate_code(lstt, 0);
	// pop the two children from stack and perform the binary operation
	ret += "\tlw $s0, 4($sp)\n\tlw $s1 0($sp)\n\taddi $sp, $sp, 4\n";

	if(label == "OR") {
		ret += "\tor $s0, $s0, $s1\n";
	}
	else if(label == "AND") {
		ret += "\tand $s0, $s0, $s1\n";
	}
	else if(label == "EQ") {
		ret += "\tseq $s0, $s0, $s1\n";
	}
	else if(label == "NE") {
		ret += "\tsne $s0, $s0, $s1\n";
	}
	else if(label == "LT-INT") {
		ret += "\tslt $s0, $s0, $s1\n";
	}
	else if(label == "LE_OP-INT") {
		ret += "\tsle $s0, $s0, $s1\n";
	}
	else if(label == "GE_OP-INT") {
		ret += "\tsge $s0, $s0, $s1\n";
	}
	else if(label == "GT-INT") {
		ret += "\tsgt $s0, $s0, $s1\n";
	}
	else if(label == "PLUS-INT") {
		ret += "\tadd $s0, $s0, $s1\n";
	}
	else if(label == "MINUS-INT") {
		ret += "\tsub $s0, $s0, $s1\n";
	}
	else if(label == "MULT-INT") {
		ret += "\tmul $s0, $s0, $s1\n";
	}
    else if(label == "DIV-INT") {
        ret += "\tdiv $s0, $s0, $s1\n";
    }
	ret += "\tsw $s0, 0($sp)\n\n";

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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string Assign::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	ret += child2->generate_code(lstt, 0);
	ret += child1->generate_code(lstt, 1);

    // load child1 from stack into $s0 and sp+=4
    ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n";
    
    // copy width bytes from current sp to $s0
    
    
    // TODO check this with Maloo
    int struct_width = child2->type.getWidth();
    ret += "# " + to_string(struct_width) + " bytes to be copied due to assignment operator\n";    
    
    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*i) + "($sp)\n";
        ret += "\tsw $s1, " + to_string((-1)*i) + "($s0)\n";
    }

    ret += "\n";

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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << " (" << label;
	child1 ->print();
	for(int i=0; i < children.size(); i++){
		cerr << ") (";
		children[i] ->print();
	}
	cerr << ") " << endl;
}

string Funcall::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";

    if (child1->value == "printf") {
        // do a syscall for each stringconst, float, int in the children
        for (int i=0; i<children.size(); i++) {
            if (children[i]->label == "StringConst") {
                ret += "\tla $a0, " + children[i]->string_label + "\n\taddi $v0, $0, 4\n\tsyscall\n";
            } else if (children[i]->label == "IntConst") {
                ret += "\taddi $a0, $0, " + children[i]->value + "\n\taddi $v0, $0, 1\n\tsyscall\n";
            } else if (children[i]->label == "FloatConst") {
                ret += "\tli.s $f12, " + children[i]->value + "\n\taddi $v0, $0, 2\n\tsyscall\n";                
            } else if (children[i]->label == "Id") {
                string type = lstt.getEntry(children[i]->value).symbol_type.type;
                if (type == "int") {
                    ret += "# printf prints an int identifier\n";
                    ret += children[i]->generate_code(lstt, 0);
                    ret += "\tlw $a0, 0($sp)\n\taddi $sp, $sp, 4\n";
                    ret += "\taddi $v0, $0, 1\n\tsyscall\n";
                } else if (type == "float") {
                    ret += "# printf prints a float identifier\n";
                    ret += children[i]->generate_code(lstt, 0);
                    ret += "\tl.s $f12, 0($sp)\n\taddi $sp, $sp, 4\n";
                    ret += "\taddi $v0, $0, 2\n\tsyscall\n";
                }
            } else {
                // TODO do it for the case that the expression is a float
                ret += "# printf prints an expression\n";
                ret += children[i]->generate_code(lstt, 0);
                ret += "\tlw $a0, 0($sp)\n\taddi $sp, $sp, 4\n";
                ret += "\taddi $v0, $0, 1\n\tsyscall\n";
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
        
       // TODO check if the parameter is passed by reference in the function definition in the GST
        if(children[i]->type.vec.size()>0){
        	if(lstt.getEntry(children[i]->value).symbol_scope!="param"){
	        	ret += children[i]->generate_code(lstt, 1);
        	}
	        else {
		        ret += children[i]->generate_code(lstt, 0);
	        }
        }
	    else{
	        ret += children[i]->generate_code(lstt, 0);
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr<< label << value;
}

// TODO float typecasting for FloatConst generate_code
string FloatConst::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
    if (location) ret += "#trying to get location of read only data\n";
	return ret += "\tli.s $f0, " + value + "\n\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
}

void FloatConst::assignReg() {
	reqReg = 0;
}

IntConst::IntConst(string value){
	this->label = "IntConst";
	this->value = value;
}

void IntConst::print(){
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << value;
}

string IntConst::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
    if (location) ret += "#trying to get location of read only data\n";
    ret += "\taddi $s0, $0, " + value + "\n\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
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
	cerr << "#";
	type.print();
	cerr << "#";
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
	cerr << "#";
	type.print();
	cerr << "#";
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string Member::generate_code(const LocalSymbolTable& lstt, bool location) {
    string ret = "";

    // left wale pe location chahiye
    ret += child1->generate_code(lstt, 1);
    
    // no need to generate code for child2 (it is an identifier), need it for calculating the offset

    // look child1->type.type up in the lst; child2 ka offset nikalo is struct k liye
    int offset = gst.getLst(child1->type.type).getEntry(child2->value).offset;

    ret += "\tlw $s0, 0($sp)\n\taddi $s1, $s1," + to_string(offset) + "\n\tadd $s0, $s0, $s1\n";
    
    if (location) {
        // push to stack sum of the return values of stack
        ret += "\tsw $s0, 0($sp)\n\n";
    } else {
        int struct_width = type.getWidth();
        ret += "# struct_width found to be " + to_string(struct_width) + "\n";

        // invalidate the child1 stored in the stack ;)
        if (struct_width != 4)
            ret += "\taddi $sp, $sp, " + to_string((-1)*(struct_width-4)) + "\n";

        // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
        for (int i=0; i<struct_width; i += 4) {
            ret += "\tlw $s1, " + to_string((-1)*(struct_width-4-i)) + "($s0)\n";
            ret += "\tsw $s1, " + to_string(i) + "($sp)\n";
        }

        ret += "\n";

        return ret;
    }	
}

void Member::assignReg() {
	
}

Arrow::Arrow(ExpAst* child1, RefAst* child2){
	this->label = "Arrow";
	this->child1 = child1;
	this->child2 = child2;
}

void Arrow::print(){
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label <<" (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string Arrow::generate_code(const LocalSymbolTable& lstt, bool location) {
    string ret = "";

    // left wale pe location chahiye
    ret += child1->generate_code(lstt, 0);
    
    // no need to generate code for child2 (it is an identifier), need it for calculating the offset
    
    // look up child1->type.type in the lst; child2 ka offset nikalo is struct k liye
    int offset = gst.getLst(child1->type.type).getEntry(child2->value).offset;

    ret += "\tlw $s0, 0($sp)\n\taddi $s1, $s1," + to_string(offset) + "\n\tadd $s0, $s0, $s1\n";
    
    if (location) {
        // push to stack sum of the return values of stack
        ret += "\tsw $s0, 0($sp)\n\n";
    } else {
        int struct_width = type.getWidth();
        ret += "# struct_width found to be " + to_string(struct_width) + "\n";

        // invalidate the child1 stored in the stack ;)
        if (struct_width != 4)
            ret += "\taddi $sp, $sp, " + to_string((-1)*(struct_width-4)) + "\n";

        // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
        for (int i=0; i<struct_width; i += 4) {
            ret += "\tlw $s1, " + to_string((-1)*(struct_width-4-i)) + "($s0)\n";
            ret += "\tsw $s1, " + to_string(i) + "($sp)\n";
        }
        
        ret += "\n";
        
        return ret;
    }
}

void Arrow::assignReg() {
	
}

Deref::Deref(ExpAst* child1){
	label = "Deref";
	this->child1 = child1;
}

void Deref::print(){
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr<<") ";
}

string Deref::generate_code(const LocalSymbolTable& lstt, bool location) {
    string ret = "";
    ret += child1->generate_code(lstt, 0);
    
    if (location) return ret;
    
    ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n";

    int struct_width = type.getWidth();   // TODO initialize this value
    ret += "# struct_width found to be " + to_string(struct_width) + "\n";

    // invalidate the child1 stored in the stack ;)
    if (struct_width != 4)
        ret += "\taddi $sp, $sp, " + to_string((-1)*(struct_width-4)) + "\n";

    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*(struct_width-4-i)) + "($s0)\n";
        ret += "\tsw $s1, " + to_string(i) + "($sp)\n";
    }

    ret += "\n";

    return ret;
}

void Deref::assignReg() {
	
}

Identifier::Identifier(string value){
	label = "Id";
	this->value = value;
}

void Identifier::print(){
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " \"" << value << "\"";
}

string Identifier::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	if (!location) {
		int varoffset = lstt.getEntry(value).offset;
        
        if (lstt.getEntry(value).symbol_type.type == "int") {
            ret += "\tlw $s0, " + to_string(varoffset) + "($fp)\n";
            ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
        } else {
            ret += "\tl.s $f0, " + to_string(varoffset) + "($fp)\n";
            ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
        }
        
	}	else {
        // return the l-value for the identifier
		// get the address of this identifier on the stack and push that on the stack
        int varoffset = lstt.getEntry(value).offset;
		ret += "\taddi $s0, $fp, " + to_string(varoffset) + "\n\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
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
	cerr << "#";
	type.print();
	cerr << "#";
	cerr << label << " (";
	child1 ->print();
	cerr << ") (";
	child2 ->print();
	cerr<<") ";
}

string ArrayRef::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
    
    // if array is local, location = 1 for child1, = 0 otherwise
    abstract_astnode* t = child1;
	while(t->label!="Id") t = t->child1;
	string id = t->value;

    if (lstt.getEntry(id).symbol_scope=="local") {
        ret += "#local array found\n";
        ret += child1->generate_code(lstt, 1);
    }
    else {
        ret += "#param array found\n";
        ret += child1->generate_code(lstt, 0);
    }

    ret += child2->generate_code(lstt, 0);

    // TODO find equivalent to_integer in C++ 11
    int n=1;
    for(int i=0; i<type.vec.size(); i++)
        n = n*stoi(type.vec[i]);

    n *= type.getWidth();
    ret += "# found offset to be " + to_string(n) +"\n";
    
    // computing the address of the array reference
    ret += "\tlw $s0, 4($sp)\n\tlw $s1, 0($sp)\n\taddi $s2, $0, " + to_string((-1)*n) + "\n\tmul $s1, $s1, $s2\n";
    ret += "\tadd $s0, $s0, $s1\n";
    
    if (!location) {
        // compute the width of the arrayref thing
        int struct_width = type.getWidth(); 
        ret += "# struct_width found to be " + to_string(struct_width) + "\n";

        // invalidate the child1 stored in the stack ;)
        if (struct_width == 4)
            ret += "\taddi $sp, $sp, 4\n";
        if (struct_width > 8)
            ret += "\taddi $sp, $sp, " + to_string((-1)*(struct_width-8)) + "\n";

        // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
        for (int i=0; i<struct_width; i += 4) {
            ret += "\tlw $s1, " + to_string((-1)*(struct_width-4-i)) + "($s0)\n";
            ret += "\tsw $s1, " + to_string(i) + "($sp)\n";
        }
        
        ret += "\n";
                                       
    } else {
        ret += "\taddi $sp, $sp, 4\n\tsw $s0, 0($sp)\n\n";
    }
    return ret;
}

void ArrayRef::assignReg() {
	
}