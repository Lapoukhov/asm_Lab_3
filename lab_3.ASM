org 100h

EntryPoint:
        mov ah, $09           ;Вывод текста
        mov dx, strA
        int 21h

        mov ah, $09           ;переход
        mov dx, strNext
        int 21h

        mov ah, $09           ;Вывод текста
        mov dx, sB
        int 21h

        mov ah, $09           ;Вывод текста
        mov dx, stroka
        int 21h

        cld
        mov bl, [strA+1]
        lea di, [strA]
        mov dl, [sB+2]        ;подстрока

Poisk:
        mov al, dl            ;Поиск
        repne scasb           ;пока не равно или не 0
        jnz NO
        cmp dl, 2

        mov ah, $09 ;Yes
        mov dx, Yes
        int 21h

        jmp exit

NO:
        mov ah, $09           ;No
        mov dx, No
        int 21h

exit: 
        mov ah, $08
        int 21h
        ret

strNext db 10,13,'$' 
stroka db 'Resultat: $'
sB db 'cde',10,13,'$'
Yes db 'Yes',10,13,'$' 
No db 'No',10,13,'$' 
strA db 'abcde$'
