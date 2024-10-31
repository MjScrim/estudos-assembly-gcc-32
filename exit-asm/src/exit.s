.section .data

.section .text

.global _start
_start:
        #movendo 1 para o retorno eax e exitando o programa
        MOVL $1, %eax     
        MOVL $0, %ebx

        INT $0x80
