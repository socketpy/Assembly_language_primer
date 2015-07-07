.data 
	
	HelloWorld:
		.asciz "Hello World!\n"

	ZeroFlagSet:
		.asciz	"Zero Flag was Set!"

	ZeroFlagNotSet:
		.asciz  "Zero Flag Not Set!"


.text 

	.globl _start

	_start:

		nop
		movl $10, %eax
		xorl %eax, %eax
		jz FlagSetPrint

	FlagNotSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagNotSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall



	FlagSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall


	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80 

	PrintHelloWorld:
		movl $10, %ecx
		PrintTenTimes:
			pushl %ecx
			movl $4, %eax
			movl $1, %ebx
			leal HelloWorld, %ecx
			movl $14, %edx
			int $0x80
			popl %ecx
		loop PrintTenTimes
		jmp ExitCall

