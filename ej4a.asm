; Usando la instruccion ADDINMEM, implementar la funcion processArray que toma un arreglos
; de enteros positivos en memoria y los suma de a pares en memoria, pisando el primer elemento
; de cada par con el resultado. Considerar que el tama-o del arreglo siempre es par.
;
;     processArray(*p,size)
;         for i=0; i<size/2; i=i+2
;             p[i] = p[i] + p[i+1]

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, 0x10	;size

	CALL |R7|, processArray

halt:
	JMP halt

processArray:
	PUSH |R7|, R3   ; Guardamos el valor inicial de R3 en la pila
	PUSH |R7|, R4   ; Guardamos el valor inicial de R4 en la pila
	SET R3, 0x00 	; Índice
	SET R4, 0x02    ; Incremento

	loop:
		CMP R3, R1        ; Condición del loop
		JGE fin
		ADDINMEM |R0 + R3|
		ADD R3, R4        ; Incremento
		JMP loop

	fin:
		POP |R7|, R4   ; Regresamos los registros a sus valores originales
		POP |R7|, R3
		RET |R7|


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
