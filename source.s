    
	INCLUDE Display2.s
	IMPORT RTC_INIT
	IMPORT PIR_Sensors_init
	IMPORT BUTTONS_INIT
	IMPORT TIMER3_INIT
	IMPORT TIMER4_INIT
	IMPORT TIMER2_INIT
	IMPORT UPDATE_Modes

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	
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
	MOV R0, #0
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
	
	LDR R1, =WEEK_DAY
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
	


MAIN_PROGRAM

	BL UPDATE_Temp_Humidity
	BL UPDATE_Modes
	
	B MAIN_PROGRAM
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
	
	ENDFUNC
    END
		
		
