
	
	AREA HANDLERS, CODE, READONLY
        EXPORT EXTI4_IRQHandler

EXTI4_IRQHandler
	PUSH {R0-R1, LR}
	
	LDR R0, =0x40010414       ; EXTI_PR address
	LDR R1, [R0]
	ORR R1, R1, #(1 << 4)     ; Clear EXTI4 pending flag
	STR R1, [R0]

	; Toggle PB13
	LDR R0, =0x40010C0C       ; GPIOB_ODR address
	LDR R1, [R0]
	EOR R1, R1, #(1 << 0)    ; Toggle PB0
	STR R1, [R0]
	
	LDR R0,=0x20000036 ;CONFIG_MODE
	LDR R1,[R0]
	CMP R1,#0 ;CHECK IF in configuration mode don't change modes
	BEQ END_HANDLER
	
	
	LDR R0,=0X20000024   ;Mode SELECT
	LDR R1,[R0]
	ADD R1,R1,#1
	CMP R1,#4
	MOVEQ R1,#0
	STR R1,[R0]
;	
;	LDR R0,=0x20000056   ;Mode SELECT
;	LDR R1,[R0]
;	MOV R1,#1
;	STR R1,[R0]
	
END_HANDLER
    POP {R0-R1, PC}
	END