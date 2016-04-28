int main() {
   int arr[20], i, j, k, size;
 
   size = 10;
   for (i = 0; i < size; i++){ arr[i] = i; }
 
   printf("\nArray with Unique list  : ");
   for (i = 0; i < size; i++) {
      for (j = i + 1; j < size;) {
         if (arr[j] == arr[i]) {
            for (k = j; k < size; k++) {
               arr[k] = arr[k + 1];
            }
            size = size-1;
         }
         else {
            j++;
        }
      }
   }
 
   for (i = 0; i < size; i++) {
      printf(arr[i],"\n");
   }
 
   return 0;
}
