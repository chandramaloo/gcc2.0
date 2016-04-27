struct S
{
    int a, b, c;
};

int f(struct S *A, struct S * B){
    A->a = 1;
    A->b = 2;
    A->c = 3;
    *B = *A;	//allowed??
    printf(B->a, B->b, B->c, "\n");
}

int main()
{
    struct S A, B;
    f(&A,&B);
	printf(B.a, B.b, B.c, "\n");
}