%scanner Scanner.h
%scanner-token-function d_scanner.lex()

%token VOID FLOAT STRUCT PTR_OP IDENTIFIER INT_CONSTANT FLOAT_CONSTANT RETURN OR_OP AND_OP EQ_OP NE_OP LE_OP GE_OP INC_OP STRING_LITERAL IF ELSE WHILE FOR INT

%polymorphic String : std::string; BaseClass : abstract_astnode *; vExpAstClass : vector<ExpAst*>; RefAstClass : RefAst*; ExpAstClass : ExpAst*; StmtAstClass : StmtAst*; vSymTabEntry : vector<SymTabEntry>; SymTabEntryClass : SymTabEntry;

%type <String> INT_CONSTANT
%type <String> FLOAT_CONSTANT
%type <String> STRING_LITERAL IDENTIFIER
%type <BaseClass> translation_unit
%type <BaseClass> struct_specifier
%type <BaseClass> function_definition
%type <String> type_specifier
%type <vSymTabEntry> parameter_list
%type <SymTabEntryClass> parameter_declaration
%type <BaseClass> declarator
%type <StmtAstClass> compound_statement
%type <StmtAstClass> statement_list
%type <StmtAstClass> statement
%type <StmtAstClass> assignment_statement
%type <ExpAstClass> expression
%type <ExpAstClass> logical_or_expression
%type <ExpAstClass> logical_and_expression
%type <ExpAstClass> equality_expression
%type <ExpAstClass> relational_expression
%type <ExpAstClass> additive_expression
%type <ExpAstClass> multiplicative_expression
%type <ExpAstClass> unary_expression
%type <ExpAstClass> postfix_expression
%type <ExpAstClass> primary_expression
%type <vExpAstClass> expression_list
%type <String> unary_operator
%type <StmtAstClass> selection_statement
%type <StmtAstClass> iteration_statement
%type <BaseClass> declaration
%type <BaseClass> declaration_list
%type <vSymTabEntry> declarator_list

%debug

%%

translation_unit 
	:  struct_specifier
		{
			gst.addLocalSymbolTable(lst.meta->symbol_name, lst);
			lst.clean();
			isStruct = false;
			varOffset = -4; paramOffset = 8;
		}
	| function_definition 
		{
			gst.addLocalSymbolTable(lst.meta->symbol_name, lst);
			lst.clean();
			isFunc = false;
			varOffset = -4; paramOffset = 8;
		}
	| translation_unit function_definition 
		{
			gst.addLocalSymbolTable(lst.meta->symbol_name, lst);
			lst.clean();
			isFunc = false;
			varOffset = -4; paramOffset = 8;
		}
	| translation_unit struct_specifier
		{
			gst.addLocalSymbolTable(lst.meta->symbol_name, lst);
			lst.clean();
			isStruct = false;
			varOffset = -4; paramOffset = 8;
		}
	;

struct_specifier 
	: STRUCT IDENTIFIER '{' declaration_list '}' ';'
		{
			lst.meta->symbol_name = $2;
			lst.meta->symbol_class = "struct";
			lst.meta->symbol_scope = "global";
			lst.meta->symbol_type.type = "-";
			lst.meta->symbol_type.isStruct = true;
			lst.meta->width = 0 - 4 - varOffset;
			lst.meta->offset = 0;
			lst.checkStructContents();
		}
	;

function_definition
	: type_specifier fun_declarator compound_statement
		{
			lst.meta->symbol_type.type = $1;
			lst.meta->symbol_class = "fun";
			lst.meta->symbol_scope = "global";
			lst.meta->width = paramOffset - 8;
			lst.meta->offset = 0;
			lst.adjustParamOffset();
		}
	;

type_specifier
	: VOID 	                 // that gets associated with each identifier
		{
			if(lst.meta->symbol_type.type=="")
				lst.meta->symbol_type.type = "void";
			ste->symbol_type.type = "void";
			$$ = "void";
			tempType = $$;
			isStruct = false;
			tempWidth = 0;
		}
	| INT   
		{
			if(lst.meta->symbol_type.type=="")
				lst.meta->symbol_type.type = "int";
			ste->symbol_type.type = "int";
			$$ = "int";
			ste->width = 4;
			tempType = $$;
			isStruct = false;
			tempWidth = 4;
		}
	| FLOAT 
		{
			if(lst.meta->symbol_type.type=="")
				lst.meta->symbol_type.type = "float";
			ste->symbol_type.type = "float";
			$$ = "float";
			ste->width = 4;
			tempType = $$;
			isStruct = false;
			tempWidth = 4;	
		}
	| STRUCT IDENTIFIER
		{
			// check if this identifier is present in gst yet
			if(lst.meta->symbol_type.type=="")
				lst.meta->symbol_type.type = $2;
			if(isFunc){
				if(!gst.containsFun($2)){
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: storage size of variable of 'struct " << $2 << "' isn't known\n";
					exit(0);
				}
			}
			ste->symbol_type.type = $2;
			ste->symbol_type.isStruct = true;
			$$ = $2;
			tempType = $$;
			isStruct = true;
			ste->width = gst.getLst($2).meta->width;
			tempWidth = ste->width;
		}
	;

fun_declarator
	: IDENTIFIER '(' parameter_list ')' 
		{
			isFunc = true;
			lst.meta->symbol_name = $1;
			lst.addParams($3);
		}
	| IDENTIFIER '(' ')' 
		{
			isFunc = true;
			lst.meta->symbol_name = $1;
		}
	| '*' fun_declarator  //The * is associated with the function name
		{
			isFunc = true;
			lst.meta->symbol_type.ptr++;
		}
	;

parameter_list
	: parameter_declaration{
		if(lst.contains(ste->symbol_name)){
			cerr << file <<": In function '" << lst.meta->symbol_name << "':\n";
			cerr << file << ":line " << lcount << ": error: the variable '" << ste->symbol_name << "' has already been defined\n";
			exit(0);
		}
		ste->symbol_scope = "param";
		ste->symbol_class = "var";
		ste->offset = paramOffset;
		setArrayWidth(ste->symbol_type.vec);
		ste->width = ste->symbol_type.getWidth();
		vector<SymTabEntry> temp;
		temp.push_back(*ste);
		paramOffset += ste->width;
		$$ = temp;
		delete ste;
		ste = new SymTabEntry();
	}
	| parameter_list ',' parameter_declaration {
		if(lst.contains(ste->symbol_name)){
			cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			cerr << file << ":line " << lcount << ": error: the variable '" << ste->symbol_name << "' has already been defined\n";
			exit(0);
		}
		ste->symbol_scope = "param";
		ste->symbol_class = "var";
		ste->offset = paramOffset;
		setArrayWidth(ste->symbol_type.vec);
		ste->width = ste->symbol_type.getWidth();
		vector<SymTabEntry> temp = $1;
		temp.push_back(*ste);
		paramOffset += ste->width;
		$$ = temp;
		delete ste;
		ste = new SymTabEntry();
	}
	;

parameter_declaration
	: type_specifier declarator {
		if($1=="void" && ste->symbol_type.ptr==0){
			cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			cerr << file << ":line " << lcount << ": error: cannot have function parameter of type void\n";
			exit(0);
		}
	}
	;

declarator
	: IDENTIFIER
		{
			ste->symbol_name = $1;
		}
	| declarator '[' primary_expression ']'
		{
			ExpAst* temp3 = $3;
			if(temp3->type.type!="int" || (temp3->type.ptr + temp3->type.vec.size())!=0){
				cerr << file << ": In function '" << lst.meta->symbol_name + "':\n";
				cerr << file << ":line " << lcount << ": error: size of array should be an integer\n";
				exit(0);
			}
			ste->symbol_type.vec.push_back(temp3->value);
		}
	| '*' declarator 
		{
			ste->symbol_type.ptr++;
			ste->width = 4;
		}
	;

declaration_list
	: declaration
		{
			if(!isFunc)
				isStruct = true;
		}
	| declaration_list declaration
		{
			if(!isFunc)
				isStruct = true;
		}
	;

declaration
	: type_specifier declarator_list';'{
		lst.addParams($2);
		delete ste;
		ste = new SymTabEntry();
	}
	;

declarator_list
	: declarator{
		if(lst.contains(ste->symbol_name)){
			if(isFunc)
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			else
				cerr << file << ": In struct definition\n";
			cerr << file << ":line " << lcount << ": error: the variable '" << ste->symbol_name << "' has already been defined\n";
			exit(0);
		}
		if(ste->symbol_type.type=="void" && ste->symbol_type.ptr==0){
			if(isFunc)
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			else
				cerr << file << ": In struct definition\n";
			cerr << file << ":line " << lcount << ": error: cannot declare variable of type void\n";
			exit(0);
		}
		ste->symbol_scope = "local";
		ste->symbol_class = "var";
		ste->offset = varOffset;
		setArrayWidth(ste->symbol_type.vec);
		vector<SymTabEntry> temp;
		temp.push_back(*ste);
		varOffset-= ste->width;
		$$ = temp;
		delete ste;
		ste = new SymTabEntry();
		ste->symbol_type.type = tempType;
		ste->symbol_type.isStruct = isStruct;
		ste->width = tempWidth;
	}
	| declarator_list ',' declarator{
		if(lst.contains(ste->symbol_name)){
			if(isFunc)
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			else
				cerr << file << ": In struct definition\n";
			cerr << file << ":line " << lcount << ": error: the variable '" << ste->symbol_name << "' has already been defined\n";
			exit(0);
		}
		if(ste->symbol_type.type=="void" && ste->symbol_type.ptr==0){
			if(isFunc)
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
			else
				cerr << file << ": In struct definition\n";
			cerr << file << ":line " << lcount << ": error: cannot declare variable of type void\n";
			exit(0);
		}
		ste->symbol_scope = "local";
		ste->symbol_class = "var";
		ste->offset = varOffset;
		setArrayWidth(ste->symbol_type.vec);
		vector<SymTabEntry> temp = $1;
		temp.push_back(*ste);
		varOffset-= ste->width;
		$$ = temp;
		delete ste;
		ste = new SymTabEntry();
		ste->symbol_type.type = tempType;
		ste->symbol_type.isStruct = isStruct;
		ste->width = tempWidth;
	}
	;

compound_statement
	: '{' '}' 
		{
			$$ = new Block(lst.meta->symbol_name, new Empty());
			nodePtr.push_back($$);
			cerr << "\nAST of function "<< lst.meta->symbol_name << ":\n";
			$$->print();
		}
	| '{' statement_list '}'
		{
			$$ = new Block(lst.meta->symbol_name, $2);
			nodePtr.push_back($$);
			cerr << "\nAST of function "<< lst.meta->symbol_name << ":\n";
			$$->print();
		} 
	| '{' declaration_list statement_list '}' 
		{
			$$ = new Block(lst.meta->symbol_name, $3);
			nodePtr.push_back($$);
			cerr << "\nAST of function "<< lst.meta->symbol_name << ":\n";
			$$->print();
		} 
	;

statement_list
	: statement
		{
			vector<StmtAst*> temp;
			temp.push_back($1);
			$$ = new Seq(temp);
		}
	| statement_list statement
		{
			($1->children).push_back($2);
			$$ = $1;
		}
	;

statement
	: '{' statement_list '}'  //a solution to the local decl problem
		{
			$$ = $2;	
		}
	| selection_statement
		{
			$$ = $1;
		}
	| iteration_statement
		{
			$$ = $1;
		}
	| assignment_statement
		{
			$$ = $1;
		}
	| RETURN expression ';'
		{
			// type check for function return value
			ExpAst* temp2 = $2;
			if(!(lst.meta->symbol_type.canCast(temp2->type))){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: return type (";
				temp2->type.print();
				cerr << ") not compatible with function return type (";
				lst.meta->symbol_type.print();
				cerr << ")\n";
				exit(0);
			}
			$$ = new Return($2, lst.meta->symbol_name);
		}
	;

assignment_statement
	: ';'
		{
			$$ = new Empty();
		} 								
	|  expression ';'
		{
			$$ = $1;
		}
	;

expression
	: logical_or_expression
		{
			$$ = $1;
		}
	|  unary_expression '=' expression
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(!temp1->lvalue){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: lvalue required as left operand of assignment\n";
				exit(0);
			}
			if(temp3->type.type=="void" && (temp3->type.ptr + temp3->type.vec.size()) == 0){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: void value not ignored as it ought to be\n";
				exit(0);
			}
			if(temp1->type.vec.size() + temp1->type.ptr > 0 && temp1->type.vec.size()){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: cannot make assignment to whole arrays\n";
				exit(0);
			}
			if(temp3->type.vec.size() + temp3->type.ptr > 0 && temp3->type.vec.size()){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: cannot assign whole arrays\n";
				exit(0);
			}
			if(temp1->type.canCast(temp3->type)){
				$$ = new Assign(temp1, temp3);
				$$->type = temp1->type.castType(temp3->type);
			}
			else{
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: incompatible types when assigning to type ‘";
				temp1->type.print();
				cerr << "’ from type ‘";
				temp3->type.print();
				cerr << "’\n";
				exit(0);
			}
		}
	;

logical_or_expression            // The usual hierarchy that starts here...
	: logical_and_expression
		{
			$$ = $1;
		}
	| logical_or_expression OR_OP logical_and_expression
		{
			$$ = new OpBinary("OR", $1, $3);
			$$->type.type="int";
		}
	;

logical_and_expression
	: equality_expression
		{
			$$ = $1;
		}
	| logical_and_expression AND_OP equality_expression 
		{
			$$ = new OpBinary("AND", $1, $3);
			$$->type.type="int";
		}
	;

equality_expression
	: relational_expression
		{
			$$ = $1;
		}
	| equality_expression EQ_OP relational_expression 	
		{
			$$ = new OpBinary("EQ", $1, $3);
			$$->type.type="int";
		}
	| equality_expression NE_OP relational_expression
		{
			$$ = new OpBinary("NE", $1, $3);
			$$->type.type="int";
		}
	;

relational_expression
	: additive_expression
		{
			$$ = $1;
		}
	| relational_expression '<' additive_expression
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("LT-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("LT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("LT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("LT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	| relational_expression '>' additive_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("GT-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("GT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("GT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("GT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	| relational_expression LE_OP additive_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("LE_OP-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("LE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("LE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("LE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	| relational_expression GE_OP additive_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("GE_OP-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("GE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("GE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("GE_OP-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	;

additive_expression 
	: multiplicative_expression
		{
			$$ = $1;
		}
	| additive_expression '+' multiplicative_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("PLUS-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("PLUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("PLUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("PLUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	| additive_expression '-' multiplicative_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("MINUS-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("MINUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("MINUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("MINUS-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	;

multiplicative_expression
	: unary_expression
	{
		$$ = $1;
	}
	| multiplicative_expression '*' unary_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("MULT-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("MULT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("MULT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("MULT-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	| multiplicative_expression '/' unary_expression 
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp1->type.type == "int" && temp3->type.type == "int"){
				$$ = new OpBinary("DIV-INT", temp1, temp3);
				$$->type.type = "int";
			}
			else if(temp1->type.type == "float" && temp3->type.type == "float"){
				$$ = new OpBinary("DIV-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if(temp1->type.type == "int" && temp3->type.type == "float"){
				$$ = new OpBinary("DIV-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
			else if (temp1->type.type == "float" && temp3->type.type == "int"){
				$$ = new OpBinary("DIV-FLOAT", temp1, temp3);
				$$->type.type = "float";
			}
		}
	;

unary_expression
	: postfix_expression
		{
			$$ = $1;
		}
	| unary_operator unary_expression 
		{
			string temp1 = $1;
			ExpAst* temp2 = $2;
			if(temp2->type.type=="void" && temp2->type.ptr==1 && temp1=="Deref"){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: cannot dereference a variable of type void *\n";
				exit(0);
			}
			if(temp1=="UMINUS" || temp1=="NOT" || temp1=="PP"){
				ExpAst* temp = new OpUnary(temp1, temp2);
				temp->lvalue = false;
				temp->value = temp2->value;
				temp->type = temp2->type;
				$$ = temp;
			}
			else if(temp1=="Pointer"){
				ExpAst* temp = new Pointer(temp2);
				temp->lvalue = false;
				temp->value = temp2->value;
				temp->type = temp2->type;
				temp->type.ptr++;
				$$ = temp;
			} 
			else if(temp1=="Deref"){
				RefAst* temp = new Deref(temp2);
				temp->lvalue = true;
				temp->value = temp2->value;
				temp->type = temp2->type;
				temp->type.ptr--;
				$$ = temp;
			}
		}
	;

postfix_expression
	: primary_expression
		{
			$$ = $1;
		}
	| IDENTIFIER '(' ')'
		{
			vector<ExpAst*> empty;
			ExpAst* temp = new Funcall(new Identifier($1), empty);
			temp->lvalue = false;
			if(lst.contains($1)){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: called object ‘"<< $1 <<"’ is not a function or function pointer\n";
				exit(0);
			}
			if(gst.containsFun($1)){
				if(gst.getLst($1).match(empty)){
					temp->type = gst.getLst($1).meta->symbol_type;
					$$ = temp;
				}
				else{
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: too few arguments to function '" << $1 << "'\n";
					exit(0);
				}
			}
			else if(lst.meta->symbol_name==$1){
				if(lst.match(empty)){
					temp->type = lst.meta->symbol_type;
					$$ = temp;
				}
				else{
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: too few arguments to function '" << $1 << "'\n";
					exit(0);
				}
			}
			else{
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: no definitions found for function '" << $1 << "'\n";
				exit(0);
			}
		}
	| IDENTIFIER '(' expression_list ')'
		{
			if(lst.contains($1)){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: called object ‘"<< $1 <<"’ is not a function or function pointer\n";
				exit(0);
			}
			if($1!="printf"){
				ExpAst* temp = new Funcall(new Identifier($1), $3);
				temp->lvalue = false;
				if(!gst.containsFun($1) && lst.meta->symbol_name!=$1){
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: no definitions found for function '" << $1 << "'\n";
					exit(0);
				}
				if(!gst.getLst($1).match($3) && (lst.meta->symbol_name==$1 && !lst.match($3))){
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: no matching call for function '" << $1 << "'\n";
					exit(0);
				}
				if(gst.getLst($1).match($3)){
					temp->type = gst.getLst($1).meta->symbol_type;
				}
				else if(lst.meta->symbol_name==$1 && lst.match($3)){
					temp->type = lst.meta->symbol_type;
				} else{
					cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
					cerr << file << ":line " << lcount << ": error: incompatible type of argument(s) for function '" << $1 << "'\n";
					exit(0);
				}
				$$ = temp;
			}
			else {
				ExpAst* temp = new Funcall(new Identifier($1), $3);
				if(!checkPrintfParams($3)){
					cerr << file << ": In function 'printf':\n";
					cerr << file << ":line " << lcount << ": error: incompatible type of argument(s) for 'printf'\n";
					exit(0);
				}
				temp->lvalue = false;
				temp->type.type = "void";
				$$ = temp;
			}
		}
	| postfix_expression '[' expression ']'
		{
			ExpAst* temp1 = $1;
			ExpAst* temp3 = $3;
			if(temp3->type.type!="int" || (temp3->type.ptr + temp3->type.vec.size())!=0){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: array index should be an integer\n";
				exit(0);
			}
			ExpAst* temp = new ArrayRef(temp1, temp3);
			temp->lvalue = true;
			temp->value = temp1->value;
			temp->type = temp1->type;
			for(int i=0; i<temp->type.vec.size()-1; i++)
				temp->type.vec[i] = temp->type.vec[i+1];
			temp->type.vec.resize(temp->type.vec.size()-1);
			$$ = temp;
		}
	| postfix_expression '.' IDENTIFIER
		{
			ExpAst* temp1 = $1;
			RefAst* temp3 = new Identifier($3);
			temp3->type = gst.getLst(temp1->type.type).getType($3); 
			ExpAst* temp = new Member(temp1, temp3);
			if(!gst.getLst(temp1->type.type).contains($3)){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: 'struct " + temp1->type.type + "' has no member named '" + $3 + "'\n";
				exit(0);
			}
			temp->lvalue = true;
			temp->type = gst.getLst(temp1->type.type).getType($3);
			$$ = temp;
		}
	| postfix_expression PTR_OP IDENTIFIER 
		{
			ExpAst* temp1 = $1;
			RefAst* temp3 = new Identifier($3);
			temp3->type = gst.getLst(temp1->type.type).getType($3); 
			ExpAst* temp = new Arrow(temp1, temp3);
			// it should always be there in lst
			if(!gst.getLst(temp1->type.type).contains($3)){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: 'struct " + temp1->type.type + "' has no member named '" + $3 + "'\n";
				exit(0);
			}
			temp->lvalue = true;
			temp->type = gst.getLst(temp1->type.type).getType($3);
			$$ = temp;
		}
	| postfix_expression INC_OP 	// ... and ends here
		{
			ExpAst* temp1 = $1;
			if(temp1->label != "" && temp1->label != "Id" && temp1->label != "Deref"
			 && temp1->label != "Arrow" && temp1->label != "Member"  && temp1->label != "ArrayRef"
			 && temp1->label != "Pointer"){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: increment operator could be applied only to lvalue\n";
				exit(0);
			}
			ExpAst* temp = new OpUnary("PP", temp1);
			temp->value = temp1->value;
			temp->lvalue = false;
			temp->type = temp1->type;
			$$ = temp;
		}
	;

primary_expression
	: IDENTIFIER
		{
			if(!lst.contains($1)){
				cerr << file << ": In function '" << lst.meta->symbol_name << "':\n";
				cerr << file << ":line " << lcount << ": error: variable " << $1 << " has not been declared\n";
				exit(0);
			}
			ExpAst* temp = new Identifier($1);
			temp->lvalue = true;
			temp->type = lst.getType($1);
			$$ = temp;
		}
	| INT_CONSTANT
		{
			$$ = new IntConst($1);
			$$->lvalue = false;
			$$->type.type = "int";
		}
	| FLOAT_CONSTANT
		{
			$$ = new FloatConst($1);
			$$->lvalue = false;
			$$->type.type = "float";
		}
	| STRING_LITERAL
		{
			$$ = new StringConst($1);
			$$->lvalue = false;
			$$->type.type = "string";
		}
	| '(' expression ')'
		{
			$$ = $2;
			$$->lvalue = false;
		}
	;

expression_list
	: expression
		{
			vector<ExpAst*> temp;
			temp.push_back($1);
			$$ = temp;
		}
	| expression_list ',' expression
		{
			vector<ExpAst*> temp;
			temp = $1;
			temp.push_back($3);
			$$ = temp;
		}
	;

unary_operator
	: '-'
		{
			$$ = "UMINUS";
		}
	| '!' 	
		{
			$$ = "NOT";
		}
	| '&'
		{
			$$ = "Pointer";
		}
	| '*' 	
		{
			$$ = "Deref";
		}
	;

selection_statement
	: IF '(' expression ')' statement ELSE statement 
		{
			$$ = new If($3, $5, $7);
		}
	;

iteration_statement
	: WHILE '(' expression ')' statement 	
		{
			$$ = new While($3, $5);
		}
	| FOR '(' expression ';' expression ';' expression ')' statement
		{
			$$ = new For($3, $5, $7, $9);
		}
	;