# Build on a Linux server

## Recommended: use the Makefile

From the project root (the directory containing `Makefile`):

```sh
make clean
make
make run
```

The default build uses GCC, includes `-Iinclude`, and links POSIX threads with `-pthread`.

## Alternative: use the build script

```sh
chmod +x build_linux.sh
./build_linux.sh
./Built/library
```

## If compiling manually

Run from the project root:

```sh
gcc -std=c11 -Wall -Wextra -Wpedantic -O2 -Iinclude -pthread \
  Src/main.c Src/auth.c Src/books.c Src/members.c Src/storage.c \
  Src/transactions.c Src/util.c -o Built/library
```

Do not omit `-pthread`; the parallel book-search implementation uses POSIX threads. Do not run the command from inside `Src/` unless you adjust the paths and include directory.

## Optional smoke test

```sh
make thread-smoke
```

GoogleTest, Cppcheck, and the MISRA addon are optional and are not needed for the basic application build. The MISRA target is a screening aid, not proof of full MISRA compliance.
