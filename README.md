# ALGOL 60 Compiler
- Started June 2026, expect daily progress.
- 2 test programs to show translation to C programs that compile and run.
- very simple subset of the language but I plan to eventually finish.

# Build
- flex first.l
- cc lex.yy.c -o first -lfl
- ./first < test.alg > test.c 
- cc test.c -o test
- ./test

