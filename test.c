#include <stdio.h>
int main() {
  int a, b;
  b = ((a=4)+(a=2)+(a=3)+(a=7));
  printf("%d\n", b);
}
