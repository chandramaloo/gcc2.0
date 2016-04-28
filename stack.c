struct stack {
   int s[2];
   int top;
};
 
int stfull(struct stack* st, int size) {
   if (st->top >= size - 1){
      return 1;
  }
   else{
      return 0;
  }
}
 
void push(int item, struct stack* st) {
   (st->top)++;
   st->s[st->top] = item;
}
 
int stempty(struct stack* st) {
   if (st->top == -1){
      return 1;
  }
   else{
      return 0;
  }
}
 
int pop(struct stack* st) {
   int item;
   item = st->s[st->top];
   st->top = st->top - 1;
   return (item);
}
 
void display(struct stack* st ) {
   int i;
   if (stempty(st)){
      printf("\nStack Is Empty!");
  }
   else {
      for (i = st->top; i >= 0; i--){
         printf("\n", st->s[i]);
	 }
   }
}
 
int main() {
   int item, size;
   struct stack st;
   size = 2;
   st.top = -1;
 
   item = 5;
   push(item,&st);
   item = 6;
   push(item,&st);
   display(&st);
   printf("Stack full: ", stfull(&st,size));
	pop(&st);
	printf("Stack full: ", stfull(&st,size));
 
return 0;
}
