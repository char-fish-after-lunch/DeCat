#include <unistd.h>
#include <assert.h>

void write_buffer(int fd, const char*v, int size){
	int tot = 0;
	while(tot < size){
		int wr = write(fd, v + tot, size - tot);
		assert(wr >= 0);
		tot += wr;
	}
}

//Print String
void  _catlib__PrintString(char * v){
    int len = 0;
    while(v[len] != 0) len++;
    write_buffer(1, v, len);
}

//Print Integer(TODO)
void _catlib__PrintInteger(int v){
    
}

//Read Integer(TODO)
void _catlib__ReadInteger(char * buffer){
    
}

//Read String(TODO)
void _catlib__ReadString(char * buffer){
    
}

// Memory Allocate
#define HEAP_SPACE 524288
char CatBuf[HEAP_SPACE];
int CatBrk = 0;
void * _catlib__Alloc(unsigned size){
	if (CatBrk + size > HEAP_SPACE){
		return NULL;
	} else{
		void * rv = CatBuf + CatBrk;
		CatBrk += size;
		return rv;
	}
}

