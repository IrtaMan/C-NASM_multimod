# -*- MakeFile -*-

main.o: main.c
	gcc -m32 -c -o main.o main.c    //создаем объектный файл main
rule1.o: rule1.asm
	nasm -f elf32 -o rule1.o rule1.asm   //создаем объектный файл rule1
rule2.o: rule1.asm                  
	nasm -f elf32 -o rule2.o rule2.asm   //создаем объектный файл rule2
program.out: main.o rule1.o rule2.o
	gcc -m32 -o program.out main.o rule1.o rule2.o    //компилируем программу с помощью компилятора gcc