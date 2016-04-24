string OpBinary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	ret += child1->generate_code(lstt, 0);
	ret += child2->generate_code(lstt, 0);
    
    // pop the two children from stack and perform the binary operation
	ret += "\tlw $s0, 4($sp)\n\tlw $s1 0($sp)\n\taddi $sp, $sp, 8\n";

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

	ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";

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
    int struct_width = child2->type.getWidth();
    ret += "# " + to_string(struct_width) + " bytes to be copied due to assignment operator\n";    
    
    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string(struct_width-i-4) + "($sp)\n";
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
        if(children[i]->type.vec.size()>0)
        	ret += children[i]->generate_code(lstt, 1);
	    else
	        ret += children[i]->generate_code(lstt, 0);
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
	return "\tli.s $f0, " + value + "\n\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n\n";
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

    ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n\taddi $s0, $s0," + to_string(offset) + "\n";
    
    if (location) {
        // push to stack sum of the return values of stack
        ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
        
        return ret;
    }

    int struct_width = type.getWidth();
    ret += "# struct_width found to be " + to_string(struct_width) + "\n";

    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*i) + "($s0)\n";
        ret += "\tsw $s1, " + to_string((-1)*i) + "($sp)\n";
    }

    ret += "\taddi $sp, $sp, " + to_string((-1)*struct_width) + "\n";

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

    // pop the address of child1 and add the offset to get the address of child1->child2
    ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n\taddi $s0, $s0," + to_string(offset) + "\n";
    
    if (location) {
        // push to stack sum of the return values of stack
        ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
        return ret;
    }

    int struct_width = type.getWidth();
    ret += "# struct_width found to be " + to_string(struct_width) + "\n";

    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*i) + "($s0)\n";
        ret += "\tsw $s1, " + to_string((-1)*i) + "($sp)\n";
    }

    ret += "addi $sp, $sp, " + to_string((-1)*struct_width) + "\n";

    return ret;

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

    // if location, no need to deref the child1
    if (location) return ret;

    // if not, pop the address from the stack
    ret += "\tlw $s0, 0($sp)\n\taddi $sp, $sp, 4\n";

    int struct_width = type.getWidth();   // TODO initialize this value
    ret += "# struct_width found to be " + to_string(struct_width) + "\n";

    // if it is a struct, need to copy struct_width number of bytes starting from $s0
    for (int i=1; i<=struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*i) + "($s0)\n";
        ret += "\tsw $s1, " + to_string((-1)*i) + "($sp)\n";
    }
    
    ret += "addi $sp, $sp, " + to_string((-1)*struct_width) + "\n\n";
    
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

    if (location) {
        // return the l-value for the identifier
		// get the address of this identifier on the stack and push that on the stack
        int varoffset = lstt.getEntry(value).offset;
		ret += "\taddi $s0, $fp, " + to_string(varoffset) + "\n\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";        
        return ret;
    }
    
    int varoffset = lstt.getEntry(value).offset;

    // get the width of the identifier
    int struct_width = type.getWidth();

    for (int i=1; i<=struct_width; i+=4) {
        ret += "\tlw $s0, " + to_string(varoffset - i) + "($fp)\n";
        ret += "\tsw $s0, " + to_string((-1)*i) + "($sp)\n\n";
    }

    ret += "\taddi $sp, $sp, " + to_string((-1)*struct_width) + "\n";

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
    ret += "\tlw $s0, 4($sp)\n\tlw $s1, 0($sp)\n\taddi $sp, $sp, 8\n\taddi $s2, $0, " + to_string((-1)*n) + "\n\tmul $s1, $s1, $s2\n";
    ret += "\tadd $s0, $s0, $s1\n";
    
    if (location) {
        ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n\n";
        return ret;
    }
    
    // compute the width of the arrayref thing
    int struct_width = type.getWidth(); 
    ret += "# struct_width found to be " + to_string(struct_width) + "\n";

    // if it is a struct, need to copy struct->width number of bytes starting from the address in $s0 generated above
    for (int i=0; i<struct_width; i += 4) {
        ret += "\tlw $s1, " + to_string((-1)*i) + "($s0)\n";
        ret += "\tsw $s1, " + to_string((-1)*i) + "($sp)\n";
    }

    ret += "\taddi $sp, $sp, " + to_string((-1)*struct_width) + "\n\n";
                              
    return ret;
}

void ArrayRef::assignReg() {
	
}