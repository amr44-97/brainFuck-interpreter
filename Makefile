CC = gcc

CFLAGS = -Wall -Wextra -pedantic -g  -O2 -std=gnu11
BINS = BF_asm BF_intp

all: $(BINS)


BF_intp: BF.c deps/file_handle.o deps/LibStr.o 
	$(CC) $(CFLAGS) -o $@ $^

	
BF_asm: BF.c 
	$(CC) $(CFLAGS) -S $^ -o ./gen_assembly/$@-AT.s
	$(CC) $(CFLAGS) -S -masm=intel  $^ -o ./gen_assembly/$@-intel.asm



clean:
	rm *.o *.so  $(BINS)
	rm ./gen_assembly/*.s
	rm ./gen_assembly/*.asm
