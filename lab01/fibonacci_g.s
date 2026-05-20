	.file	"fibonacci.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	fib
	.def	fib;	.scl	2;	.type	32;	.endef
	.seh_proc	fib
fib:
.LFB16:
	.file 1 "fibonacci.c"
	.loc 1 6 21
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp              
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	.loc 1 7 8
	cmpl	$0, 16(%rbp)
	jns	.L2
	.loc 1 7 23 discriminator 1
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 8 14
	movq	$0, -8(%rbp)
	.loc 1 8 21
	movq	$1, -16(%rbp)
	.loc 1 9 8
	cmpl	$0, 16(%rbp)
	jne	.L4
	.loc 1 9 24 discriminator 1
	movq	-8(%rbp), %rax
	jmp	.L3
.L4:
.LBB2:
	.loc 1 10 14
	movl	$2, -20(%rbp)
	.loc 1 10 5
	jmp	.L5
.L6:
	.loc 1 11 11 discriminator 3
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	.loc 1 12 11 discriminator 3
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 13 11 discriminator 3
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 10 30 discriminator 3
	addl	$1, -20(%rbp)
.L5:
	.loc 1 10 5 discriminator 1
	movl	-20(%rbp), %eax
	cmpl	16(%rbp), %eax
	jle	.L6
.LBE2:
	.loc 1 15 12
	movq	-16(%rbp), %rax
.L3:
	.loc 1 16 1
	addq	$32, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <n>\12\0"
.LC1:
	.ascii "n \344\356\353\346\355\356 \341\373\362\374 >= 0\0"
.LC2:
	.ascii "fib(%d) = %I64u\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB17:
	.loc 1 18 34
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	.loc 1 18 34
	call	__main
.LVL0:
	.loc 1 19 8
	cmpl	$1, 16(%rbp)
	jg	.L8
	.loc 1 20 9
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	.loc 1 21 16
	movl	$1, %eax
	jmp	.L9
.L8:
	.loc 1 23 22
	movq	24(%rbp), %rax
	addq	$8, %rax
	.loc 1 23 13
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -4(%rbp)
	.loc 1 24 8
	cmpl	$0, -4(%rbp)
	jns	.L10
	.loc 1 25 9
	leaq	.LC1(%rip), %rcx
	call	puts
	.loc 1 26 16
	movl	$1, %eax
	jmp	.L9
.L10:
	.loc 1 28 5
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	fib
	movq	%rax, %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	.loc 1 29 12
	movl	$0, %eax
.L9:
	.loc 1 30 1
	addq	$48, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.seh_endproc
.Letext0:
	.file 2 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdlib.h"
	.file 3 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/malloc.h"
	.file 4 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/crtdefs.h"
	.file 5 "C:/Program Files/CodeBlocks/MinGW/x86_64-w64-mingw32/include/stdint.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x3cb
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -mtune=core2 -march=nocona -g -O0\0"
	.byte	0xc
	.ascii "fibonacci.c\0"
	.ascii "D:\\syeta\\\316\321\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "wchar_t\0"
	.byte	0x4
	.byte	0x62
	.byte	0x18
	.long	0xac
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x4
	.byte	0x8
	.long	0x69
	.uleb128 0x4
	.byte	0x8
	.long	0x9c
	.uleb128 0x4
	.byte	0x8
	.long	0xc2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x5
	.ascii "__imp___mb_cur_max\0"
	.byte	0x2
	.byte	0x73
	.byte	0x10
	.long	0xe1
	.uleb128 0x6
	.long	0xd5
	.long	0x16a
	.uleb128 0x7
	.long	0x71
	.byte	0
	.byte	0
	.uleb128 0x5
	.ascii "_sys_errlist\0"
	.byte	0x2
	.byte	0xac
	.byte	0x26
	.long	0x15a
	.uleb128 0x5
	.ascii "_sys_nerr\0"
	.byte	0x2
	.byte	0xad
	.byte	0x24
	.long	0xc2
	.uleb128 0x8
	.ascii "__imp___argc\0"
	.byte	0x2
	.word	0x119
	.byte	0x10
	.long	0xe1
	.uleb128 0x8
	.ascii "__imp___argv\0"
	.byte	0x2
	.word	0x11d
	.byte	0x13
	.long	0x1bd
	.uleb128 0x4
	.byte	0x8
	.long	0x1c3
	.uleb128 0x4
	.byte	0x8
	.long	0xd5
	.uleb128 0x8
	.ascii "__imp___wargv\0"
	.byte	0x2
	.word	0x121
	.byte	0x16
	.long	0x1e0
	.uleb128 0x4
	.byte	0x8
	.long	0x1e6
	.uleb128 0x4
	.byte	0x8
	.long	0xdb
	.uleb128 0x8
	.ascii "__imp__environ\0"
	.byte	0x2
	.word	0x127
	.byte	0x13
	.long	0x1bd
	.uleb128 0x8
	.ascii "__imp__wenviron\0"
	.byte	0x2
	.word	0x12c
	.byte	0x16
	.long	0x1e0
	.uleb128 0x8
	.ascii "__imp__pgmptr\0"
	.byte	0x2
	.word	0x132
	.byte	0x12
	.long	0x1c3
	.uleb128 0x8
	.ascii "__imp__wpgmptr\0"
	.byte	0x2
	.word	0x137
	.byte	0x15
	.long	0x1e6
	.uleb128 0x8
	.ascii "__imp__osplatform\0"
	.byte	0x2
	.word	0x13c
	.byte	0x19
	.long	0x267
	.uleb128 0x4
	.byte	0x8
	.long	0xe7
	.uleb128 0x8
	.ascii "__imp__osver\0"
	.byte	0x2
	.word	0x141
	.byte	0x19
	.long	0x267
	.uleb128 0x8
	.ascii "__imp__winver\0"
	.byte	0x2
	.word	0x146
	.byte	0x19
	.long	0x267
	.uleb128 0x8
	.ascii "__imp__winmajor\0"
	.byte	0x2
	.word	0x14b
	.byte	0x19
	.long	0x267
	.uleb128 0x8
	.ascii "__imp__winminor\0"
	.byte	0x2
	.word	0x150
	.byte	0x19
	.long	0x267
	.uleb128 0x5
	.ascii "_amblksiz\0"
	.byte	0x3
	.byte	0x35
	.byte	0x17
	.long	0xe7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x3
	.ascii "uint64_t\0"
	.byte	0x5
	.byte	0x2a
	.byte	0x30
	.long	0x71
	.uleb128 0x9
	.ascii "main\0"
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.long	0xc2
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x35c
	.uleb128 0xa
	.ascii "argc\0"
	.byte	0x1
	.byte	0x12
	.byte	0xe
	.long	0xc2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.ascii "argv\0"
	.byte	0x1
	.byte	0x12
	.byte	0x1a
	.long	0x1c3
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.ascii "n\0"
	.byte	0x1
	.byte	0x17
	.byte	0x9
	.long	0xc2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.ascii "fib\0"
	.byte	0x1
	.byte	0x6
	.byte	0xa
	.long	0x2fa
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.ascii "n\0"
	.byte	0x1
	.byte	0x6
	.byte	0x12
	.long	0xc2
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.ascii "a\0"
	.byte	0x1
	.byte	0x8
	.byte	0xe
	.long	0x2fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.ascii "b\0"
	.byte	0x1
	.byte	0x8
	.byte	0x15
	.long	0x2fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.ascii "c\0"
	.byte	0x1
	.byte	0x8
	.byte	0x1c
	.long	0x2fa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xb
	.ascii "i\0"
	.byte	0x1
	.byte	0xa
	.byte	0xe
	.long	0xc2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
