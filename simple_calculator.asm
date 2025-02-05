# data section
.data

	#declaring string variables

	title: .asciiz "MIPS CALCULATOR : "
	prompt1: .asciiz "Enter first number : "
	prompt2: .asciiz "Enter second number : "
	operation: .asciiz "Enter the operation + or - or / or * : "
	result: .asciiz "The result is : "
	newline: .asciiz "\n"

resultquo: .asciiz "The quotient is : "
resultrem: .ascii "The remainder is: "

#main section
.text
.globl main

#main function
main:
	
	#Displaying the first Prompt message
	li $v0,4
	la $a0,prompt1
	syscall

	#Reading the Integer value from the keybord
	li $v0,5
	syscall

	#Storing the input to a temporary register
	move $t0,$v0
	
	
	#Displaying the operation string
	
	li $v0,4
	la $a0,operation
	syscall
	
	li $v0,12
	syscall
	
	move $t3,$v0
	
	li $v0,4
	la $a0,newline
	syscall

	#Displaying the second Prompt message
	li $v0,4
	la $a0,prompt2
	syscall

	#Reading the second Integer value from the keybord
	li $v0,5
	syscall
	
	#Storing the input to a temporary register
	move $t1,$v0

	

	beq $t3,43,addition					#branch to addition fuction / lable
	beq $t3,45,subtract					#branch to subtraction fuction / lable
	beq $t3,42,multiply					#branch to multiplication fuction / lable
	beq $t3,47,division					#branch to division fuction / lable

#adding fuction
addition:

	add $t2,$t1,$t0		#adding first number and second number and store it in temporary registe (t2)
	
	#printing the result string
	li $v0,4
	la $a0,result
	syscall
	
	#Printing the result
	li $v0,1
	la $a0,($t2)
	syscall
	
	j  exit					# Jump to exit function

#subtaction fuction
subtract:
	sub $t2,$t0,$t1				#Subtracting second number from first number
	
	#printing the result string
	li $v0,4
	la $a0,result
	syscall
	
	#Printing the result
	li $v0,1
	la $a0,($t2)
	syscall
	j exit			# Jump to exit function

#Multiplication fuction
multiply:
	mul $t2,$t1,$t0					#Multiplying first number and secong number and store the result in temporary register T3
	
	#printing the result string
	li $v0,4
	la $a0,result
	syscall
	
	
	#Printing the result
	li $v0,1
	la $a0,($t2)
	syscall
	
	j exit 			  # Jump to exit function


#division fucntion
division:
	div $t0,$t1
	mflo $t2
	mfhi $t3
	
	#Displaying the Quotient string
	li $v0,4
	la $a0,resultquo
	syscall

	#Printing the Whole number or quotient result of the operation
	li $v0,1
	la $a0,($t2)
	syscall
	
	# Newline
	li $v0,4
	la $a0,newline
	syscall
	
	#Displaying the remainder string
	li $v0,4
	la $a0,resultrem
	syscall

	#Printing the remainder
	li $v0,1
	la $a0,($t3)
	syscall	
	
	j exit 						# Jump to exit function

#exit function	
exit:
	li $v0,10			#calling the sysmen exit command
	syscall

