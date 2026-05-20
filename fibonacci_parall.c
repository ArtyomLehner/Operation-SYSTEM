#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fib.h"

#define RESULT_FILE   "results.txt"
#define MUTEX_NAME    L"Global\\FibonacciMutex"

// Запись результата в общий файл с мьютексом (такая же, как выше)
void write_result(int n, unsigned long long res) {
    HANDLE hMutex = CreateMutexW(NULL, FALSE, MUTEX_NAME);
    if (hMutex == NULL) {
        fprintf(stderr, "CreateMutex failed: %lu\n", GetLastError());
        exit(1);
    }
    WaitForSingleObject(hMutex, INFINITE);
    FILE *f = fopen(RESULT_FILE, "a");
    if (f == NULL) {
        perror("fopen");
        ReleaseMutex(hMutex);
        CloseHandle(hMutex);
        exit(1);
    }
    fprintf(f, "Process %lu: fib(%d) = %llu\n", GetCurrentProcessId(), n, res);
    fclose(f);
    ReleaseMutex(hMutex);
    CloseHandle(hMutex);
}

int main(int argc, char *argv[]) {
    if (argc == 2) {
        // Режим дочернего процесса: один аргумент – число n
        int n = atoi(argv[1]);
        unsigned long long res = fib(n);
        write_result(n, res);
        return 0;
    }

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <n1> <n2> [<n3> ...]\n", argv[0]);
        return 1;
    }

    // Удаляем старый файл результатов
    DeleteFileA(RESULT_FILE);

    int numChildren = argc - 1;
    HANDLE *hProcesses = malloc(numChildren * sizeof(HANDLE));
    if (hProcesses == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    ZeroMemory(&si, sizeof(si));
    si.cb = sizeof(si);

    for (int i = 0; i < numChildren; i++) {
        char cmdLine[256];
        snprintf(cmdLine, sizeof(cmdLine), "\"%s\" %s", argv[0], argv[i+1]);

        ZeroMemory(&pi, sizeof(pi));
        BOOL success = CreateProcessA(
            NULL, cmdLine, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi
        );
        if (!success) {
            fprintf(stderr, "CreateProcess failed for arg %s: %lu\n", argv[i+1], GetLastError());
            free(hProcesses);
            return 1;
        }
        CloseHandle(pi.hThread);  // поток не нужен
        hProcesses[i] = pi.hProcess;
    }

    // Ждём завершения всех дочерних процессов
    WaitForMultipleObjects(numChildren, hProcesses, TRUE, INFINITE);

    // Закрываем дескрипторы
    for (int i = 0; i < numChildren; i++) {
        CloseHandle(hProcesses[i]);
    }
    free(hProcesses);

    printf("All children finished. Results in %s\n", RESULT_FILE);
    return 0;
}