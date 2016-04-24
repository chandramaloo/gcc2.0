int binary(int start, int end, int val, int a[10]){
	int mid;
    mid = start+end;
    mid = mid / 2;
    if(a[mid] == val){
        return mid;
    }
    else {
        if(start == end){
	 	     return -1;	
        } else {
            if( a[mid] < val){
                return binary(mid, end, val, a);
            }
            else{
                return binary(start, mid, val, a);	
            }   
        }
    }
}

int main()
{
	int a[10], i;
	for(i=0; i<10; i++){
		a[i] = i*i*i;
	}
	i = binary(0,10,27,a);
	printf(i, "\n");
}