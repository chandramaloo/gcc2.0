int main() {
   int numArray[10];
   int i, sum;
   int *ptr;
	
	sum = 0;
   for (i = 0; i < 10; i++){ numArray[i] = i*i*i; }
 
   for (i = 0; i < 10; i++) {
	  ptr = &numArray[i];
      sum = sum + *ptr;
   }
 
   printf("The sum of array elements : ", sum);
}
