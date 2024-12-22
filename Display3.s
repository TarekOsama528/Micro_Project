	INCLUDE Display2.s
	AREA MYCODE, CODE, READONLY
	EXPORT UPDATE_Modes 
	IMPORT TIMER3_INIT
		
UPDATE_Modes
	PUSH{R0-R12,LR}
	
;;	LDR R0,=MODE_Changed
;;	LDR R1,[R0]
;;	CMP R1,#0
;;	BEQ NO_UPDATE
;	MOV R1,#0
;	STR R1,[R0]
	
	
	
	LDR R1,=MODE_SELECT
	LDR R8, [R1] ;REAL_TIME Variable
	
	
	
	
;	mov r0, #25
;	mov r1, #25
;	mov r2, #2
;	mov r5, #4
	
	
	cmp R8,#0
	BLEQ CLOCK_MODE
	
	cmp R8,#1
	BLEQ ALARM_MODE
	
	cmp R8,#2
	BLEQ TIMER_MODE
	
	cmp R8,#3
	BLEQ STOPWATCH_MODE
	
	
	
;NO_UPDATE
	POP{R0-R12,PC}

CLOCK_MODE
	PUSH{R0-R12,LR}
	
	LDR R3, =CLOCK_CONFIGURED
	LDR R4,[R3]
	
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)
	EOREQ R4,R4,#1
	STR R4,[R3]
	
	mov r0, #25
	mov r1, #25
	mov r2, #2
	mov r5, #4
	BL DRAW_CLOCK
	
	LDR R0, =CLOCK_CONFIGURED
	LDR R1,[R0]
	CMP R1,#1
	BEQ DISPLAY_NORMAL
	BLNE CONFIG_CLOCK  
	
	
DISPLAY_NORMAL

	LDR R2,=REAL_TIME
	BL DISPLAY_REAL_TIME
	
	POP{R0-R12,PC}

ALARM_MODE 
	PUSH{R0-R12,LR}
	
	LDR R3, =ALARM_CONFIGURED
	LDR R4,[R3]
	
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)
	EOREQ R4,R4,#1
	STR R4,[R3]
	
	mov r0, #25
	mov r1, #25
	mov r2, #2
	mov r5, #4
	BL DRAW_ALARM
	
	
	LDR R0, =ALARM_CONFIGURED
	LDR R1,[R0]
	CMP R1,#1
	BEQ DISPLAY_NORMAL_ALARM
	BLNE CONFIG_ALARM  
	
DISPLAY_NORMAL_ALARM

	LDR R2,=ALARM_VALUE
	BL DISPLAY_REAL_TIME
	
	POP{R0-R12,PC}
	
TIMER_MODE 
	PUSH{R0-R12,LR}
	
	LDR R3, =TIMER_CONFIGURED
	LDR R4,[R3]
	
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)
	EOREQ R4,R4,#1
	STR R4,[R3]
	
	mov r0, #25
	mov r1, #25
	mov r2, #2
	mov r5, #4
	BL DRAW_TIMER
	
	
	
	LDR R0, =TIMER_CONFIGURED
	LDR R1,[R0]
	CMP R1,#1
	BEQ DISPLAY_NORMAL_TIMER
	BLNE CONFIG_TIMER 
	
;	LDR R3, =ALARM_CONFIGURED
;	LDR R4,[R3]
;	
;	LDR R0,=GPIOB_IDR
;	LDR R1,[R0]
;	TST R1, #(1 << 6)
;	EOREQ R4,R4,#1
;	STR R4,[R3]
;	
;	mov r0, #25
;	mov r1, #25
;	mov r2, #2
;	mov r5, #4
;	BL DRAW_ALARM
;	
;	
;	LDR R0, =ALARM_CONFIGURED
;	LDR R1,[R0]
;	CMP R1,#1
;	BEQ DISPLAY_NORMAL_ALARM
;	BLNE CONFIG_ALARM 
	
	
	
DISPLAY_NORMAL_TIMER
	LDR R2,=TIMER_COUNTDOWN
	BL DISPLAY_REAL_TIME
	
	POP{R0-R12,PC}
	
STOPWATCH_MODE 
	PUSH{R0-R12,LR}
	
	mov r0, #25
	mov r1, #25
	mov r2, #2
	mov r5, #4
	BL DRAW_STOPWATCH

	
END_LOOP
	LDR R2,=STOPWATCH_ON
	LDR R3,[R2]
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1,#(1<<6)   ;check if we pressed CONFIG button PB6 (PULL_UP)
	EOREQ R3,R3,#1
	STR R3,[R2]
	CMP R3,#1
	BNE NO_CHANGE
	
	
	LDR R0, =0x40010C0C       ; GPIOB_ODR address
	LDR R1, [R0]
	EOR R1, R1, #(1 << 0)    ; Toggle PB0
	STR R1, [R0]
	
	;TOGGLE STOPWATCH_ON
	
	; if already on 
	cmp R3,#1
	moveq R3,#0
	cmp R3,#1
	beq NO_CHANGE
	
	
NO_CHANGE
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1,#(1<<5)   ;check if we pressed CONFIG button PB6 (PULL_UP)
	BNE RESUME
	LDR R0,=STOPWATCH_TIME
	MOV R2,#0
	STR R2,[R0]
	LDR R2,=STOPWATCH_ON
	LDR R3,[R2]
	MOV R3,#0
	STR R3,[R2]
	
RESUME
	
	LDR R2, =STOPWATCH_TIME
	BL DISPLAY_REAL_TIME
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1,#(0<<4)
	beq FINISH_LOOP
	b END_LOOP
	


	
FINISH_LOOP
;	LDR R2, =STOPWATCH_TIME
;	BL DISPLAY_REAL_TIME
	
	POP{R0-R12,PC}
	
	

CONFIG_CLOCK
	PUSH {R0-R12,LR}
LOOOP

	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)   ; Check if PB6 is pressed
	BNE LOOP2
	LDR R0,=CONFIG_MODE
	LDR R1,[R0]
	MOV R1,#1 ;MOV
	STR R1,[R0]
	B END_LOOOP
LOOP2	
    ; Check if PB5 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 5)   ; Check if PB5 is pressed
    BNE CHECK_HOURS          ; Wait until PB5 is pressed
	
	LDR R0,=REAL_TIME
	LDR R1,[R0]
	ADD R1,R1,#60
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAY
	BHI NEXT_DAY
	;LDR R2, =REAL_TIME
	;BL DISPLAY_REAL_TIME
	
CHECK_HOURS
	; Check if PB7 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 7)   ; Check if PB5 is pressed
    BNE LOOOP          ; Wait until PB5 is pressed
	
	LDR R0,=REAL_TIME
	LDR R1,[R0]
	ADD R1,R1,#3600
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAY

NEXT_DAY
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAY
	SUB R1,R1,R11
	STR R1,[R0]
	LDR R5,=WEEK_DAY
	LDR R6,[R5]
	ADD R6,R6,#1
	CMP R6,#7
	MOVEQ R6,#0
	STR R6,[R5]

SAME_DAY
	LDR R2, =REAL_TIME
	BL DISPLAY_REAL_TIME
	
	
	
	B LOOOP
	
END_LOOOP
	LDR R0,=CLOCK_CONFIGURED
	LDR R1,[R0]
	MOV R1,#1
	STR R1,[R0]
	
	
	POP {R0-R12,PC}

	
		
		
CONFIG_ALARM
	PUSH {R0-R12,LR}
LOOOPA

	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)   ; Check if PB6 is pressed
	BNE LOOP2A
	LDR R0,=ALARM_CONFIGURED
	LDR R1,[R0]
	MOV R1,#1
	STR R1,[R0]
	B END_LOOOPA
LOOP2A	
    ; Check if PB5 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 5)   ; Check if PB5 is pressed
    BNE CHECK_HOURSA          ; Wait until PB5 is pressed
	
	LDR R0,=ALARM_VALUE
	LDR R1,[R0]
	ADD R1,R1,#60
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYA
	BHI NEXT_DAYA
	;LDR R2, =REAL_TIME
	;BL DISPLAY_REAL_TIME
	
CHECK_HOURSA
	; Check if PB7 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 7)   ; Check if PB5 is pressed
    BNE LOOOPA          ; Wait until PB5 is pressed
	
	LDR R0,=ALARM_VALUE
	LDR R1,[R0]
	ADD R1,R1,#3600
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYA

NEXT_DAYA
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYA
	SUB R1,R1,R11
	STR R1,[R0]
;	LDR R5,=WEEK_DAY
;	LDR R6,[R5]
;	ADD R6,R6,#1
;	CMP R6,#7
;	MOVEQ R6,#0
;	STR R6,[R5]

SAME_DAYA
	LDR R2, =ALARM_VALUE
	BL DISPLAY_REAL_TIME
	
	B LOOOPA
	
END_LOOOPA
	LDR R0,=ALARM_CONFIGURED
	LDR R1,[R0]
	MOV R1,#1
	STR R1,[R0]
	
	
	POP {R0-R12,PC}
	
CONFIG_TIMER
	
	PUSH {R0-R12,LR}
	BL CLOCK_DISPLAY_INIT
	
LOOOPT
	
	LDR R0,=GPIOB_IDR
	LDR R1,[R0]
	TST R1, #(1 << 6)   ; Check if PB6 is pressed
	BNE LOOP2T
	LDR R0,=TIMER_CONFIGURED
	LDR R1,[R0]
	MOV R1,#1
	STR R1,[R0]
	B END_LOOOPT
	
LOOP2T	
    ; Check if PB5 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 5)   ; Check if PB5 is pressed
    BNE CHECK_MINUTEST          ; Wait until PB5 is pressed
	
	LDR R0,=TIMER_COUNTDOWN
	LDR R1,[R0]
	ADD R1,R1,#1
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYT
	B NEXT_DAYT
	;BLO SAME_DAYT
	;BHI NEXT_DAYT
	;LDR R2, =REAL_TIME
	;BL DISPLAY_REAL_TIME
	
CHECK_MINUTEST
	; Check if PB7 is pressed
    LDR R0, =GPIOB_IDR
    LDR R1, [R0]
    TST R1, #(1 << 7)   ; Check if PB5 is pressed
    BNE LOOOPT          ; Wait until PB5 is pressed
	
	LDR R0,=TIMER_COUNTDOWN
	LDR R1,[R0]
	ADD R1,R1,#60
	STR R1,[R0]
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYT

NEXT_DAYT
	LDR R11,=86400
	CMP R1,R11
	BLO SAME_DAYT
	SUB R1,R1,R11
	STR R1,[R0]
;	LDR R5,=WEEK_DAYT
;	LDR R6,[R5]
;	ADD R6,R6,#1
;	CMP R6,#7
;	MOVEQ R6,#0
;	STR R6,[R5]

SAME_DAYT
	LDR R2, =TIMER_COUNTDOWN
	BL DISPLAY_REAL_TIME
	
	
	B LOOOPT
	
END_LOOOPT
;	LDR R0,=TIMER_CONFIGURED
;	LDR R1,[R0]
;	MOV R1,#1
;	STR R1,[R0]
	BL TIMER3_INIT
	POP {R0-R12,PC}
	


	END