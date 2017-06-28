.data
	$linha1: .word 1, 2, 3, 4, 5, 6, 7, 8, -1 # objeto -1 indica o final do vetor
	$linha2: .word 11, 12, 13, 14, 15, 16, 17, 18, -1 # objeto -1 indica o final do vetor
	$linha3: .word 21, 22, 23, 24, 25, 26, 27, 28, -1 # objeto -1 indica o final do vetor
	$linha4: .word 31, 32, 33, 34, 35, 36, 37, 38, -1 # objeto -1 indica o final do vetor
	$linha5: .word 41, 42, 43, 44, 45, 46, 47, 48, -1 # objeto -1 indica o final do vetor
	$matriz: .word $linha1 , $linha2 , $linha3 , $linha4 , $linha5 , 0 # objeto 0 indica o final do vetor de vetores

	$texto:  .asciiz "teste"
	$novaLinha: .asciiz "\n"

.text
	main:
		li $s0, 0 #inicia o contador
		#la $s1, $linha1 #aponta para o array
		la $s1, $matriz #aponta para o matriz
		
		ld $s3,($s1) #pega o endereço da linha dentro da matriz
		ld $s4,($s3) #pega o valor da  linha
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, 0($s4) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		jal buscaPrimeiraLinha
		
		j finaliza
		
	loop:
		ld $s3,($s1) #pega o valor do array
		
		#blt $s3,0,finaliza # caso seja o final do array(numero menor que 0) ele desvia para finaliza
		blez $s3,finaliza # caso seja o final das linhas (numero menor ou igual a 0) ele desvia para finaliza
		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, 0($s3) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
		addi $s0,$s0,1 #incrementa o contador
		
		addi $s1,$s1,4 #muda a posicao
		j loop #desvia para o loop
		
	buscaPrimeiraLinha:
		la  $a0, $texto
		li $v0,4
        	syscall
		
		la  $a0, $novaLinha
		li $v0,4
        	syscall
		
		la  $a0, $texto
		li $v0,4
        	syscall
		
		jr $ra
	
	buscaSegundaLinha:
		jr $ra
		
	fazTroca:
		jr $ra
		
	imprimeContador:		
		li $v0,1 #comando de impressão de texto na tela
		la $a0, ($s0) #coloca o registrador do contador para ser impresso
		syscall # efetua a chamada ao sistema
		
	finaliza:
		li $v0, 10 # comando de exit
		syscall # efetua a chamada ao sistema
