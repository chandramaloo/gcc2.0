int main() {
   int n, count;
   float x, term, sum;
 
   x = 9;
 
   n = term = sum = count = 1;
 
   while (n <= 100) {
      term = term * x / n;
      sum = sum + term;
      count = count + 1;
 
      if (term < 0.0001){
         n = 999;
	 }
      else{
         n = n + 1;
	 }
   }
 
   printf("\nTerms = ", count, "\nSum = ", sum);
   return 0;
}
