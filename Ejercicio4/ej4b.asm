; Usando la instruccion ADDE10S, implementar la funcion sumE10S que toma un par de arreglos
; de numeros en notacion exceso 10 y suma los elementos entre si. El resultado de cada operacion
; se almacena en ambos arreglos por cada elemento sumado.
;     sumE10S(*p,*t,size)
;         for i=0; i<size; i++
;             r = sumExceso10Sat(p[i], t[i])
;             p[i] = r
;             t[i] = r

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, t		;t
	SET R2, 0x10	;size

	CALL |R7|, sumE10S

halt:
	JMP halt

sumE10S:
	PUSH |R7|, R3   ; Guardamos valores inciales de registros en la pila
	PUSH |R7|, R4 
	PUSH |R7|, R5 
    PUSH |R7|, R6
	
	SET R3, 0x00 	; Índice
	SET R4, 0x01    ; Incremento
	
	loop:
		CMP R3, R2   ; Condición del búcle i >= size
		JGE fin
		
		LOAD R5, [R0 + R3]  ; ADDR + i
		LOAD R6, [R1 + R3]

		ADDE10S R5, R6

		STR [R0 + R3], R5  ; Guardamos el valor en el arreglo
		STR [R1 + R3], R5

		ADD R3, R4    		; i++
		JMP loop 

	fin:
		POP |R7|, R6    ; Devolvemos la pila a su estado original
		POP |R7|, R5
		POP |R7|, R4
		POP |R7|, R3
		RET|R7|


p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE

t:
DB 0x01
DB 0x01
DB 0x34
DB 0x02
DB 0x03
DB 0x23
DB 0xAA
DB 0xCF
DB 0x0F
DB 0x4F
DB 0x50
DB 0x0C
DB 0xC0
DB 0x54
DB 0x88
DB 0xA0
