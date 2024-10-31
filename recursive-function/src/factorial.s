#
#   !O código apenas efetua a operação, para poder imprimi-la é mais complexo
#   Deve converter os números para string e usas a syscall de escrita do respectivo sistema para imprimi-las!
#  
.section .data

.section .text

.globl _start
_start:
        PUSH $4

        CALL factorial        #inicia a função fatorial
        ADDL $4, %esp         #recebendo o parâmetro

        MOVL %eax, %ebx       #a função retorna em eax, mas movo para ebx para poder ser usado no output

        MOVL $1, %eax         #exit
        INT $0x80

.globl factorial
.type factorial, @function    #declaração de tipo
factorial:
        PUSHL %ebp            #retornando ebp para seu estado anterior

        MOVL %esp, %ebp       #movendo para não modificar o ebp

        MOVL 8(%ebp), %eax    #movendo o primeiro argumento para eax. 4(%ebp) contém o endereço
                              #já 8(%ebp) contém o primeiro parâmetro
        CMPL $1, %eax         #Se o número for 1, simplesmente retornamos 1

        JE end_factorial      
        DECL %eax             #caso seja diferente de 1, decrementamos o valor
        PUSHL %eax            #movendo para eax, para chamar novamente a função
        CALL factorial        #recursividade da função
        MOVL 8(%ebp), %ebx    #eax já tem o valor de retorno, por isso movemos para ebx

        IMULL %ebx, %eax      #multiplicando pelo o valor da ultima chamada que está em eax
end_factorial:
        MOVL %ebp, %esp       #retoron padrão da função
        POPL %ebp             #redefinindo os valores

        RET                   #retornando para a função
