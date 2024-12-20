    
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
	IMPORT BUTTONS_INIT
	IMPORT TIMER3_INIT
	IMPORT TIMER4_INIT
	INCLUDE Display.s
	IMPORT CONFIG_TIME

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION
	
	
	BL BUTTONS_INIT
	
	LDR R1,=REAL_TIME
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1,=PREV_HOURS
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1,=PREV_MINS
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1,=PREV_SECS
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1,=TIMER_COUNTDOWN
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1,=MODE_SELECT
	LDR R0, [R1] ;MODE_SELECT Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	BL TIMER4_INIT
	BL TIMER3_INIT
	bl SETUP
	BL BUTTONS_INIT
	
	LDR R0, =RCC_APB2ENR   ; RCC_APB2ENR Address
	LDR R1, [R0]
	ORR R1, R1, #(1 << 3) ; Enable GPIOB clock
	STR R1, [R0]

	;configure PB9 as output
	LDR R0, =GPIOB_CRL
    LDR R1, [R0]
    BIC R1, R1, #(0xF << 0)     ; Clear PB9 configuration
    ORR R1, R1, #(0x3 << 0)     ; Configure PB9 as Output, 10MHz
    STR R1, [R0]
	
	
	mov r0,#0
	mov r3,#480
	mov r1,#0
	mov r4,#320
	mov r10,#WHITE
	BL DRAW_RECTANGLE_FILLED
	
	mov r0, #25
	mov r1, #25
	mov r2, #2
	mov r5, #4
	BL DRAW_STOPWATCH
	
	
	
	BL CLOCK_DISPLAY_INIT
	
inf
	BL DISPLAY_REAL_TIME
	b inf
;;	LDR R0, =RCC_APB2ENR   ; RCC_APB2ENR Address
;;	LDR R1, [R0]
;;	ORR R1, R1, #(1 << 3) ; Enable GPIOB clock
;;	STR R1, [R0]

;;	;configure PB9 as output
;;	LDR R0, =GPIOB_CRL
;;    LDR R1, [R0]
;;    BIC R1, R1, #(0xF << 0)     ; Clear PB9 configuration
;;    ORR R1, R1, #(0x3 << 0)     ; Configure PB9 as Output, 10MHz
;;    STR R1, [R0]
;;	
;;	
;;	mov r0,#0
;;	mov r3,#480
;;	mov r1,#0
;;	mov r4,#320
;;	mov r10,#WHITE
;;	BL DRAW_RECTANGLE_FILLED
;	
	;BL RTC_INIT
	;bl SETUP
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
	
	
	
;	; Enter RTC Configuration Mode
;    LDR R0, =RTC_CRL             ; Address of RTC_CRL
;wait_rsf_sync2
;    LDR R1, [R0]                 ; Read RTC_CRL
;    TST R1, #0x20                ; Check RSF bit (bit 5)
;    BEQ wait_rsf_sync2            ; Wait for synchronization (RSF set)

;    ORR R1, R1, #0x10            ; Set CNF bit (bit 4) to enter configuration mode
;    STR R1, [R0]                 ; Write back to RTC_CRL

;    ; Set RTC Counter (RTC_CNT) to Zero
;    LDR R0, =RTC_CNTL            ; Base address of RTC registers
;    LDR R1, =0xF000              ; High part of counter
;    STR R1, [R0]                 ; Write to RTC_CNTL

;    ; Exit RTC Configuration Mode
;    LDR R0, =RTC_CRL             ; Address of RTC_CRL
;    LDR R1, [R0]
;    BIC R1, R1, #0x10            ; Clear CNF bit (bit 4) to exit configuration mode
;    STR R1, [R0]                 ; Write back to RTC_CRL

;    ; Wait for Configuration to Complete
;wait_rtoff2
;    LDR R1, [R0]                 ; Read RTC_CRL
;    TST R1, #0x20                ; Check RTOFF bit (bit 5)
;    BEQ wait_rtoff2              ; Wait until RTOFF is set

	
;	BL SETUP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	

;	bl DRAW_SMALL_COLON
;	
;	BL DRAW_BIG_COLON
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

;	LDR R0, =RCC_APB2ENR        ; RCC_APB2ENR address
;    LDR R1, [R0]                ; Read current value
;    ORR R1, R1, #(1 << 0)       ; Enable AFIO clock
;    ORR R1, R1, #(1 << 3)       ; Enable GPIOB clock
;    STR R1, [R0] 

;	BL PIR_Sensors_init
;		
;	LDR R0,=GPIOB_CRH
;	LDR R1,[R0]
;	BIC R1,#(0xF<<16)
;	ORR R1,#(2<<16)
;	STR R1,[R0]
;	
;	LDR R0,=GPIOB_ODR
;	LDR R1,[R0]
;	ORR R1,#(1<<12)
;	STR R1,[R0]
	

    ; Enable Port B for testing
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
	
	BL CLOCK_DISPLAY_INIT
	
Lop1
	LDR R1,=CONFIG_MODE
	LDR R0,[R1]
	CMP R0,#0
	BNE RUN_MODE
	LDR R1,=MODE_SELECT
	LDR R0, [R1] ;REAL_TIME Variable
	CMP R0,#3
	BEQ START_STOPWATCH
	BL CONFIG_TIME
	
RUN_MODE
	LDR R1,=MODE_SELECT
	LDR R0, [R1] ;REAL_TIME Variable
	CMP R0,#0
	BLEQ DISPLAY_REAL_TIME

	CMP R0,#2
	BLNE DISPLAY_TIMER_TIME
;	CMP R0,#0
;	BLNE DISPLAY_TIMER_TIME
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
		
		
			;BL delay_1_second
;	LDR R0, =RTC_CNTL       ; Address of RTC_CNTL
;    LDR R1, [R0]            ; Load RTC_CNTL (lower 16 bits) into R1
;    LDR R0, =RTC_CNTH       ; Address of RTC_CNTH
;    LDR R2, [R0]            ; Load RTC_CNTH (upper 16 bits) into R2
	
	
	
    ; Step 2: Combine RTC_CNTL and RTC_CNTH into a 32-bit counter
;    LSL R2, R2, #16         ; Shift RTC_CNTH to the upper 16 bits
;    ORR R1, R1, R2          ; Combine RTC_CNTH and RTC_CNTL into R1

	;BL DISPLAY_REAL_TIME
		
		
