#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/mman.h>
#include<sys/types.h>
#include<fcntl.h>
#include<sys/stat.h>
char buf[10];
char *ptr;
int main()
{
	//sr_yang.operational
	//int fd = shm_open("region",O_CREAT|O_RDWR,S_IRUSR | S_IWUSR);
	int fd = shm_open("sy_yang.operational",O_CREAT|O_RDWR,S_IRUSR | S_IWUSR);
	if(fd < 0)
	{
		printf("error open region\n");
		return -1;
	}
	ftruncate(fd,10);
	ptr = mmap(NULL,10,PROT_READ | PROT_WRITE,MAP_SHARED,fd,0);
	if(ptr == MAP_FAILED)
	{
		printf("error map\n");
		return -1;
	}
	while(*ptr != 0x12);
	printf("ptr : %d\n",*ptr);
	return 0;
}
