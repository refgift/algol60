# FIRST - A process language.
- Like PERL and Guile but process only, thus focused.
-- Derived from ALGOL60 - The Algoritmic Language from the 1950 decade and standarded in 1960.
-- Simple subset of the ALGOL language without the added complexity of procedures.
-- Works with POSIX compatile systems with pipes and redirection between programs.
-- Combine first programs with pipes and redirection to create procedures.

## Theory of this Distinction
### Process Language
- First
### Procedural Language
- Algol
- C
- C++
- Forth
- Java
### Declarative Language
- PROLOG
### Symbolic Language
- LISP

## A work in progress	
- Started June 2026, expect daily progress.
- Test programs to show translation to C programs that compile and run.

## Build
- flex first.l
- cc lex.yy.c -o first -lfl
- ./first < test.alg > test.c 
- cc test.c -o test
- ./test

## Combining With Pipes
- UNIX and LINUX have the pipe operator, |, in the shell enviroment of the Terminal.
- ls -s | sort -n  for example
