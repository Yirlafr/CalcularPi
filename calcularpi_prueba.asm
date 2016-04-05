%macro Denominador m1 m2 m3
	mull %m1, %m2
	mull %m1, %m3	
%endmacro


section .bss
	buffer: resb 10 ;se reserva el espacio de memoria para calcular pi
	
section .data
	msj: db "El valor de pi es: " ,10
	len: equ $-msj
	
	numerador: equ 4
	denominador: equ Denominador
	res: equ 0.0
	pi: dt res
	
section .texto
	global _start
	
_start:
	FILD tword[numerador]
	FILD tword[denominador]
	FDIV st1
	FSTP [pi]
	
	
