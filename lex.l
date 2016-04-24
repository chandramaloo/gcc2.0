
// There may be some flexer directives here

%%
[ \t]                                    //skip
[\n]																	lcount++;
"void"																	return Parser::VOID;
"float"																	return Parser::FLOAT;
"struct"																return Parser::STRUCT;
([1-9][0-9]*)|0|(0[bB][01]+)|(0[0-7]+)|(0[xX][0-9a-fA-F]+)				{Parser::d_val__ = std::string (matched());   return ParserBase::INT_CONSTANT;}  
(([0-9]+)(\.)([0-9]*)(([eE][+-][0-9]+)|([eE][0-9]+))?)|(([0-9]*)(\.)([0-9]+)(([eE][+-][0-9]+)|([eE][0-9]+))?)	{Parser::d_val__ = std::string (matched());   return ParserBase::FLOAT_CONSTANT;}  
"return"																return Parser::RETURN;
"||"																	return Parser::OR_OP;
"&&"																	return Parser::AND_OP;
"=="																	return Parser::EQ_OP;
"!="																	return Parser::NE_OP;
"<="																	return Parser::LE_OP;
">="																	return Parser::GE_OP;
"++"																	return Parser::INC_OP;
"->"																	return Parser::PTR_OP;
"if"																	return Parser::IF;
"else"																	return Parser::ELSE;
"while"																	return Parser::WHILE;
"for"																	return Parser::FOR;
"int"																	return Parser::INT;
"<"																		return '<';
">"																		return '>';
"."																		return '.';
"="								                                        return '=';
"+"								                                        return '+';
"-"								                                        return '-';
"*"								                                        return '*';
"/"								                                        return '/';
"&"								                                        return '&';
"!"																		return '!';
","                                         							return ',';
"("                                        								return '(';
")"								                               		    return ')';
"["                                        								return '[';
"]"								                                        return ']';
"{"                                        								return '{';
"}"								                                        return '}';
";"                                        								return ';';
":"                                        								return ':';
[[:alpha:]_][[:alnum:]_]*												{Parser::d_val__ = std::string (matched());   return ParserBase::IDENTIFIER;}  
\"([^\"\\]*)((((\\\\)|(\\\")|(\\t)|(\\n))([^\\\"]*))*)\"				{Parser::d_val__ = std::string (matched());   return ParserBase::STRING_LITERAL;}  
