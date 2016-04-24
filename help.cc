

string putVarOnStack(const SymTabEntry& st){
	string ret = "";
	if(st.symbol_type.ptr){
	//	ret += "addi $sp, $sp, -4\nlw $s0, " + to_string(st.offset) + "($fp)\nsw $s0, 0($sp)";
	}
	else if(true){
	//	ret += "addi $sp, $sp, -" + to_string(st.width) + "\n*($sp) = " + to_string(st.offset) + "($ebp)\n";
	}

	if (!location) {
		int varoffset = lstt.getEntry(value).offset;
		ret+= "\tlw $s0, " + to_string(varoffset) + "($fp)\n";
		ret = "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n";
	}	else {
		int varoffset = lstt.getEntry(value).offset;
		ret = "\taddi $s0, $fp, " + to_string(varoffset) + "\n\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n";
		//	ret+= "lw $s0, " + to_string(varoffset) + "($fp)\n";
		// get the address of this identifier on the stack and push that on the stack
	}
}


string Funcall::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";

	// get the width of the function return value from the gst using child1 as identifier
	int rv_width = gst.getLst(child1->value).meta->symbol_type.getWidth();
	// get the total width of the function parameters
	int f_width = gst.getLst(child1->value).meta->width;
	// get space on the stack
	ret += "subi $sp, $sp, " + to_string(rv_width+f_width) + "\n";
	
	// push the paramters on the stack
	int varoffset = 0, paramoffset = 0;
	for(int i=0; i<children.size(); i++){
		abstract_astnode* temp = children[i];
		while(temp->label!="Id") temp = temp->child1;
		string id = temp->value;
		// could be int/float/*/struct
		if(children[i]->type.ptr!=0){
			if(children[i]->type.vec.size()==0){
				if(lstt.getType(id).ptr == children[i]->type.ptr){
					varoffset = lstt.getEntry(id).offset;
					ret+= "lw $s0, " + to_string(varoffset) + "($fp)\n";
					ret+= "sw $s0, " + to_string(paramoffset) + "($sp)\n";
					paramoffset += 4;
				}
				else{
					varoffset = lstt.getEntry(id).offset;
					ret+= "\taddi $s0, $fp, " + to_string(varoffset) + "\n";
					ret+= "\tsw $s0, " + to_string(paramoffset) + "($sp)\n";
					paramoffset += 4;
				}
			}
			else {
				if(lstt.getType(id).vec.size() == children[i]->type.vec.size()){

				}
				else{

				}
			}
		}
		else if(children[i]->type.isStruct){
			vector<SymTabEntry> rows = gst.getLst(lstt.getType(id).type).rows;
			for(int j=0; j<rows.size(); j++){
				varoffset = lstt.getEntry(id).offset;
				ret+= "lw $s0, " + to_string(varoffset + rows[j].offset) + "($fp)\n";
				ret+= "sw $s0, " + to_string(paramoffset) + "($sp)\n";
				paramoffset += rows[j].width;
			}
		}
		else {
			varoffset = lstt.getEntry(id).offset;
			ret+= "lw $s0, " + to_string(varoffset) + "($fp)\n";
			ret+= "sw $s0, " + to_string(paramoffset) + "($sp)\n";
			paramoffset += lstt.getType(id).getWidth();
		}
	}

	// call the function
	ret += "jal " + child1->value + "\n";

	// pop the parameters from the stack
	ret += "addi $sp, $sp, " + to_string(rv_width+f_width) + "\n";
	
	return ret;
}


string OpBinary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	if(child1->reqReg < child2->reqReg){
		ret += child2->generate_code(lstt, 0);
		ret += child1->generate_code(lstt, 0);
	} else {
		ret += child1->generate_code(lstt, 0);
		ret += child2->generate_code(lstt, 0);
	}
	// pop the two children from stack and perform the binary operation
	ret += "lw $s0, 4($sp)\nlw $s1 0($sp)\naddi $sp, $sp, 4\n";

	if(label == "OR") {
		ret += "or $s0, $s0, $s1\n";
	}
	else if(label == "AND") {
		ret += "and $s0, $s0, $s1\n";
	}
	else if(label == "EQ") {
		ret += "seq $s0, $s0, $s1\n";
	}
	else if(label == "NE") {
		ret += "sne $s0, $s0, $s1\n";
	}
	else if(label == "LT-INT") {
		ret += "slt $s0, $s0, $s1\n";
	}
	else if(label == "LE_OP-INT") {
		ret += "sle $s0, $s0, $s1\n";
	}
	else if(label == "GE_OP-INT") {
		ret += "sge $s0, $s0, $s1\n";
	}
	else if(label == "GT-INT") {
		ret += "sgt $s0, $s0, $s1\n";
	}
	else if(label == "PLUS-INT") {
		ret += "add $s0, $s0, $s1\n";
	}
	else if(label == "MINUS-INT") {
		ret += "sub $s0, $s0, $s1\n";
	}
	else if(label == "MULT-INT") {
		ret += "mul $s0, $s0, $s1\n";
	}

	ret += "sw $s0, 0($sp)\n";

	return ret;
}