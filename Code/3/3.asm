	ORG	0
	SJMP	START
	ORG	0030H ; 시작



	MOV	PSW, #0
	;
	MOV	A, #11111110B   ;LED초기 비트 설정 (0일 때 on)
LP1:	MOV	P1, A	; 출력 포트인 P1에 비트를 넣어줌 
	CALL	DELAY  ; LED가 오른쪽으로 돌아가는 속도를 4초로 하기위해 머신 싸이클을 이용한다
	RL	A  ; 출력되는 비트를 왼쪽으로 옮긴다
	ORL	A, #0F0H
	CJNE	A, #0FFH, LP1
	MOV	A, #11111110B
	SJMP	LP1
DELAY:	MOV	R0, #2 ; 머신싸이클 딜레이 시작
DELAY1:	MOV	R1, #0
DELAY2:	MOV	R2, #0
DELAY3:	NOP
	DJNZ	R2, DELAY3
	DJNZ	R1, DELAY2
	DJNZ	R0, DELAY1
	RET
	END
	