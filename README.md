# FIRST - A process language. Combine with pipes to create procedures.
- Started June 2026, expect daily progress.
- Test programs to show translation to C programs that compile and run.
- very simple subset of the ALGOL language without complexity.

# Build
- flex first.l
- cc lex.yy.c -o first -lfl
- ./first < test.alg > test.c 
- cc test.c -o test
- ./test

# Combining With Pipes
- UNIX and LINUX have the pipe operator, |, in the shell enviroment of the Terminal.
- ls -s | sort -n  for example
