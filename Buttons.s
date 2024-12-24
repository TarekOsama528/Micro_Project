	
	INCLUDE Display.s
	AREA MYCODE,CODE,READONLY
		;EXPORT EXTI4_IRQHandler
		EXPORT BUTTONS_INIT
		;EXPORT CONFIG_TIME
		
		
MODE_init
    PUSH {R0-R12, LR}             ; Save registers and return address
    
	; Enable clock for GPIOB (Bit 3) and AFIO (Bit 0) (MODE button)
	LDR R0, =0x40021018       ; RCC_APB2ENR address
	LDR R1, [R0]              ; Read current value
	ORR R1, R1, #(1 << 3)     ; Enable GPIOB clock
	ORR R1, R1, #(1 << 0)     ; Enable AFIO clock
	STR R1, [R0]              ; Write back

	; Configure PB4 as input with pull-up
	LDR R0, =0x40010C00       ; GPIOB_CRL address
	LDR R1, [R0]              ; Read current value
	BIC R1, R1, #(0xF << 16)  ; Clear PB4 bits
	ORR R1, R1, #(0x8 << 16)  ; Set PB4 as input with pull-up/down
	STR R1, [R0]              ; Write back


	; Map PB4 to EXTI4
	LDR R0, =0x4001000C       ; AFIO_EXTICR2 address (EXTI4 is in EXTI_CR2)
	LDR R1, [R0]              ; Read current value
	BIC R1, R1, #(0xF << 0)   ; Clear EXTI4 mapping
	ORR R1, R1, #(0x1 << 0)   ; Map EXTI4 to Port B (0x1)
	STR R1, [R0]              ; Write back

	; Configure EXTI4
	LDR R0, =0x40010400       ; EXTI_IMR address
	LDR R1, [R0]              ; Read current value
	ORR R1, R1, #(1 << 4)     ; Unmask EXTI4
	STR R1, [R0]              ; Write back

	LDR R0, =0x40010408       ; EXTI_RTSR address
	LDR R1, [R0]
	ORR R1, R1, #(1 << 4)     ; Enable rising edge trigger
	STR R1, [R0]

	LDR R0, =0x4001040C       ; EXTI_FTSR address
	LDR R1, [R0]
	BIC R1, R1, #(1 << 4)     ; Disable falling edge trigger
	STR R1, [R0]

	; Enable EXTI4 interrupt in NVIC
	LDR R0, =0xE000E100       ; NVIC_ISER0 address
	LDR R1, [R0]
	ORR R1, R1, #(1 << 10)    ; Enable IRQ10 (EXTI4)
	STR R1, [R0]
	
	POP {R0-R12, PC}              ; Restore registers and return
	
INCREMENT_init

    PUSH {R0-R12, LR}             ; Save registers and return address
	
	; Configure PB5 as input with pull-up
	LDR R0, =GPIOB_CRL       ; GPIOB_CRL address
	LDR R1, [R0]              ; Read current value
	BIC R1, R1, #(0xF << 20)  ; Clear PB5 bits
	ORR R1, R1, #(0x1 << 23)  ; Set PB5 as input with pull-up/down
	STR R1, [R0]              ; Write back
	
	LDR R0,=GPIOB_ODR
	LDR R1,[R0]
	ORR R1,#(1<<5) ;Configure it as PUll_up
	STR R1,[R0]
	
	
    POP {R0-R12, PC}              ; Restore registers and return
	
CONFIG_init
	PUSH {R0-R12, LR}
	
		; Configure PB6 as input with pull-up
	LDR R0, =GPIOB_CRL       ; GPIOB_CRL address
	LDR R1, [R0]              ; Read current value
	BIC R1, R1, #(0xF << 24)  ; Clear PB6 bits
	ORR R1, R1, #(0x1 << 27)  ; Set PB6 as input with pull-up/down
	STR R1, [R0]              ; Write back
	
	LDR R0,=GPIOB_ODR
	LDR R1,[R0]
	ORR R1,#(1<<6) ;Configure it as PUll_up
	STR R1,[R0]
	
	POP {R0-R12, PC}
	
MINUTES_HOURS_init
	PUSH {R0-R12, LR}
	
		; Configure PB7 as input with pull-up
	LDR R0, =GPIOB_CRL       ; GPIOB_CRL address
	LDR R1, [R0]              ; Read current value
	BIC R1, R1, #(0xF << 28)  ; Clear PB7 bits
	ORR R1, R1, #(0x1 << 31)  ; Set PB7 as input with pull-up/down
	STR R1, [R0]              ; Write back
	
	LDR R0,=GPIOB_ODR
	LDR R1,[R0]
	ORR R1,#(1<<7) ;Configure it as PUll_up
	STR R1,[R0]
	
	POP {R0-R12, PC}


BUTTONS_INIT
	PUSH {R0-R12, LR}
	
	BL MODE_init
	
	BL INCREMENT_init
	
	BL CONFIG_init
	
	BL MINUTES_HOURS_init
	
	POP {R0-R12, PC}
	
	
	END
