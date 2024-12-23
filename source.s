    
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
	
	LDR R0,=INVERTED_CHECK
	MOV R1,#0
	STR R1,[R0]
	
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
	
;	mov r0, #0
;	mov r1, #0
;	mov r2, #2
;	mov r6, #63
;	mov r11, #73
;	LDR r3, =LOGO
;	BL DRAW_IMG
;	
;delay_1_second
;	;this function just delays for 1 second
;	LDR r8, =0x206004
;delay_loop
;	SUBS r8, #1
;	CMP r8, #0
;	BGE delay_loop
	

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
	
	
	mov r0, #93
	mov r1, #260
	mov r2, #2
	mov r6, #25
	mov r11, #25
	LDR r3, =celsius_25
	BL DRAW_IMG
	
	mov r0, #420
	mov r1, #270
	mov r2, #2
	mov r6, #26
	mov r11, #20
	LDR r3, =percentage
	BL DRAW_IMG
	
	
	
;	mov r0, #220
;	mov r1, #240
;	mov r2, #2
;	mov r6, #24
;	mov r11, #24
;	LDR r3, =GEAR
;	BL DRAW_IMG
	
		
;	mov r0, #330
;	mov r1, #15
;	mov r2, #2
;	mov r6, #25
;	mov r11, #25
;	LDR r3, =SUN
;	BL DRAW_IMG
	
	
	
;	mov r0, #240
;	mov r1, #(25)
;	mov r2, #1
;	mov r6, #25
;	mov r11, #25
;	LDR r3, =CLOCK_ICON
;	BL DRAW_IMG
	
	BL CLOCK_DISPLAY_INIT
	
;	mov r0, #25
;	mov r1, #25
;	mov r2, #2
;	mov r5, #4
;	BL DRAW_CLOCK
	
	mov r0, #25
	mov r1, #230
	mov r2, #2
	mov r5, #4
	BL DRAW_TEMP
	
	mov r0, #360
	mov r1, #230
	mov r2, #2
	mov r5, #4
	BL DRAW_HUM
	;BL DISPLAY_TEMP
	
	
	BL DISPLAY_TEMP
	BL DISPLAY_HUM
	


MAIN_PROGRAM
	LDR R0,=ALARM_CONFIGURED
	LDR R1,[R0]
	CMP R1,#1
	BNE NO_ALARM
	
	mov r0, #240
	mov r1, #(25)
	mov r2, #1
	mov r6, #25
	mov r11, #25
	LDR r3, =CLOCK_ICON
	BL DRAW_IMG
	B NORMAL_LABEL
	
NO_ALARM
	
	mov r0,#240
	mov r3,#265
	mov r1,#25
	mov r4,#50
	mov r10,#WHITE
	BL DRAW_RECTANGLE_FILLED

NORMAL_LABEL

	LDR R0,=REAL_TIME
	LDR R1,[R0]
	LDR R3,=43200
	CMP R1,R3
	BLO DISPLAY_SUN
	
	mov r0, #330
	mov r1, #15
	mov r2, #2
	mov r6, #25
	mov r11, #25
	LDR r3, =MOON
	BL DRAW_IMG
	
	B END_DAY_NIGHT
		
DISPLAY_SUN
	mov r0, #330
	mov r1, #15
	mov r2, #2
	mov r6, #25
	mov r11, #25
	LDR r3, =SUN
	BL DRAW_IMG
	
	

END_DAY_NIGHT
	
	BL UPDATE_Temp_Humidity
	BL UPDATE_Modes
	
	B MAIN_PROGRAM
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
	
	ENDFUNC
    END
		
		
