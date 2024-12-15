	INCLUDE DEFINITIONS.s
	
	AREA MYCODE, CODE, READONLY

MAIN
    ; Enable GPIOB and ADC clocks
    LDR R0, =RCC_APB2ENR
    LDR R1, [R0]
    ORR R1, R1, #(1 << 3)       ; Enable GPIOB clock
    ORR R1, R1, #(1 << 9)       ; Enable ADC1 clock
    STR R1, [R0]

    ; Configure PB0 as analog input
    LDR R0, =GPIOB_CRL
    LDR R1, [R0]
    BIC R1, R1, #(0xF << 0)     ; Clear PB0 configuration
    STR R1, [R0]

    ; Configure PB1 as output push-pull
    LDR R1, [R0]
    BIC R1, R1, #(0xF << 4)     ; Clear PB1 configuration
    ORR R1, R1, #(0x1 << 4)     ; Output mode, max 10 MHz
    STR R1, [R0]

    ; Enable ADC
    LDR R0, =ADC1_CR2
    LDR R1, [R0]
    ORR R1, R1, #(1 << 0)       ; Set ADON bit to power up ADC
    STR R1, [R0]

    ; Start ADC calibration
    ORR R1, R1, #(1 << 2)       ; Set CAL bit to start calibration
    STR R1, [R0]

wait_calibration
    ; Wait for calibration to complete
    LDR R1, [R0]
    TST R1, #(1 << 2)           ; Check if CAL bit is still set
    BNE wait_calibration        ; If not cleared, keep waiting

    ; Calibration complete, proceed to configure ADC
    ORR R1, R1, #(1 << 1)       ; Set CONT bit for continuous conversion mode
    STR R1, [R0]

    ; Set sample time for channel 8 (PB0)
    LDR R0, =ADC1_SMPR2
    LDR R1, [R0]
    ORR R1, R1, #(0x7 << (8 * 3)) ; Maximum sample time for channel 8
    STR R1, [R0]

    ; Set regular sequence (channel 8)
    LDR R0, =ADC1_SQR3
    LDR R1, [R0]
    ORR R1, R1, #(8)            ; Channel 8 in the first position
    STR R1, [R0]

loop
    ; Start ADC conversion
    LDR R0, =ADC1_CR2
    LDR R1, [R0]
    ORR R1, R1, #(1 << 22)      ; Set SWSTART bit to start conversion
    STR R1, [R0]

wait_conversion
    ; Wait for conversion to complete
    LDR R0, =ADC1_CR2
    LDR R1, [R0]
    TST R1, #(1 << 1)           ; Check if EOC (End of Conversion) bit is set
    BEQ wait_conversion         ; If not set, keep waiting

    ; Read ADC result
    LDR R0, =ADC1_DR
    LDR R1, [R0]

    ; Toggle LED on PB1 based on ADC result
    CMP R1, #2048               ; Compare with midpoint value
    BHI led_on
    B led_off

led_on
    ; Turn on PB1 (LED)
    LDR R0, =GPIOB_ODR
    LDR R1, [R0]
    ORR R1, R1, #(1 << 1)       ; Set PB1
    STR R1, [R0]
    B loop

led_off
    ; Turn off PB1 (LED)
    LDR R0, =GPIOB_ODR
    LDR R1, [R0]
    BIC R1, R1, #(1 << 1)       ; Clear PB1
    STR R1, [R0]
    B loop