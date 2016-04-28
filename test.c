struct chandra 
{
	float i;
	int k[10];
};
void merge(struct chandra arr[10], int l, int m, int r)
{
    int i, j, k;
    int n1 ;
    int n2 ;
 
    struct chandra L[10], R[10];
  n1 = m - l + 1;
     n2 =  r - m;
    for (i = 0; i < n1; i++)
    {
        L[i].i = arr[l + i].i;
			}
    for (j = 0; j < n2; j++)
    {
        R[j].i = arr[m + 1+ j].i;
			}
 
    i = 0; 
    j = 0; 
    k = l; 
    while (i < n1 && j < n2)
    {
        if (L[i].i <= R[j].i)
        {
            arr[k].i = L[i].i;
            i++;
        }
        else
        {
            arr[k].i = R[j].i;
            j++;
        }
        k++;
    }
 
    while (i < n1)
    {
        arr[k].i = L[i].i;
        i++;
        k++;
    }
 
    while (j < n2)
    {
        arr[k].i = R[j].i;
        j++;
        k++;
    }
}
 
void mergeSort(struct chandra arr[10], int l, int r)
{
	int m;
    if (l < r)
    {
        m = l+(r-l)/2;
 
        mergeSort(arr, l, m);
        mergeSort(arr, m+1, r);
 
        merge(arr, l, m, r);
    }
    else
    {
			l=l;
		}
}
 
void printArray(struct chandra A[10], int size)
{
    int i;
    for (i=0; i < size; i++)
    {
        printf(i,":",A[i].i,"\n");
			}
    printf("\n");
}
 
int main()
{
    struct chandra arr[10];
    int arr_size;
    arr_size=10;
    arr[0].i=1.1;
    arr[1].i=21.1;
    arr[2].i=1.12;
    arr[3].i=1.11;
    arr[4].i=11.1;
    arr[5].i=1.1;
    arr[6].i=11.1;
    arr[7].i=122.1;
    arr[8].i=12.1;
    arr[9].i=1.12;
 	printf(arr[9].i, "\n");
    printf("Given array is \n");
    printArray(arr, arr_size);
 
    mergeSort(arr, 0, arr_size - 1);
 
    printf("\nSorted array is \n");
    printArray(arr, arr_size);
    return 0;
}