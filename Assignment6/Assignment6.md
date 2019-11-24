# Assignment 6

## Task
Implement a calculator using Bison that supports variables. Variables can be any of the 26 lower case letters. Numbers can be in the range zero to nine. `:=` will be used for assignment and each statement will be terminated by a semicolon. Whitespace and newlines should be ignored on input. Operations used will be addition, subtraction, multiplication and (integer) division. The calculator should support a unary minus. The calculator should support a `print` command which prints a variables value followed by a newline.
## Example Input
```
a:=6;
b:=a+7-4;
print b;
```
## Invalid Input
If an invalid input is detected the program should output the words 
"syntax error" followed by a newline character to standard output
and then exit.