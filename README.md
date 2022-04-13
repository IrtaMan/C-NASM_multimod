# C-NASM_multimod
Working with a text using C and NASM Assembly

We're given a non-empty text (a sequence of non-space characters) containing no more than 100 elements, with a dot as a sign of the end of the text. It is required to enter the given text from the keyboard and write it to memory, then determine whether it ends with a capital Latin letter that is no longer found in the text.

If this condition is met, then it is necessary to replace each capital Latin letter with a digit, the numerical value of which is equal to N mod 10 (where N is the serial number of the letter in the alphabet, from 1 to 26). If not, then it is necessary to leave in the text only those characters that are included in it only once.

The task must be implemented as a multi-module program. The program should be provided with explanatory comments in an amount sufficient for its understanding. The main program (implemented in the C language) must provide text input/output and check its compliance with the rule specified in the task option. The output of the source text must be performed immediately after it is written to memory - before it is parsed and converted.

The output of the converted text should be performed only after its final formation. Algorithms for converting text according to rules 1 and 2 must be written as functions in NASM assembly language. Functions must follow the cdecl calling convention. The use of global variables in functions is not allowed. All other functions of the program must be implemented in the C language.
