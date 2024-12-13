    ;INCLUDE Output.s
	;INCLUDE TFT.s
	INCLUDE RTC.S

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	;This is the main funcion, you should only call two functions, one that sets up the TFT
	;And the other that draws a rectangle over the entire screen (ie from (0,0) to (320,240)) with a certain color of your choice


	;CALL FUNCTION SETUP
;	BL SETUP
;	
;	
;	
;	MOV r0, #0; x1
;	MOV r3, #480; x2
;	MOV r1, #0; y1
;	mov r4, #340; y2
;	mov r10, #BLACK
;	BL DRAW_RECTANGLE_FILLED
;	
;	
;	  ; Draw the vertical lines of 'A'
;    MOV R0, #30        ; X1
;    MOV R1, #60        ; Y1
;    MOV R3, #100        ; X2
;    MOV R4, #180        ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

;    MOV R0, #50        ; X1
;    MOV R1, #60        ; Y1
;    MOV R3, #80        ; X2
;    MOV R4, #80        ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

;    ; Draw the horizontal line of 'A'
;    MOV R0, #80        ; X1
;    MOV R1, #60        ; Y1
;    MOV R3, #100        ; X2
;    MOV R4, #180     ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED
;	
;	
;	MOV R0, #50        ; X1
;    MOV R1, #160        ; Y1
;    MOV R3, #80        ; X2
;    MOV R4, #180     ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

	;FINAL TODO: DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR
	;TODO: draw egypt
	
	BL RTC_INIT 
LOOPP
	LDR R0,=RTC_CNTL
	LDR R1,[R0]
	B LOOPP
	
	ENDFUNC
    END
