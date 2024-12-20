	INCLUDE Display.s
		
	AREA MYCODE, CODE, READONLY
DISPLAY_REAL_TIME
	PUSH{R0-R12,LR}
	
	LDR R2,=REAL_TIME
	LDR R1,[R2]
	
    ; Calculate minutes (R1 / 60)
    MOV R2, #60             ; Divisor for minutes
    UDIV R3, R1, R2         ; R3 = R1 / 60 (total minutes)

    ; Calculate remaining seconds (R1 % 60)
    MUL R4, R3, R2          ; R4 = R3 * 60 (total seconds in full minutes)
    SUB R5, R1, R4          ; R5 = R1 - (R3 * 60) (remaining seconds)
	LDR R6,=PREV_SECS
	LDR R8,[R6]
	CMP R5,R8
	BEQ SKIP_SECONDS
	STR R5,[R6]
    ; Extract seconds digits (units and tens)
    MOV R2, #10             ; Divisor for tens place
    UDIV R6, R5, R2         ; R6 = R5 / 10 (tens place of seconds)
	
	
	mov r4,r6
	mov r2, #3
	mov r0,#Fifth_pos_x
	mov r1,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS
	
	mov r2,#10
    MUL R7, R4, R2          ; R7 = R6 * 10
    SUB R8, R5, R7          ; R8 = R5 - R7 (units place of seconds)
	
	
	mov r4,r8
	mov r0,#Sixth_pos_x
	mov r1,#Starting_pos_y_seconds
	mov r2, #3
	BL DISPLAY_NUMBERS

SKIP_SECONDS
    ; Calculate hours (R3 / 60)
    MOV R2, #60             ; Divisor for hours
    UDIV R9, R3, R2         ; R9 = R3 / 60 (hours)

    ; Calculate remaining minutes (R3 % 60)
    MUL R10, R9, R2         ; R10 = R9 * 60 (total minutes in full hours)
    SUB R11, R3, R10        ; R11 = R3 - (R9 * 60) (remaining minutes)
	
	LDR R8,=PREV_MINS
	LDR R6,[R8]
	CMP R11,R6
	BEQ SKIP_MINS
	STR R11,[R8]
    ; Extract minutes digits (units and tens)
	MOV R2,#10
    UDIV R12, R11, R2       ; R12 = R11 / 10 (tens place of minutes)
	
	mov r4,r12
	mov r0,#Third_pos_x
	mov r1,#Starting_pos_y
	mov r2, #9
	BL DISPLAY_NUMBERS
	
	MOV R2, #10
    MUL R8, R12, R2        ; R13 = R12 * 10
    SUB R10, R11, R8       ; R14 = R11 - R13 (units place of minutes)
	
	mov r4,r10
	mov r0,#Fourth_pos_x
	mov r1,#Starting_pos_y
	mov r2, #9
	BL DISPLAY_NUMBERS
	
SKIP_MINS

    ; Extract hours digits (units and tens)
	LDR R8,=PREV_HOURS
	LDR R6,[R8]
	CMP R9,R6
	BEQ SKIP_HOURS
	STR R11,[R8]
	
	MOV R2, #10
    UDIV R10, R9, R2        ; R15 = R9 / 10 (tens place of hours)
	
	mov r4,r10
	mov r0,#First_pos_x
	mov r1,#Starting_pos_y
	mov r2, #9
	BL DISPLAY_NUMBERS
	
	MOV R2, #10
    MUL R11, R10, R2        ; R16 = R15 * 10
    SUB R4, R9, R11        ; R17 = R9 - R16 (units place of hours)
	
	mov r0,#Second_pos_x
	mov r1,#Starting_pos_y
	mov r2, #9
	BL DISPLAY_NUMBERS
	
SKIP_HOURS

	POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CLOCK_DISPLAY_INIT
	PUSH{R0-R12,LR}
	
	mov r2, #9
	
	MOV R4,#0
	mov r0,#First_pos_x
	mov r1,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r0,#Second_pos_x
	mov r1,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r0,#Third_pos_x
	mov r1,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r0,#Fourth_pos_x
	mov r1,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	mov r0, #Fifth_pos_x
	mov r1, #Starting_pos_y_seconds
	mov r2, #3
	mov r4, #0
	BL DISPLAY_NUMBERS
	
	mov r0, #Sixth_pos_x
	mov r1, #Starting_pos_y_seconds
	mov r4, #0
	BL DISPLAY_NUMBERS
	
	mov r0, #400
	mov r1, #Starting_pos_y_dot_seconds
	mov r2, #1
	mov r6, #10
	mov r11, #10
	LDR r3, =DOT
	BL DRAW_IMG
	
	mov r0, #201
	mov r1, #136
	mov r2, #2
	mov r6, #10
	mov r11, #10
	LDR r3, =DOT
	BL DRAW_IMG
	
	mov r0, #201
	mov r1, #(180)
	mov r2, #2
	mov r6, #10
	mov r11, #10
	LDR r3, =DOT
	BL DRAW_IMG
	
	POP{R0-R12,PC}
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_TIMER_TIME
	PUSH{R0-R12,LR}
	
	LDR R2,=TIMER_COUNTDOWN
	LDR R1,[R2]
	
    ; Calculate minutes (R1 / 60)
    MOV R2, #60             ; Divisor for minutes
    UDIV R3, R1, R2         ; R3 = R1 / 60 (total minutes)

    ; Calculate remaining seconds (R1 % 60)
    MUL R4, R3, R2          ; R4 = R3 * 60 (total seconds in full minutes)
    SUB R5, R1, R4          ; R5 = R1 - (R3 * 60) (remaining seconds)
;	LDR R6,=PREV_SECS
;	LDR R8,[R6]
;	CMP R5,R8
;	BEQ SKIP_SECONDS_T
;	STR R5,[R6]
    ; Extract seconds digits (units and tens)
    MOV R2, #10             ; Divisor for tens place
    UDIV R6, R5, R2         ; R6 = R5 / 10 (tens place of seconds)
	
	
	mov r4,r6
	mov r2,#3
	mov r6,#Fifth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS
	
	
	mov r2,#10
    MUL R7, R4, R2          ; R7 = R6 * 10
    SUB R8, R5, R7          ; R8 = R5 - R7 (units place of seconds)
	
	
	mov r4,r8
	mov r2,#3
	mov r6,#Sixth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS

SKIP_SECONDS_T
    ; Calculate hours (R3 / 60)
    MOV R2, #60             ; Divisor for hours
    UDIV R9, R3, R2         ; R9 = R3 / 60 (hours)

    ; Calculate remaining minutes (R3 % 60)
    MUL R10, R9, R2         ; R10 = R9 * 60 (total minutes in full hours)
    SUB R11, R3, R10        ; R11 = R3 - (R9 * 60) (remaining minutes)
	
	LDR R8,=PREV_MINS
	LDR R6,[R8]
	CMP R11,R6
	BEQ SKIP_MINS_T
	STR R11,[R8]
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
	
SKIP_MINS_T

    ; Extract hours digits (units and tens)
	LDR R8,=PREV_HOURS
	LDR R6,[R8]
	CMP R9,R6
	BEQ SKIP_HOURS_T
	STR R11,[R8]
	
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
	
SKIP_HOURS_T

	POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	END