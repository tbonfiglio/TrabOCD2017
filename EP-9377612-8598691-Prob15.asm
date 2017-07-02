.data
	# Matriz criada em memória
	linha1: .word 1, 2, 3, 4, 5, 6, 7, 8, -1 # objeto -1 indica o final do vetor
	linha2: .word 11, 12, 13, 14, 15, 16, 17, 18, -1 # objeto -1 indica o final do vetor
	linha3: .word 21, 22, 23, 24, 25, 26, 27, 28, -1 # objeto -1 indica o final do vetor
	linha4: .word 31, 32, 33, 34, 35, 36, 37, 38, -1 # objeto -1 indica o final do vetor
	linha5: .word 41, 42, 43, 44, 45, 46, 47, 48, -1 # objeto -1 indica o final do vetor
	matriz: .word linha1 , linha2 , linha3 , linha4 , linha5 , 0 # objeto 0 indica o final do vetor de vetores
	
	# variáveis das linhas em maiúsculo para não dar conflito com os comandos como o de JUMP(j)
	I:	.word 1  # Índice da primeira linha para fazer a troca
	J:	.word 4  # Índice da segunda linha para fazer a troca
	
	# variáveis usadas para imprimir textos de legenda na tela
	$legenda:	.asciiz "Valor antigo: I - J Novo -> I - J" 
	$hifen:  	.asciiz " - "
	$antigo:  	.asciiz "Valor antigo: "
	$novo:  	.asciiz " Novo -> "
	$novaLinha: 	.asciiz  "\n"

.text
	main:
		# Iremos guardar o endereço das linhas que iremos realizar a troca para facilitar	
		jal pegaLinhasTroca
		
		# Pega endereço dos valor dentro das linhas
		lw $s3, ($s1)  
		lw $s4, ($s2)
		
		la  $a0, $legenda  # coloca o endereço da variável da memória para ser impressa
		li $v0,4  # comando de impressão de texto na tela
        	syscall  # efetua a chamada ao sistema
        	
        	la  $a0, $novaLinha  # coloca o endereço da variável da memória para ser impressa
		li $v0,4  # comando de impressão de texto na tela
        	syscall   # efetua a chamada ao sistema
		
		j loop  # desvia para o loop
		
	finaliza:
		li $v0, 10  # Comando de exit
		syscall  # Efetua a chamada ao sistema
		
	pegaLinhasTroca:
		# Iremos guardar o endereço das linhas que iremos realizar a troca para facilitar	
		lw $t0, I
		mul $t0, $t0, 4  # índice * tamanho da palavra
		lw $t1, J
		mul $t1, $t1, 4  # índice * tamanho da palavra
		
		la $t2, matriz($t0)  # guarda a posição da memória que o endereço da LinhaI está
		la $t3, matriz($t1)  # guarda a posição da memória que o endereço da LinhaJ está
		
		lw $s1,($t2)  # pega o endereço da  LinhaI e guarda no registrador s1
		lw $s2,($t3)  # pega o endereço da  LinhaJ e guarda no registrador s2
		
		jr $ra  # Volta para main de onde chamou o pegaLinhasTroca
	
	loop:	
		# Pega valor das linhas
		lw $s3, ($s1)
		lw $s4, ($s2)
		
		# Se pelo menos uma das listas não tiver mais valores para ser trocado, para a troca e encerra o programa
		blt $s3, 0, finaliza  # Caso seja o final do array(numero menor que 0) ele desvia para finaliza
		blt $s4, 0, finaliza  # Caso seja o final do array(numero menor que 0) ele desvia para finaliza
		
		# Imprime valores antes da troca
		jal ImprimeAntes
		
		# Realiza troca dos valores das linhas na coluna atual
		jal fazTroca
		
		# Imprime valores depois da troca
		jal ImprimeDepois
        	
		addi $s1,$s1,4  # vai para próximo valor da LinhaI
		addi $s2,$s2,4  # vai para próximo valor da LinhaJ
		
		j loop  # desvia para o início do loop
		
	fazTroca:
		# Efetua a troca entre as duas linhas usando o endereço das linhas
        	
        	# Usa registradores auxiliares para guardar valor durante a troca da coluna atual
        	ld $s5, ($s1)
		ld $s6, ($s2)

		# Armazena valor trocado nos endereços de memória respectivos a coluna atual das linhas
		sw $s6, ($s1)
		sw $s5, ($s2)
		
		# Atualiza valor dos registradores para confirmar troca
		lw $s3, ($s1)
		lw $s4, ($s2)
		
		jr $ra  # Volta para loop de onde chamou o fazTroca
		
	ImprimeAntes:
		# Legendas e variáveis antes de trocar os valores entre as linhas com base na coluna atual
		la  $a0, $antigo  # coloca o endereço da variável da memória para ser impressa
		li $v0,4  # comando de impressão de texto na tela
        	syscall  # efetua a chamada ao sistema
        			
		li $v0,1  # comando de impressão de int na tela
		la $a0, ($s3)  # coloca o registrador do contador para ser impresso
		syscall  # efetua a chamada ao sistema
		
		la  $a0, $hifen  # coloca o endereço da variável da memória para ser impressa
		li $v0,4  # comando de impressão de texto na tela
        	syscall  # efetua a chamada ao sistema
		
		li $v0,1  # comando de impressão de int na tela
		la $a0, ($s4)  # coloca o registrador do contador para ser impresso
		syscall  # efetua a chamada ao sistema
		
		jr $ra  # Volta para loop de onde chamou o imprimeAntes
	
	ImprimeDepois:
		# Legendas e variáveis depois de trocar os valores entre as linhas com base na coluna atual
		la  $a0, $novo  # coloca o endereço da variável da memória para ser impressa
		li $v0,4  # comando de impressão de texto na tela
        	syscall  # efetua a chamada ao sistema
        	
        	li $v0,1  # comando de impressão de int na tela
		la $a0, ($s3)  # coloca o registrador do contador para ser impresso
		syscall  # efetua a chamada ao sistema
		
		la  $a0, $hifen  # comando de impressão de int na tela
		li $v0,4  # comando de impressão de texto na tela
        	syscall   # efetua a chamada ao sistema
		
		li $v0,1  # comando de impressão de int na tela
		la $a0, ($s4)  # coloca o registrador do contador para ser impresso
		syscall  # efetua a chamada ao sistema
		
		la  $a0, $novaLinha  # comando de impressão de int na tela
		li $v0,4  # coloca o registrador do contador para ser impresso
        	syscall  # efetua a chamada ao sistema
        	
        	jr $ra  # Volta para loop de onde chamou o imprimeDepois
        	