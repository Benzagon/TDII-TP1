main:
SET R7, 0xFF
SET R2, 0x50
SET R3, 0x70
SET R1, 0x01
SET R0, 0x00
aca:
CMP R3, R2
JZ fin
CALL |R7|, coso2
ADD R2, R1
JMP aca
coso2:
PUSH |R7|, R0
SET R0, 0xFF
SUB R0, R2
STR [R2], R0
POP |R7|, R0
RET |R7|
fin:
DB 0xA0
DB 0x00
halt:
JMP halt
