main:
SET R7, 0xFF
SET R0, p
SET R1, 0x10
CALL |R7|, processArray
halt:
JMP halt
processArray:
PUSH |R7|, R3
PUSH |R7|, R4
SET R3, 0x00
SET R4, 0x02
loop:
CMP R3, R1        ; Condición del loop
JZ fin			  ; JMP si R3=R1
PUSH |R7|, R0
ADD R0, R3
ADDINMEM R0
POP |R7|, R0
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