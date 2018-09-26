
	ORG	30H
CNT:	DS	1;

	CSEG
	ORG	0000H
	JMP	START
	
	ORG	0003H
	INC	CNT
	MOV	A, CNT
	CJNE	A,#10,EXIT
	MOV	CNT, #0
EXIT:	
	RETI


	ORG	0030H
FONT:	DB	11000000B	;0
	DB	11111001B	;1
	DB	10100101B	;2
	DB	10110000B	;3
	DB	10011001B	;4
	DB	10010010B	;5
	DB	10000010B	;6
	DB	11111000B	;7
	DB	10000000B	;8
	DB	10011000B	;9
START:	MOV	SP,#60H
	MOV	PSW,#0
	MOV	CNT,#0

	SETB	EX1
	SETB	IT1
	SETB	EA

	MOV	DPTR, #FONT
LP:	MOV	A,CNT
	MOVC	A, @A+DPTR
	MOV	P1,A
	SJMP	LP
	
	END