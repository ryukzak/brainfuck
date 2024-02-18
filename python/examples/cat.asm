        ; Данный пример генерирует идентичный машинный код, что и программа на brainfuck:
        ;
        ; ,[.,]
        ;
        ; Каждый символ brainfuck соответствует одной инструкции на Asm.
        input     ; ,
loop:
        jz break  ; [
        print     ; .
        input     ; ,
        jmp loop  ; ]
break:
        halt      ; конец файла
