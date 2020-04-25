	.data
Vektori1: .word 5, 4, 9, 17, 31, 8			# Deklarimi i vektoreve.
Vektori2: .word -5, 2, 3, 4, 6, -3
rezultati: .asciiz "Rezultati i operacionit: "		# Cout-i final.
	
	.text
operacioniMeVektore:
la $t5, Vektori1					# Ngarikimi i adresave.
la $t6, Vektori2
li $t1, 0 


loop_:	
	bge $t1, $t2, loop_exit				# For loop-a.
	
	sll $s4, $t1, 2
	add $s4, $s4, $t5
	lw  $t7, 0($s4)  
	addi $s6, $t7, 0     		
	
	addi $t0, $t2, -1
	sub $s2, $t0, $t1	 
	
	addi $s5, $s2, 0        
	mul $s5, $s5, 4
	add $s3, $s5, $t6    
	lw  $t3, 0($s3)       
	addi $s7, $t3, 0     			
	
	add $t7, $s6, $s7	 	
	sub $t3, $s6, $s7	 	
	
	add $s1, $s1, $t7	 		
	add $s1, $s1, $t3	 	
	
	addi $t1, $t1, 1
	j loop_

loop_exit:						# Kur nuk vlen me kushti ne loop, dalja nga loop-a.
addi $v1, $s1, 0
jr $ra

main:							# Funksioni main.
li $t2, 6            
la $a1, Vektori1
la $a2, Vektori2 
addi $a3, $t2, 0

jal operacioniMeVektore

li $v0, 4						# Cout-i i "Rezultati i operacionit: ".
la $a0, rezultati
syscall

li $v0, 1						# Cout-i i sum-it.
la $a0, ($v1)
syscall

li $v0, 10						# Mbyllja e programit.
syscall

