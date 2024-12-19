

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
	EOR R1, R1, #(1 << 13)    ; Toggle PB13
	STR R1, [R0]

    POP {R0-R1, PC}
	END