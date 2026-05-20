CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -Wl,-subsystem,console

TARGET = fibonacci.exe
PARALLEL_TARGET = fibonacci_parallel.exe
OBJS = main.o fib.o

.PHONY: all clean asm

all: $(TARGET) $(PARALLEL_TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

main.o: main.c fib.h
	$(CC) $(CFLAGS) -c $<

fib.o: fib.c fib.h
	$(CC) $(CFLAGS) -c $<

fibonacci_parallel.exe: fibonacci_parallel_windows.c fib.c fib.h
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ fibonacci_parallel_windows.c fib.c

asm: fib_O0.s fib_O2.s fib_Os.s

fib_O0.s: fib.c fib.h
	$(CC) -O0 -S -masm=intel -o $@ fib.c

fib_O2.s: fib.c fib.h
	$(CC) -O2 -S -masm=intel -o $@ fib.c

fib_Os.s: fib.c fib.h
	$(CC) -Os -S -masm=intel -o $@ fib.c

clean:
	rm -f $(TARGET) $(PARALLEL_TARGET) $(OBJS) *.s