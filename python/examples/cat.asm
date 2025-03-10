        ; Данный пример генерирует идентичный машинный код, что и программа на brainfuck:
        ;
        ; ,[.,]
        ;
        input     ; ,
loop:
        jz break  ; [
        print     ; .
        input     ; ,
        jmp loop  ; ]
break:
        halt      ; конец файла
