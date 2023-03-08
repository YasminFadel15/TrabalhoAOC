.text 
  main:
    li $v0, 4                   # diretiva para impressão de string
    la $a0, entrada             # diretiva para passar para o registrador $a0 o endereço de memória no qual está armazenado a string "entrada"
    syscall                     # executa

    li $v0, 5                   # diretiva para ler inteiro do teclado
	  syscall                     # executa

    sw $v0, n                   # diretiva para gravar o valor que está em $v0 onde está a variável "n"

    addi $s0, $v0, 0            # diretiva para iniciar o registrador $s0 com o valor contido em $v0

    addi $s1, $zero, 1          # diretiva para iniciar o registrador $s1 com o valor 1


    # estrutura for

    # se o valor que está em $s0 for maior que zero, grava em $t0 o valor 1 (verdadeiro), caso naão, grava o valor 0 (falso)
    for: sgt $t0, $s0, $zero
         beq $t0, $zero, $fim_for          # diretiva para comparar o valor obtido anteriormente; caso seja 0, vai para o fim do "for"
         mul $s1,$s1,$s0                   # diretiva para multilpicar: $s1 = $s1 * $s0

         sub $s0,$s0,1                     # diretiva para subtrair: $s0 = $s0 - 1
         j for                             # diretiva para pular para o "for"
 
 
 
    fim_for: li $v0, 4                     # diretiva para impressão de string
             la $a0, resultado             # diretiva para passar para $a0 o endereço de memória no qual está armazenado a string "fatorial"
             syscall

             li $v0, 1                     # diretiva para impressão de inteiro
             move $a0, $s1                 # diretiva para passar para $a0 o valor contido em $s1
             syscall                       # executa
             jr $ra                        # fim do código
             
.data
  entrada: .asciiz "Entre com um inteiro: \n"
  resultado: .asciiz "Fatorial: "
  n: .word 1
