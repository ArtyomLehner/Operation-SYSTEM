	.file	"fibonacci.c"
	.text

# ============================================================
# Функция fib (без оптимизации -O0, с отладочной информацией)
# ============================================================
	.globl	fib
	.def	fib;	.scl	2;	.type	32;	.endef
	.seh_proc	fib
fib:
	# Пролог функции
	pushq	%rbp                     # сохранить старый rbp
	movq	%rsp, %rbp               # установить новый фрейм стека
	subq	$32, %rsp                # выделить место под локальные переменные

	movl	%ecx, 16(%rbp)           # сохранить аргумент n (ecx) в стек [rbp+16]

	# ---- Проверка: n < 0 ? ----
	cmpl	$0, 16(%rbp)
	jns	.L2
	movl	$0, %eax                 # если n < 0, вернуть 0
	jmp	.L3

.L2:
	# ---- Инициализация a = 0, b = 1 ----
	movq	$0, -8(%rbp)             # a = 0 [rbp-8]
	movq	$1, -16(%rbp)            # b = 1 [rbp-16]

	# ---- Если n == 0, вернуть a (0) ----
	cmpl	$0, 16(%rbp)
	jne	.L4
	movq	-8(%rbp), %rax           # возврат a
	jmp	.L3

.L4:
	# ---- Цикл for (i = 2; i <= n; i++) ----
	movl	$2, -20(%rbp)            # i = 2 [rbp-20]
	jmp	.L5                      # переход к проверке условия

.L6:                                     # ТЕЛО ЦИКЛА
	# c = a + b
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)          # c = a + b [rbp-32]

	# a = b
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)

	# b = c
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)

	# i++
	addl	$1, -20(%rbp)

.L5:                                     # ПРОВЕРКА УСЛОВИЯ
	movl	-20(%rbp), %eax          # eax = i
	cmpl	16(%rbp), %eax           # сравнить i и n
	jle	.L6                      # если i <= n, повторить цикл

	# ---- Возврат b ----
	movq	-16(%rbp), %rax          # результат = b
.L3:
	# Эпилог функции
	addq	$32, %rsp
	popq	%rbp
	ret

# ============================================================
# Функция main (аналогично без оптимизации)
# ============================================================
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	# Пролог main
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp

	movl	%ecx, 16(%rbp)           # argc -> [rbp+16]
	movq	%rdx, 24(%rbp)           # argv -> [rbp+24]

	# ---- Если argc < 2, вывести Usage ----
	cmpl	$1, 16(%rbp)
	jg	.L8
	# printf("Usage: %s <n>\n", argv[0]);
	movq	24(%rbp), %rax
	movq	(%rax), %rax             # argv[0]
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	$1, %eax                 # return 1
	jmp	.L9

.L8:
	# ---- Получение n = atoi(argv[1]) ----
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax             # argv[1]
	movq	%rax, %rcx
	call	atoi
	movl	%eax, -4(%rbp)           # n -> [rbp-4]

	# ---- Если n < 0, вывести ошибку ----
	cmpl	$0, -4(%rbp)
	jns	.L10
	leaq	.LC1(%rip), %rcx         # строка "n должно быть >= 0"
	call	puts
	movl	$1, %eax
	jmp	.L9

.L10:
	# ---- Вызов fib(n) и вывод результата ----
	movl	-4(%rbp), %eax
	movl	%eax, %ecx               # передать n через ecx
	call	fib                      # fib(n)
	movq	%rax, %rdx               # результат в rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %r8                # аргумент для printf
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf                   # printf("fib(%d) = %llu\n", n, res)
	movl	$0, %eax

.L9:
	# Эпилог main
	addq	$48, %rsp
	popq	%rbp
	ret

# ============================================================
# Секции данных (неизменны)
# ============================================================
.LC0:
	.ascii "Usage: %s <n>\12\0"
.LC1:
	.ascii "n \344\356\353\346\355\356 \341\373\362\374 >= 0\0"  # "n должно быть >= 0"
.LC2:
	.ascii "fib(%d) = %I64u\12\0"