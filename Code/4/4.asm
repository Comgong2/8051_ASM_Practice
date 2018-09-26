	ORG	0
	SJMP	START
	ORG	0030H ; 시작
START:	MOV	SP, #60H  ;스텍 포인트
	;
LP1:	MOV	A, P1 ; 스위치 값을 A에 옮긴다
	SWAP	A ; 상위 비트(4)와 하위 비트(4)를 바꾼다
	ORL	A, #0F0H ; 상위 비트를 1111로 바꾼다
	MOV	P1, A ; 바꾼 값을 출력 포트인 P1에 입력시킨다
	SJMP	LP1 ; 무한루프 시킨다
	END