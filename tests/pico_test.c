#include "firmware.h"
#include <stdio.h>

//void pico_test(void) {
int main(void) {

	int a = 0xDEAD;
	int b = 0xBEAD;
	int c = a+b;

//	c=a+b;
	
	//printf(" TESTESTESTESTESESTESTESTEST \n");
	//printf("%0d = %0d + %0d \n", c,a,b);

	print_str("a=");
	print_hex(a, 8);
	print_chr('\n');
	print_str("b=");
	print_hex(b, 8);
	print_chr('\n');
	print_str("c=");
	print_hex(c, 8);
	print_chr('\n');

	//print_str(" TESTESTESTESTESESTESTESTEST");
	print_chr('\n');

	return 0;
}

