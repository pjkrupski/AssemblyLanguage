#include <stdio.h>

int main(){
	
	int i, n, t1 = 1, t2 = 1, nextTerm=0;
	printf("Enter the Fibonacci number you want to see ");
	scanf("%d", &n);
	printf("Fibonacci Series: ");

	for (i = 1; i<=n; i++){
		t1=t2;
		t2=nextTerm;
		nextTerm = t1+t2;
	}

	printf("The %d member of the Fibonacci sequence is %d\n", n , nextTerm );

		//printf("%d, ", nextTerm);
	
	return 0;
}