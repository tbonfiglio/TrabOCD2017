.data
	# Matriz criada em memória
	linha1: .word 1, 2, 3, 4, 5, 6, 7, 8, -1 # objeto -1 indica o final do vetor
	linha2: .word 11, 12, 13, 14, 15, 16, 17, 18, -1 # objeto -1 indica o final do vetor
	linha3: .word 21, 22, 23, 24, 25, 26, 27, 28, -1 # objeto -1 indica o final do vetor
	linha4: .word 31, 32, 33, 34, 35, 36, 37, 38, -1 # objeto -1 indica o final do vetor
	linha5: .word 41, 42, 43, 44, 45, 46, 47, 48, -1 # objeto -1 indica o final do vetor
	matriz: .word linha1 , linha2 , linha3 , linha4 , linha5 , 0 # objeto 0 indica o final do vetor de vetores

	# variáveis das linhas em maiúsculo para não dar conflito com os comandos como o de JUMP(j)
	I:	.word 1 # Índice da primeira linha para fazer a troca
	J:	.word 4 # Índice da segunda linha para fazer a troca
	
	$linhaI: .word
	$linhaJ: .word
	coluna: .word

	$texto:  .asciiz "teste"
	$novaLinha: .asciiz "\n"

.text
	main:		
		li $s3, 0 #inicia o iterador da linha
		#la $s1, $matriz #aponta para o matriz
		
		#ld $s3,($s1) #pega o endereço da linha dentro da matriz
		#ld $s4,($s3) #pega o valor da  linha
		
		lw $s0, I
		mul $s0, $s0, 4 # índice * tamanho da palavra
		lw $s1, J
		mul $s1, $s1, 4 # índice * tamanho da palavra
		
		lw $t0, matriz($s0) 
		lw $t1, matriz($s1)
		
		sw $t0, $linhaI
		sw $t1, $linhaJ
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, $linhaJ #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		la  $a0, $novaLinha
		li $v0,4
        	syscall
		
		lw $s4, $linhaI($s3)
		lw $s5, $linhaJ($s3)
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, ($s4) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		la  $a0, $novaLinha
		li $v0,4
        	syscall
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, ($t1) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		la  $a0, $novaLinha
		li $v0,4
        	syscall
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, ($t0) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		
		#li $v0,1 #comando de impressão de texto na tela
		#la $a0, 0($s4) #coloca o registrador do contador para ser impresso
		#syscall # efetua a chamada ao sistema
		
		#j loop
		j finaliza
		
	loop:
		blt $s4,0,finaliza # caso seja o final do array(numero menor que 0) ele desvia para finaliza
		#blez $s3,finaliza # caso seja o final das linhas (numero menor ou igual a 0) ele desvia para finaliza
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, 0($s4) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		addi $s3,$s3,4 # vai pro proximo
		j loop #desvia para o loop
	
	fazTroca:
		jr $ra
		
	imprimeContador:		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, ($s0) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
	finaliza:
		li $v0, 10 # comando de exit
		syscall # efetua a chamada ao sistema
