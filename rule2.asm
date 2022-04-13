%include "io.inc"

section .text
global rule2
rule2:
    ;ebp:
    ;int *Chars    [ebp+20]
    ;int textSize  [ebp+16]
    ;char *Text    [ebp+12]
    ;ret_addr
    ;ebx <--ebp <--esp (после mov ebp, esp ebp будет указывать на ebx (на вершину стека), разница - 4 байта)

    push ebx
    push ebp
    mov ebp, esp
    mov ecx, 0
    mov eax, 0
    
    while2:
        cmp ecx, [ebp+16] ;сравниваем счетчик (i) с textSize
        jge endwhile      ;i >= textSize => заканчиваем цикл
        mov ebx, [ebp+12]  ;присваиваем адрес Text[i] в ebx
        lea ebx, [ebx+ecx]  ;сдвигаем указатель на i-й
        mov al, [ebx]     ;присваиваем Text[i] в al
        mov edx, [ebp+20]  ;присваиваем edx адрес Chars[0]
        mov edx, [edx+eax] ;Chars[Text[i]]
        cmp edx, 1
        je continue   ;если повторяется 1 раз, то пропускаем
        mov dl, [ebx+1]   ;если нет, присваиваем адрес на следующий элемент
        mov [ebx-1], dl  ;присваиваем [ebx-1] адрес на первый элемент измененного массива
    continue:
        loop while2
    endwhile:
       pop ebp
       pop ebx
       ret