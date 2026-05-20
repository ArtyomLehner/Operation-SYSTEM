	.file	"fibonacci.c"
	.text
	.p2align 4
	.globl	_Z3fibi                  # Декорированное имя функции fib
	.def	_Z3fibi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z3fibi
_Z3fibi:                                # int64_t fib(int n)
.LFB64:
	.seh_endprologue                   # Пролог пуст – компилятор обошёлся без стека
	# ecx = n (первый аргумент)
	xorl	%r8d, %r8d            # r8d = 0 (возвращаемое значение по умолчанию)
	testl	%ecx, %ecx            # проверка n <= 0 ?
	jg	.L8                   # если n > 0, переход к основному вычислению
.L1:
	movq	%r8, %rax             # иначе вернуть 0 (n <= 0)
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	$1, %ecx              # n == 1 ?
	je	.L5                   # если да, вернуть 1
	# Для n >= 2 оптимизированный цикл:
	addl	$1, %ecx              # ecx = n + 1 (верхняя граница цикла)
	movl	$1, %edx              # edx = 1 (начальное b)
	xorl	%r9d, %r9d            # r9d = 0 (начальное a)
	movl	$2, %eax              # eax = 2 (счётчик i)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r8, %rdx             # rdx = c (предыдущий результат)
.L3:                                    # начало цикла (i от 2 до n)
	addl	$1, %eax              # i++
	leaq	(%r9,%rdx), %r8       # r8 = a + b (новое c)
	movq	%rdx, %r9             # сдвиг: новое a = старое b
	cmpl	%eax, %ecx            # сравнить i и (n+1)
	jne	.L6                   # если не равны, повторить
	movq	%r8, %rax             # результат в rax
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	movl	$1, %r8d              # для n == 1 вернуть 1
	jmp	.L1
	.seh_endproc

	# Вспомогательные функции и строки
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Usage: %s <n>\12\0"         # \12 = \n (перевод строки)
.LC1:
	.ascii "n \344\356\353\346\355\356 \341\373\362\374 >= 0\0"  # "n должно быть >= 0" (UTF-8)
.LC2:
	.ascii "fib(%d) = %llu\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB65:
	# Пролог main
	pushq	%rsi                     # сохранить rsi (callee-saved)
	.seh_pushreg	%rsi
	pushq	%rbx                     # сохранить rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp                # выделить место в стеке
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx               # ebx = argc
	movq	%rdx, %rsi               # rsi = argv
	call	__main                   # инициализация MinGW

	# Проверка аргументов командной строки
	cmpl	$1, %ebx                 # если argc <= 1
	jle	.L18                     # переход к выводу Usage

	# Получение n = atoi(argv[1])
	movq	8(%rsi), %rcx            # rcx = argv[1]
	call	atoi                     # eax = n
	movl	%eax, %edx               # edx = n (резерв)
	testl	%eax, %eax               # проверка знака n
	js	.L19                     # если n < 0, ошибка
	je	.L15                     # если n == 0, результат 0

	# Проверка n == 1
	cmpl	$1, %eax
	je	.L16                     # если n == 1, результат 1

	# n >= 2 – встроенный цикл (аналогично fib)
	leal	1(%rax), %r10d           # r10d = n + 1 (граница)
	movl	$1, %ecx                 # ecx = 1 (b)
	xorl	%r9d, %r9d               # r9d = 0 (a)
	movl	$2, %eax                 # eax = 2 (i)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%r8, %rcx                # обновить b предыдущим c
.L14:                                   # начало цикла
	addl	$1, %eax                 # i++
	leaq	(%r9,%rcx), %r8          # r8 = a + b
	movq	%rcx, %r9                # сдвиг a = b
	cmpl	%eax, %r10d              # сравнить i и (n+1)
	jne	.L17                     # цикл, пока не равно
.L13:
	# Вывод результата
	leaq	.LC2(%rip), %rcx         # строка "fib(%d) = %llu\n"
	call	printf
	xorl	%eax, %eax               # return 0
.L9:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L15:
	xorl	%r8d, %r8d               # результат 0 для n == 0
	jmp	.L13
.L18:
	# Вывод Usage
	movq	(%rsi), %rdx             # argv[0]
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %eax                 # return 1
	jmp	.L9
.L19:
	# Сообщение "n должно быть >= 0"
	leaq	.LC1(%rip), %rcx
	call	puts
	movl	$1, %eax
	jmp	.L9
.L16:
	movl	$1, %r8d                 # результат 1 для n == 1
	jmp	.L13
	.seh_endproc

	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
