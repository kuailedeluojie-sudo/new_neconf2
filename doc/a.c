#include<stdio.h>
int main()
{
	int i = 1000000;
	while(i-- > 1)
	{
	printf("\33[2K\r%d",i);
	}
	return 0;
}
