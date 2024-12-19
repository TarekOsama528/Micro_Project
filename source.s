    
	;INCLUDE Output.s
	;INCLUDE TFT.s
	;INCLUDE RTC.S
	;INCLUDE timer.s
	;INCLUDE DEFINITIONS.s
	;IMPORT RTC_INIT
	;IMPORT SETUP
	;IMPORT DRAW_RECTANGLE_FILLED
	IMPORT RTC_INIT
	;IMPORT TIMER_INIT
	IMPORT PIR_Sensors_init
	IMPORT Button_init
	IMPORT TIMER3_INIT
	INCLUDE Display.s

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	
	BL RTC_INIT
	bl SETUP
	;BL ALARM_INIT
	;BL TIMER3_INIT
;	LDR r0, =GPIOA_CRL
;	LDR r1,[r0]
;	mov r1,#0x22222222
;	STR r1, [r0]
;	LDR R1,=GPIOA_ODR
;	mov r0,#0xFFFF
;	str r0,[r1]

;	LDR R0, =RCC_APB2ENR
;	LDR R1,[R0]
;	LDR R1,=0x04
;	STR R1,[R0]
;	
;	LDR r0, =GPIOA_CRL      ; Load the address of GPIOA_CRL into r0
;	MOV r1, #0x22222222      ; Load r1 with 0x22222222 (configure pins as output)
;	STR r1, [r0]             ; Store r1 value to GPIOA_CRL

;	;LDR r1, =GPIOA_ODR       ; Load the address of GPIOA_ODR into r1
;	;MOV r0, #0xFFFF          ; Load r0 with 0xFFFF (set all pins high)
;	;STR r0, [r1]             ; Write r0 to GPIOA_ODR

;	
;	
;inf
;	LDR R0, =RTC_CNTL             ; Address of RTC_CRL
;	
;	ldr r4,[r0]
;	LDR R1,=GPIOA_ODR
;	
;	mov R3,r4
;	
;	STR R3,[R1]
;	
;	b inf
	
	
	
	; Enter RTC Configuration Mode
    LDR R0, =RTC_CRL             ; Address of RTC_CRL
wait_rsf_sync2
    LDR R1, [R0]                 ; Read RTC_CRL
    TST R1, #0x20                ; Check RSF bit (bit 5)
    BEQ wait_rsf_sync2            ; Wait for synchronization (RSF set)

    ORR R1, R1, #0x10            ; Set CNF bit (bit 4) to enter configuration mode
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Set RTC Counter (RTC_CNT) to Zero
    LDR R0, =RTC_CNTL            ; Base address of RTC registers
    LDR R1, =0xF000              ; High part of counter
    STR R1, [R0]                 ; Write to RTC_CNTL

    ; Exit RTC Configuration Mode
    LDR R0, =RTC_CRL             ; Address of RTC_CRL
    LDR R1, [R0]
    BIC R1, R1, #0x10            ; Clear CNF bit (bit 4) to exit configuration mode
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Wait for Configuration to Complete
wait_rtoff2
    LDR R1, [R0]                 ; Read RTC_CRL
    TST R1, #0x20                ; Check RTOFF bit (bit 5)
    BEQ wait_rtoff2              ; Wait until RTOFF is set
;	
	;BL ALARM_INIT
	
;	BL SETUP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	
	mov r0,#0
	mov r3,#480
	mov r1,#0
	mov r4,#320
	mov r10,#WHITE
	BL DRAW_RECTANGLE_FILLED
	
	bl DRAW_SMALL_COLON
	
	BL DRAW_BIG_COLON
;	LDR r1, =RCC_APB2ENR
;	LDR r0, [r1]
;	ORR r0, r0, #0x04
;	STR r0, [r1]
;	
;	
;	;Make the GPIO A mode as output (01 for each pin)
;	LDR r0, =GPIOA_CRL
;	LDR r1,[r0]
;	mov r1, #0x11111111
;	;mov r1,#0x33333333
;	STR r1, [r0]
;	
;	    ; Enable Port B for testing
;    LDR R0 ,=RCC_APB2ENR ;to enable port B
;	LDR R1,[R0]
;	ORR R1,R1,#8
;	STR R1,[R0]

;    LDR R0, =GPIOB_CRL ;to configure first pin of port B as output(medium speed)
;	LDR R1,[R0]
;	bic r1,r1,#0x0F
;	ORR R1,R1,#0x01
;	STR R1,[R0]
;	
;	LDR R0, =0x40010C0C         ; GPIOB Output Data Register
;    LDR R1, [R0]                ; Read current state
;    ORR R1, R1, #0x01           ; Turn on the LED PB0 (bit 0)
;    STR R1, [R0] 
Lop1
	BL delay_1_second
	LDR R0, =RTC_CNTL       ; Address of RTC_CNTL
    LDR R1, [R0]            ; Load RTC_CNTL (lower 16 bits) into R1
    LDR R0, =RTC_CNTH       ; Address of RTC_CNTH
    LDR R2, [R0]            ; Load RTC_CNTH (upper 16 bits) into R2
	
	
	
    ; Step 2: Combine RTC_CNTL and RTC_CNTH into a 32-bit counter
    LSL R2, R2, #16         ; Shift RTC_CNTH to the upper 16 bits
    ORR R1, R1, R2          ; Combine RTC_CNTH and RTC_CNTL into R1

    ; Calculate minutes (R1 / 60)
    MOV R2, #60             ; Divisor for minutes
    UDIV R3, R1, R2         ; R3 = R1 / 60 (total minutes)

    ; Calculate remaining seconds (R1 % 60)
    MUL R4, R3, R2          ; R4 = R3 * 60 (total seconds in full minutes)
    SUB R5, R1, R4          ; R5 = R1 - (R3 * 60) (remaining seconds)

    ; Extract seconds digits (units and tens)
    MOV R2, #10             ; Divisor for tens place
    UDIV R6, R5, R2         ; R6 = R5 / 10 (tens place of seconds)
	
	
	mov r4,r6
	mov r6,#Fifth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds
	
	
    MUL R7, R4, R2          ; R7 = R6 * 10
    SUB R8, R5, R7          ; R8 = R5 - R7 (units place of seconds)
	
	
	mov r4,r8
	mov r6,#Sixth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds

    ; Calculate hours (R3 / 60)
    MOV R2, #60             ; Divisor for hours
    UDIV R9, R3, R2         ; R9 = R3 / 60 (hours)

    ; Calculate remaining minutes (R3 % 60)
    MUL R10, R9, R2         ; R10 = R9 * 60 (total minutes in full hours)
    SUB R11, R3, R10        ; R11 = R3 - (R9 * 60) (remaining minutes)

    ; Extract minutes digits (units and tens)
	MOV R2,#10
    UDIV R12, R11, R2       ; R12 = R11 / 10 (tens place of minutes)
	
	mov r4,r12
	mov r6,#Third_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
    MUL R8, R12, R2        ; R13 = R12 * 10
    SUB R10, R11, R8       ; R14 = R11 - R13 (units place of minutes)
	
	mov r4,r10
	mov r6,#Fourth_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	

    ; Extract hours digits (units and tens)
    UDIV R10, R9, R2        ; R15 = R9 / 10 (tens place of hours)
	
	mov r4,r10
	mov r6,#First_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
    MUL R11, R10, R2        ; R16 = R15 * 10
    SUB R4, R9, R11        ; R17 = R9 - R16 (units place of hours)
	
	
	mov r6,#Second_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS


    ;Now R6 contains hours, 
	;R8 contains minutes, 
	;R5 contains remaining seconds
	
	B Lop1
	
;ODR
;	LDR R0, =0x40010C0C ;to write 1 on PB0
;	LDR R1,[R0]
;	ORR R1,R1,#0x01
;	STR R1,[R0]
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
	
	ENDFUNC
    END
		
		
		
