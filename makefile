file = test.c
file_s = test.s

all:    Scanner.ih Scanner.h Scannerbase.h lex.cc parse.cc main.cc Parser.h Parserbase.h Parser.ih
	@echo "Running the program..."
	g++   --std=c++0x lex.cc parse.cc main.cc -o parser
	@echo "\nOutput:"
	@./parser < $(file)  > /dev/null


Scanner.ih: lex.l
	@if [ ! -e Scanner.ih ]; then \
		flexc++ lex.l;\
        sed -i '/include/a #include "Parserbase.h"\nextern int lcount;' Scanner.ih; \
	fi

parse.cc Parser.h Parserbase.h Parser.ih: parse.y
	@bisonc++ --construction -V parse.y;
	@sed -i '/#include/a stack<string> tstack, ftstack;\nqueue<pair<string, string> > const_strings;\nvector<abstract_astnode* > nodePtr;\nGlobalSymbolTable gst;\nLocalSymbolTable lst;\nSymTabEntry* ste = new SymTabEntry();\nstring file = "$(file)", file_s = "$(file_s)", tempType;\nbool isStruct = false, isFunc = false;\nvector<int> arr;\nint currentDepth = 0, lcount=1, tempWidth, varOffset= -4, paramOffset = 8, labelcount=0;\n' Parser.ih;
	@sed -i '/insert preincludes/a #include "ast.h"' Parserbase.h;
	@sed -i '\|STYPE__     d_val__;| d' Parserbase.h;
	@sed -i '\|typedef Meta__::SType STYPE__;| a \\tpublic: static STYPE__  d_val__; ' Parserbase.h;
	@sed -i '/include "Parser.ih"/a #include "ast.cc"' parse.cc;
	@sed -i '\|void Parser::print__()| i Meta__::SType ParserBase::d_val__; ' parse.cc


.PHONY: clean
clean:
	$(RM) Parser.ih Parser.h Parserbase.h parse.cc Scanner.ih Scanner.h Scannerbase.h lex.cc parse.y.output a.out graph.ps output parser *~
