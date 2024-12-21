    
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
	IMPORT TIMER2_INIT
	INCLUDE Display2.s
	;IMPORT CONFIG_TIME
	IMPORT UPDATE_Modes

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION
	
	
	;BL BUTTONS_INIT

	
	LDR R1,=REAL_TIME
	LDR R0, [R1] ;REAL_TIME Variable
	ldr R0, =0
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
	MOV R0, #100
	STR R0 ,[R1]
	
	LDR R1,=MODE_SELECT
	LDR R0, [R1] ;MODE_SELECT Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	
	LDR R1,=CONFIG_MODE
	LDR R0, [R1] ;MODE_SELECT Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1, =CURRENT_TEMP
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	
	
	LDR R1, =PREV_MODE
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	
	LDR R1, =MODE_Changed
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #1
	STR R0 ,[R1]
	
	LDR R1, =STOPWATCH_ON
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	

	LDR R1, =STOPWATCH_TIME
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	LDR R1, =ALARM_VALUE
	LDR R0, [R1] ;REAL_TIME Variable
	MOV R0, #0
	STR R0 ,[R1]
	
	
	LDR R1, =CLOCK_CONFIGURED
	LDR R0,[R1]
	MOV R0,#0
	STR R0,[R1]
	
		
	LDR R1, =ALARM_CONFIGURED
	LDR R0,[R1]
	MOV R0,#0
	STR R0,[R1]
	
	LDR R1, =TIMER_CONFIGURED
	LDR R0,[R1]
	MOV R0,#0
	STR R0,[R1]
	
	LDR R1, =DID_INCREMENT
	LDR R0,[R1]
	MOV R0,#0
	STR R0,[R1]
	
	LDR R1, =ALARM_CONFIGURED
	LDR R0,[R1]
	MOV R0,#0
	STR R0,[R1]
	
	
	
	BL TIMER4_INIT
	;BL TIMER3_INIT
	BL TIMER2_INIT
	bl SETUP
	BL BUTTONS_INIT
	BL PIR_Sensors_init
	
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
	
	
	BL CLOCK_DISPLAY_INIT
	
;	mov r0, #25
;	mov r1, #25
;	mov r2, #2
;	mov r5, #4
;	BL DRAW_CLOCK
;	
	
	mov r0, #25
	mov r1, #210
	mov r2, #2
	mov r5, #4
	BL DRAW_TEMP
	
	mov r0, #240
	mov r1, #210
	mov r2, #2
	mov r5, #4
	BL DRAW_HUM
	;BL DISPLAY_TEMP
	
	
	BL DISPLAY_TEMP
	BL DISPLAY_HUM
	


Lop1

	BL UPDATE_Temp_Humidity
	BL UPDATE_Modes
;	LDR R1,=CONFIG_MODE
;	LDR R0,[R1]
	
	;CMP R0,#0
	;BNE RUN_MODE
	
;	LDR R1,=MODE_SELECT
;	LDR R0, [R1] ;REAL_TIME Variable
;	BL UPDATE_Modes
	;CMP R0,#3
	;BEQ START_STOPWATCH
	;BL CONFIG_TIME
	
	B Lop1
	







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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
	
	;BL CLOCK_DISPLAY_INIT
	
	

;Lop1

;	BL UPDATE_Temp_Humidity
;	BL UPDATE_Modes
;	LDR R1,=CONFIG_MODE
;	LDR R0,[R1]
;	
;	CMP R0,#0
;	;BNE RUN_MODE
;	
;	LDR R1,=MODE_SELECT
;	LDR R0, [R1] ;REAL_TIME Variable
;	BL UPDATE_Modes
;	CMP R0,#3
;	;BEQ START_STOPWATCH
;	;BL CONFIG_TIME
;	
;	B Lop1
	
	
;RUN_MODE
;	LDR R1,=MODE_SELECT
;	LDR R0, [R1] ;REAL_TIME Variable
;	CMP R0,#0                  ;CLOCK MODE
;	BLEQ DISPLAY_REAL_TIME

;	CMP R0,#1            ;ALARM MODE
;	BNE TIMER_CHECK
;	LDR R3,=ALARM_VALUE
;	LDR R4,[R3]
;	;CMP R4,REAL_TIME
;	
;	;TURN ON on PB0 (BUZZER)
;    LDR R0, =(0x40010C0C)          ; GPIOB Output Data Register
;    LDR R1, [R0]                ; Read current state
;    ORR R1, R1, #0x01           ; TURN ON PB0 (bit 0)
;    STR R1, [R0]  
	
;	BHI DISPLAY_ALARM
	
	
;DISPLAY_ALARM
;	
;	BL DISPLAY_REAL_TIME
	
;TIMER_CHECK
;	CMP R0,#2           ;TIMER MODE
;	BLEQ DISPLAY_TIMER_TIME
	

;START_STOPWATCH
;	CMP R0,#3
;	;BLEQ DISPLAY_STOPWATCH_TIME ;TO BE IMPLEMENTED
;	
;	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	
;	;CONFIG_BUTTON to switch from running mode 4 to config mode 0
;	LDR R0,=GPIOB_IDR
;	LDR R1,[R0]
;	TST R1,#(0<<6)   ;check if we pressed CONFIG button PB6 (PULL_UP)
;	BNE Lop1
;	
;	LDR R0,=CONFIG_MODE   ;CONFIG_MODE check
;	LDR R1,[R0]
;	MOV R1,#0
;	STR R1,[R0]
	
	

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
	
	ENDFUNC
    END
		
		
