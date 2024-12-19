	INCLUDE DEFINITIONS.s
	AREA MYCODE,CODE,READONLY
		EXPORT PIR_Sensors_init

PIR_Sensors_init
	PUSH{R0-R12,LR}
;==================================================================================
    ; Enable clock for AFIO and GPIOB
    LDR R0, =RCC_APB2ENR        ; RCC_APB2ENR address
    LDR R1, [R0]                ; Read current value
    ORR R1, R1, #(1 << 0)       ; Enable AFIO clock
    ORR R1, R1, #(1 << 3)       ; Enable GPIOB clock
    STR R1, [R0]                ; Write back

    ; Configure PB13 as input with pull-down
    LDR R0, =GPIOB_CRH          ; GPIOB_CRH address (PB13 is in CRH)
    LDR R1, [R0]                ; Read current value
    BIC R1, R1, #(0xF << 20)    ; Clear configuration for PB13 (bit 20-23)
    ORR R1, R1, #(0x8 << 20)    ; Input with pull-down (CNF=10, MODE=00)
    STR R1, [R0]                ; Write back
    
    ; Pull-down for PB13
    LDR R0, =GPIOB_ODR          ; GPIOB_ODR address
    LDR R1, [R0]
    BIC R1, R1, #(1 << 13)      ; Set PB13 to pull-down (reset bit 13)
    STR R1, [R0]

    ; Map PB13 to EXTI13
    LDR R0, =AFIO_EXTICR4       ; AFIO_EXTICR4 address (EXTI13 is in EXTICR4)
    LDR R1, [R0]
    BIC R1, R1, #(0xF << 4)     ; Clear EXTI13 mapping bits
    ORR R1, R1, #(0x1 << 4)     ; Map PB13 to EXTI13 (0b0001)
    STR R1, [R0]

    ; Configure EXTI13 for falling edge (active low trigger)
    LDR R0, =EXTI_IMR           ; EXTI_IMR address
    LDR R1, [R0]
    ORR R1, R1, #(1 << 13)      ; Unmask EXTI13
    STR R1, [R0]

    LDR R0, =EXTI_FTSR          ; EXTI_FTSR address
    LDR R1, [R0]
    ORR R1, R1, #(1 << 13)      ; Enable falling edge trigger for EXTI13
    STR R1, [R0]

    LDR R0, =EXTI_RTSR          ; EXTI_RTSR address
    LDR R1, [R0]
    BIC R1, R1, #(1 << 13)      ; Disable rising edge trigger for EXTI13
    STR R1, [R0]

    ; Enable EXTI15_10 interrupt in NVIC (PB13 falls under EXTI15_10 group)
    LDR R0, =NVIC_ISER1         ; NVIC_ISER1 (Interrupt Set-Enable Register)
    LDR R1, [R0]
    ORR R1, R1, #(1 << 8)       ; Enable IRQ40 (EXTI15_10)
    STR R1, [R0]

	POP{R0-R12,PC}
	
	END