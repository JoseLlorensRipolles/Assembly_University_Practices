.text
.globl __start

__start :


la $t0,0xffff0000 		#Cargo la direccion base en t0


bucle:		
	lw $t1,0($t0)
	andi $t1,$t1,1
	beqz $t1,bucle


	lw $t2, 4($t0)		#Leemos la letra
	li $t1,9			#Incializamos t1 con el valor de TAB
	beq $t1,$t2,fin		#Si la letra leida es TAB finalizamos
	
	
	move $a0,$t2		#Cargamos el char en a0
	li$v0,1			#Cargamos el codigo para pintchart
	syscall			#llamada al sistema
	j bucle	

fin:	li $v0,10
	syscall

.end
	