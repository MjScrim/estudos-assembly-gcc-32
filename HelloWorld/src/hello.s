.section .data
MSG: .asciz "Hello World!"      #declarando uma variavel em ascicode
.EQU LEN_MSG, 12                #os bits da variavel

.section .text
.globl _start
_start:
        MOVL $4, %eax           #chamada de escrita
        MOVL $1, %ebx           #stdout
        MOVL $MSG, %ecx         #ponteiro da mensagem
        MOVL $LEN_MSG, %edx     #tamanho da mensagem
        INT $0x080              #syscall 

        MOVL $1, %eax           #chamada de saída
        XORL %ebx, %ebx         #retornado 0 como status code(Sem erros)
        INT $0x80               #syscall
