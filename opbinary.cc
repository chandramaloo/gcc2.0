string OpBinary::generate_code(const LocalSymbolTable& lstt, bool location) {
	string ret = "";
	ret += child1->generate_code(lstt, 0);
	ret += child2->generate_code(lstt, 0);
	// pop the two children from stack and perform the binary operation
    if (type.type == "int") {
        ret += "\tlw $s0, 4($sp)\n\tlw $s1 0($sp)\n\taddi $sp, $sp, 4\n";
        
        if (label == "OR") {
            ret += "\tor $s0, $s0, $s1\n";
        } else if (label == "AND") {
            ret += "\tand $s0, $s0, $s1\n";
        } else if (label == "EQ") {
            ret += "\tseq $s0, $s0, $s1\n";
        } else if (label == "NE") {
            ret += "\tsne $s0, $s0, $s1\n";
        } else if (label == "LT-INT") {
            ret += "\tslt $s0, $s0, $s1\n";
        } else if (label == "LE_OP-INT") {
            ret += "\tsle $s0, $s0, $s1\n";
        } else if (label == "GE_OP-INT") {
            ret += "\tsge $s0, $s0, $s1\n";
        } else if (label == "GT-INT") {
            ret += "\tsgt $s0, $s0, $s1\n";
        } else if (label == "PLUS-INT") {
            ret += "\tadd $s0, $s0, $s1\n";
        } else if (label == "MINUS-INT") {
            ret += "\tsub $s0, $s0, $s1\n";
        } else if (label == "MULT-INT") {
            ret += "\tmul $s0, $s0, $s1\n";
        } else if (label == "DIV-INT") {
            ret += "\tdiv $s0, $s0, $s1\n";
        }

        ret += "\tsw $s0, 0($sp)\n\n";
        
        return ret;
    } 
//        else {
//        // convert to float if necessary
//        if (child1->type.type == "int") {
//            ret += "\tlw $s0, 4($sp\n)";
//            ret += "\tmtc1 $s0, $f0;\n\tcvt.s.w $f0, $f0\n";
//        } else 
//            ret += "\tr.s $f0, 4($sp)\n";
//
//        if (child2->type.type == "int") {
//            ret += "\tlw $s1, 0($sp\n)";
//            ret += "\tmtc1 $s1, $f1;\n\tcvt.s.w $f1, $f1\n";        
//        } else 
//            ret += "\tr.s $f1, 0($sp)\n";
//
//        ret += "addi $sp, $sp, 8";
//    
//        if (label == "PLUS-FLOAT") {
//            ret += "\tadd.s $f0, $f0, $f1\n";
//            ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n";
//        } else if (label == "MINUS-FLOAT") {
//            ret += "\tsub.s $s0, $s0, $s1\n";
//            ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n";
//        } else if (label == "MULT-INT") {
//            ret += "\tmul.s $s0, $s0, $s1\n";
//            ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n";
//        } else if (label == "DIV-INT") {
//            ret += "\tdiv.s $s0, $s0, $s1\n";
//            ret += "\taddi $sp, $sp, -4\n\ts.s $f0, 0($sp)\n";
//        } else {
//            if (label == "LT-FLOAT") {
//                ret += "\tc.lt.s $s0, $s0, $s1\n";
//            } else if (label == "LE_OP-FLOAT") {
//                ret += "\tc.le.s $s0, $s1\n";
//            } else if (label == "GE_OP-FLOAT") {
//                ret += "\tc.lt.s $s1, $s0\n";
//            } else if (label == "GT-FLOAT") {
//                ret += "\tc.le.s $s1, $s0\n";
//            }
//            
////            string label = newlabel(), label2 = newlabel(), label3 = newlabel();
//            ret += "\tcfc1 $s0, $25\n\tandi $s0, 1\n";
//            ret += "\taddi $sp, $sp, -4\n\tsw $s0, 0($sp)\n";
//            
//            return ret;
//        }
//        if (label == "OR") {
//            ret += "\tor $s0, $s0, $s1\n";
//        } else if (label == "AND") {
//            ret += "\tand $s0, $s0, $s1\n";
//        } else if (label == "EQ") {
//            ret += "\tc.eq.s $s0, $s1\n";
//        } else if (label == "NE") {
//            ret += "\tsne $s0, $s0, $s1\n";
//        }
//
//    }
//	return ret;
}

