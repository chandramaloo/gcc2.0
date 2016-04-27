#include <bits/stdc++.h>
using namespace std;

// first parameters of ArrayRef, Member, Arrow are set to ExpAst rather than RefAst

enum typeExp {StmtAstType, ExpAstType, RefAstType};
class LocalSymbolTable;

class abstract_astnode;

class StmtAst;

class ExpAst;

class Symbol_Type{
public:
	int ptr;
	string type;
	vector<string> vec;
	bool isStruct;

	Symbol_Type();
	Symbol_Type(const Symbol_Type&);
	void print();
	bool canCast(Symbol_Type a);
	Symbol_Type castType(Symbol_Type a);
	int getWidth();
	bool operator==(Symbol_Type a);
};

class SymTabEntry{
public:
	string symbol_name;
	string symbol_class;
	string symbol_scope;
	Symbol_Type symbol_type;
	int width, offset;
	LocalSymbolTable *symtab;

	SymTabEntry();
	SymTabEntry(const SymTabEntry&);
	SymTabEntry(string,string,string,Symbol_Type,int,int);
	SymTabEntry(string,string,string,Symbol_Type,int,int,LocalSymbolTable*);
	void print();
};

class LocalSymbolTable{
public:
	SymTabEntry* meta;
	vector<SymTabEntry> rows;

	LocalSymbolTable();
	LocalSymbolTable(const LocalSymbolTable&);
	void clean();
	void print();
	bool match(vector<ExpAst*>);
	Symbol_Type getType(string symbol_name) const;
	bool contains(string symbol_name) const;
	void checkStructContents();
	void adjustParamOffset();
	SymTabEntry getEntry(string symbol_name) const;
	void addParam(SymTabEntry);
	void addParams(vector<SymTabEntry>);
};

class GlobalSymbolTable{
public:
	map<string, LocalSymbolTable> mapper;
	vector<SymTabEntry> GlobalSymbols;

	GlobalSymbolTable();
	void print();
	LocalSymbolTable getLst(string);
	bool containsVar(string symbol_name);
	bool containsFun(string symbol_name);
	void addLocalSymbolTable(string, LocalSymbolTable);
	void addGlobalSymbol(SymTabEntry);
};

class symbolTable;

// label: node name
// value: for consts
// reqReg: number of registers required
// lvalue: whether allowed as lvalue
// type: proper c++ type of node
class abstract_astnode
{
public:
	string label, value, string_label, reg;
	int reqReg;
	bool lvalue;
	Symbol_Type type;
	abstract_astnode* child1, *child2, *child3, *child4;
	virtual void print() = 0;
	virtual string generate_code(const LocalSymbolTable&, bool) = 0;	// bool = 1 if you want the address to be computed
	virtual void assignReg() = 0;
	// virtual basic_types getType() = 0;
	// virtual bool checkTypeofAST() = 0;
	// protected:
	// virtual void setType(basic_types) = 0;
	typeExp astnode_type;
};

class StmtAst : public abstract_astnode{
public:
	vector<StmtAst*> children;
	StmtAst();
	virtual void print() = 0;
	virtual string generate_code(const LocalSymbolTable&, bool) = 0;
	virtual void assignReg() = 0;
};

class ExpAst : public StmtAst{
public:
	// needToStore: need to store while computing this expression
	ExpAst();
	virtual void print() = 0;
	virtual string generate_code(const LocalSymbolTable&, bool) = 0;
	virtual void assignReg() = 0;
};

class RefAst : public ExpAst{
public:
	RefAst();
	virtual void print() = 0;
	virtual string generate_code(const LocalSymbolTable&, bool) = 0;
	virtual void assignReg() = 0;
};

class Block : public StmtAst{
public:
	Block(string, StmtAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Empty : public StmtAst{
public:
	Empty();
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Seq : public StmtAst{
public:
	Seq(vector<StmtAst*>);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

// class Ass : public StmtAst{
// public:
// 	Ass(ExpAst*, ExpAst*);
// 	void print();
// 	string generate_code(const LocalSymbolTable&, bool);
// 	void assignReg();
// };

class Return : public StmtAst{
public:
	Return(ExpAst*, string);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class If : public StmtAst{
public:
	If(ExpAst*, StmtAst*, StmtAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class While : public StmtAst{
public:
	While(ExpAst*, StmtAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class For : public StmtAst{
public:
	For(ExpAst*, ExpAst*, ExpAst*, StmtAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class OpUnary : public ExpAst{
public:
	OpUnary(string, ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class OpBinary : public ExpAst{
public:
	OpBinary(string, ExpAst*, ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Identifier;

class Assign : public ExpAst{
public:
	Assign(ExpAst* , ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Funcall : public ExpAst{
public:
	vector<ExpAst*> children;
	Funcall(RefAst*, vector<ExpAst*>);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class FloatConst : public ExpAst{
public:
	FloatConst(string value);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class IntConst : public ExpAst{
public:
	IntConst(string value);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class StringConst : public ExpAst{
public:
	StringConst(string value);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Pointer : public ExpAst{
public:
	Pointer(ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Member : public RefAst{
public:
	Member(ExpAst*, RefAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Arrow : public RefAst{
public:
	Arrow(ExpAst*, RefAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Deref : public RefAst{
public:
	Deref(ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class Identifier : public RefAst{
public:
	Identifier(string value);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class ArrayRef : public RefAst{
public:
	ArrayRef(ExpAst*, ExpAst*);
	void print();
	string generate_code(const LocalSymbolTable&, bool);
	void assignReg();
};

class CacheBlock{
public:
	string identifier, reg;
	bool valid;
	int depth, offset;
};

class Cache{
public:
	vector<CacheBlock> cache;
	string findregister(int);
};
