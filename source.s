
	INCLUDE Output.s
	
	AREA MYCODE, CODE, READONLY
	EXPORT __main
	ENTRY 
	
;RCC_APB2ENR EQU 0x40021018
AFIO_EXTICR1 EQU 0x40010008
EXTI_RTSR EQU 0x40010408
EXTI_FTSR EQU 0x4001040C
EXTI_IMR EQU 0x40010400
NVIC_ISER0 EQU 0xE000E100 
	

__main FUNCTION
	
	;BL Op
	
    ; Enable clock for AFIO and GPIOA
    LDR R0, =RCC_APB2ENR    ; RCC_APB2ENR address
    LDR R1, [R0]           ; Read current value
    ORR R1, R1, #(1 << 0)  ; Enable AFIO clock
    ORR R1, R1, #(1 << 2)  ; Enable GPIOA clock
    STR R1, [R0]           ; Write back

    ; Configure PA0 as input with pull-up
    LDR R0, =GPIOA_CRL    ; GPIOA_CRL address
    LDR R1, [R0]           ; Read current value
    BIC R1, R1, #0xF       ; Clear configuration for PA0
    ORR R1, R1, #(0x8)     ; Input with pull-up/down
    STR R1, [R0]           ; Write back
    LDR R0, =GPIOA_ODR    ; GPIOA_ODR address
    LDR R1, [R0]           ; Read ODR value
    ORR R1, R1, #(1 << 0)  ; Enable pull-up for PA0
    STR R1, [R0]           ; Write back

    ; Map PA0 to EXTI0
    LDR R0, =AFIO_EXTICR1    ; AFIO_EXTICR1 address
    LDR R1, [R0]           ; Read current value
    BIC R1, R1, #0xF       ; Clear EXTI0 mapping bits
    STR R1, [R0]           ; Write back (PA0 -> EXTI0)

    ; Configure EXTI0
    LDR R0, =EXTI_IMR    ; EXTI_IMR address
    LDR R1, [R0]           ; Read current value
    ORR R1, R1, #(1 << 0)  ; Unmask EXTI0
    STR R1, [R0]           ; Write back
    LDR R0, =EXTI_RTSR    ; EXTI_RTSR address
    LDR R1, [R0]           ; Read current value
    ORR R1, R1, #(1 << 0)  ; Enable rising edge trigger
    STR R1, [R0]           ; Write back
    LDR R0, =EXTI_FTSR   ; EXTI_FTSR address
    LDR R1, [R0]           ; Read current value
    BIC R1, R1, #(1 << 0)  ; Disable falling edge trigger
    STR R1, [R0]           ; Write back

    ; Enable EXTI0 interrupt in NVIC
    LDR R0, =NVIC_ISER0   ; NVIC_ISER0 address
    LDR R1, [R0]           ; Read current value
    ORR R1, R1, #(1 << 6)  ; Enable EXTI0 IRQ (Interrupt position 6)
    STR R1, [R0]           ; Write back
	
	; Configure PA1 as output
    LDR R1, [R0]              ; Read current value again
    BIC R1, R1, #(0xF << 4)   ; Clear PA1 bits
    ORR R1, R1, #(0x2 << 4)   ; Set PA1 as output, push-pull, 2MHz
    STR R1, [R0]
	
	
	
EXTI0_IRQHandler
	PUSH {R0-R10,LR}
    LDR R0, =0x40010414       ; EXTI_PR address
    LDR R1, [R0]
    ORR R1, R1, #(1 << 0)     ; Clear EXTI0 pending flag
    STR R1, [R0]

    ; Toggle PA1
    LDR R0, =0x4001080C       ; GPIOA_ODR address
    LDR R1, [R0]
    EOR R1, R1, #(1 << 1)     ; Toggle PA1
    STR R1, [R0]
	POP {R0-R10,PC}

    ;BX LR                  ; Return
	ENDFUNC
	END