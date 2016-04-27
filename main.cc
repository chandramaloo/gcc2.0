#include <iostream>
#include "Scanner.h"
#include "Parser.h"
#include <string>
using namespace std;

extern vector<abstract_astnode *> nodePtr;
extern GlobalSymbolTable gst;
extern string file;
extern string file_s;
extern queue<pair<string, string> > const_strings;
extern stack<string> ftstack, tstack;
ofstream out (file_s, ios::out);

int main (int argc, char** argv)
{
	Parser parser;
	parser.parse();

	// preparing the register stacks
	string r = "$t9";

	for(int i=9; i>=2; i--, r[2]--)
		tstack.push(r);

	r = "$f9";
	for(int i=15; i>=2; i--, r[2]--)
		ftstack.push(r);

  // print all const strings to target file
  out << "\t.data\n";

  pair<string, string> s;
  while(!const_strings.empty()) {
      s = const_strings.front();
      const_strings.pop();
      out << s.first << ":\t.asciiz\t" << s.second << "\n";
  }

  out << "\t.text\n\n";
	for(int i=0; i<nodePtr.size(); i++){
		cerr << "Determining number of required registers for block " << i << endl;
		nodePtr[i]->assignReg();
		out << nodePtr[i]->generate_code(gst.getLst(nodePtr[i]->label), 0);
	}

	gst.print();
	out.close();
}
