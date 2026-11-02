#!/bin/sh
# Build the Library Management System on a Linux server with GCC.
set -eu
cd "$(dirname "$0")"
mkdir -p Built
exec gcc -std=c11 -Wall -Wextra -Wpedantic -O2 -Iinclude -pthread \
  Src/main.c Src/auth.c Src/books.c Src/members.c Src/storage.c \
  Src/transactions.c Src/util.c -o Built/library
