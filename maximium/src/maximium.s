.section .data

data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0        #lista de dados

.section .text

.global _start
_start:
        MOVL $0, %edi                                   #move 0 para o index   
        MOVL data_items(,%edi,4), %eax                  #lendo o primeiro bit da lista
        MOVL %eax, %ebx                                 #movendo o valor para ebx, eax sendo maior  

start_loop:
        CMPL $0, %eax                                   #verifica se chegou ao final da lista 
        JE loop_exit                                    
        INCL %edi                                       #carrega o próximo valor
        MOVL data_items(,%edi,4), %eax                  #move o próximo valor para eax, para a comparação
        CMPL %ebx, %eax                                 #compara os valores  
        JLE start_loop                                  #volta ao início
    
        MOVL %eax, %ebx                                 #move o valor sendo o maior  

        JMP start_loop                                

loop_exit:
        MOVL $1, %eax                                   #exit
        INT $0x80
