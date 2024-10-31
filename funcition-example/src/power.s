.section .data

.section .text

.globl _start
_start:
        PUSHL $3                #puxando o segundo argumento
        PUSHL $2                #puxando o primeiro argumento
        CALL power              #inicia a função
        ADDL $8, %esp           #movendo o ponteiro para trás

        PUSHL %eax              #salvando a primeira resposta

        PUSHL $2                #segundo argumento
        PUSHL $5                #primeiro argumento
        CALL power              #função
        POPL %ebx               #saida para ebx, já que é eax já tem a primeira resposta

        ADDL %eax, %ebx         #adicionando os resultados juntos. O retorno está em ebx

        MOVL $1, %eax           #exit
        INT $0x80

.type power, @function          #definindo tipo
power:
        PUSHL %ebp              #salvando o ponteiro antigo
        MOVL %esp, %ebp         #fazendo o ponteiro esp o ponteiro base
        SUBL $4, %esp           #conseguindo espaço de armazenamento local, liberando esp

        MOVL 8(%ebp), %ebx      #colocando o primeiro argumento em eax
        MOVL 12(%ebp), %ecx     #colocando o segundo argumento em ecx

        MOVL %ebx, -4(%ebp)     #armazena o resultado atual
power_loop_start:
        CMPL $1, %ecx           #se a potencia for um, retornamos
        JE end_power            
        MOVL -4(%ebp), %eax     #movendo o resultado atual para eax
        IMULL %ebx, %eax        #multiplica o resultado atual pelo o número base

        MOVL %ebx, -4(%ebp)     #armazena o resultado

        DECL %ecx               #decrementa a potencia      
        JMP power_loop_start    #inicia a próxima potencia
end_power:
        MOVL -4(%ebp), %eax     #retorna o valor para eax
        MOVL %ebp, %esp         #restaura o ponteiro da pilha
        POPL %ebp               #restaura o ponteiro base
        RET
