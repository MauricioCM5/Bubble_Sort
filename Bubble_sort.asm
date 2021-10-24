.text # aqui comienzan a definirse las instrucciones
.globl __start
__start : # aqui comienzan sus instrucciones

#bubblesort
la $s1, size
lw $t8, 0($s1)
addi $t0, $zero, 0 #indice inicial
loop:
	beq $t0, $t8, Print_array#Print_array $final_del_loop
	addi $t2, $zero, 9   
	sub $t2, $t2, $t0 # tope del loop2
	
	addi $t4, $zero, 0   #indice 2 en 0 
	
	la $s2, lista #puntero a array[0]
	loop2:
		beq $t4, $t2, sigue_loop   
		addi $t4, $t4, 1 #indice2 += 1
		lw $t5, 0($s2) #array[indice] 
		addi $s2, $s2, 4
		lw $t6, 0($s2) #array[indice + 1]
	
		slt $t7, $t5, $t6 #array[indice] < array[indice+1]?
		beq $t7, $zero, loop2 #si no es menor, vuelve al loop2
		#swap
		sw $t5, 0($s2)  #guarda se array[indice + 1] 
		sub $s2, $s2, 4 
		sw $t6, 0($s2) #guarda en array[indice]
		addi $s2, $s2, 4
		j loop2
		
	sigue_loop:
	addi $t0, $t0, 1 #indice inicial + 1
	j loop
	
Print_array:
li $v0, 0
la $t1, lista
lw $t3, 0($s1)
addi $t0, $zero, 0
loop1:
	bge $t0, $t3, fin #si se imprimieron todos los elementos
	lw $t2, 0($t1) #cargar elemento
	addi $t1, $t1, 4
	#imrpimiendo
	li $v0, 1
	move $a0, $t2
	syscall
	li $a0, 32
	li $v0, 11
	syscall #tecla 'espacio'
	
	addi $t0, $t0, 1 #incrementa el contador
	j loop1
	

fin:
li $v0 ,10
syscall # servicio de finalizar programa

.data
lista: .word 15, 9, 21, 8, 3, 2, 43, 1, 16, 30
size: .word 10
plantilla: .asciiz "Impresion de arreglo: "
	
