### PROGRAMA BASE PRACTICAS DE ENTRADA/SALIDA MIPS R2000

#-------------------------------------------------#
#
#  PR�CTICA 12: SINCRONIZACI�N POR PRUEBA DE ESTADO
# 
#-------------------------------------------------#

# ACTIVIDAD 3:  Completar las funciones:
#    char getchar() - obtiene el car�cter del teclado
#    void putchar(char c) - imprime un car�cter por la consola

# Segmento de datos

	.data		

#-------------------------------------------------#

# Segmento de c�digo ("text")
	.text
    	.globl __start	



__start:			

	li $a0, 'P'		# 
	jal putchar		# putchar('P')
	li $a0, '1'		# 
	jal putchar		# putchar('1')
	li $a0, '2'		# 
	jal putchar		# putchar('2')
	li $a0, 13		# car�cter de retorno ('\n')
	jal putchar		# putchar('\n')
	
bucle:
	jal getchar		# $v0 = getchar()
	move $a0, $v0		#
	li $t0, 0x1b      	# detecto ESC (0x1b = 27)
	beq $a0, $t0, fin
	jal putchar		# putchar($a0)
	b bucle
fin:	
	li $v0, 10
	syscall			# exit
	
	
	
getchar:			# $v0 = getchar()
### A COMPLETAR: c�digo de la funci�n

	la $t0,0xffff0000
	
check:	


	lw $t1,0($t0)			#Getting status
	andi $t1,$t1,0x01		#Separating R bit
	beqz $t1,check			#Returning to check if R==0
	
	lb $t1 4($t0)
	move $v0,$t1			#Moving char to v0
	jr $ra


putchar:			# putchar($a0)
### A COMPLETAR: c�digo de la funci�n

	la $t0,0xffff0008
	
check2:	


	lw $t1,0($t0)			#Getting status
	andi $t2,$t1,0x01		#Separating R bit
	beqz $t2,check2			#Returning to check if R==0
	sw $a0,4($t0)			#Storing char in data register

	jr $ra
