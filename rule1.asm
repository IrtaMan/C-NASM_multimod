%include "io.inc"

section .text
global rule1
rule1:
    push ebp
    mov ebp, esp
    mov ecx, 0
    ;ebp:
    ;int textSize   [ebp+12]
    ;char *Text     [ebp+8]
    ;ret_addr
    ;old_ebp <--ebp <--esp
    
    while1:
        cmp ecx, [ebp+12] ;сравниваем счетчик (i) с textSize
        jge endwhile      ;i >= textSize => заканчиваем цикл
        mov edx, [ebp+8]  ;присваиваем адрес Text[i] в edx
        lea edx, [edx+ecx]  ;сдвигаем указатель на i-й
        mov al, [edx]     ;присваиваем Text[i] в al
        cmp al, 'A'       ;сравниваем Text[i] с 'A'
        jl continue
        cmp al, 'Z'       ;сравниваем Text[i] с 'Z'
        jg continue
        sub al, 040h      ;Text[i] -= 'A'-1
        mov ah, 0
        mov dl, 10
        div dl            ;Text[i] = Text[i] % 10
        add ah, '0'
        mov [edx], ah     ;присваиваем edx адрес на первый элемент измененного массива
    continue:
        loop while1
    endwhile:
        pop ebp
        ret