#include <stdio.h>
#include "rule1.h"
#include "rule2.h"

int main() {
	int i, size;
	char text[100];
	int BigLetters[26], Chars[256];
	
	for (i = 0; i < 26; i++) 
		BigLetters[i] = 0;              
	for (i = 0; i < 255; i++)
		Chars[i] = 0;
	i = 0;
	//инициализируем массивы
	
	while ((text[i] = getchar()) != '.') {
		printf("%c ", text[i]);                  //вывод исходного текста
		i += 1;                                  //считываем символ и увеличиваем счетчик
		if ((text[i] >= 'A') && (text[i] <= 'Z'))
			BigLetters[text[i]-'A'] += 1;            //считаем большие буквы
		
		Chars[text[i]] += 1; //считаем символ
	}
	size = i;
	text[size+1] = '.';
	printf("\n");
	
	if (text[size] >= 'A' && text[size] <= 'Z' && BigLetters[text[size]] == 1)    //проверяем последний символ на то, является ли он заглавной латинской буквой, и на количество появлений в тексте
		rule1(text, size);
	else
		rule2(text, size, Chars);
	
	while (text[i] != '.') {
		printf("%c ", text[i]);   //выводим измененный массив
		i++;
	}
}