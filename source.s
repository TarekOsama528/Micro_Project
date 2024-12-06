    ;INCLUDE Output.s
	INCLUDE TFT.s

    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	;This is the main funcion, you should only call two functions, one that sets up the TFT
	;And the other that draws a rectangle over the entire screen (ie from (0,0) to (320,240)) with a certain color of your choice


	;CALL FUNCTION SETUP
	BL SETUP
	
;	MOV r0, #0; x1
;	MOV r3, #320; x2
;	MOV r1, #0; y1
;	mov r4, #240; y2
;	mov r10, #BLACK
;	BL DRAW_RECTANGLE_FILLED
;	
;	mov r0,#0; X1
;	mov r3, #320
;	
;	mov r1,#0; Y1
;	mov r4, #80
;	mov r10, #RED
;	BL DRAW_RECTANGLE_FILLED
;	
;	mov r1,#81; Y1
;	mov r4, #160
;	mov r10, #WHITE
;	BL DRAW_RECTANGLE_FILLED

;	mov r1,#161; Y1
;	mov r4, #240
;	mov r10, #BLACK
;	BL DRAW_RECTANGLE_FILLED
;	
;	MOV r0, #140; x1
;	MOV r3, #180; x2
;	MOV r1, #100; y1
;	mov r4, #140; y2
;	MOV R10, #BLUE
;	BL DRAW_RECTANGLE_FILLED
	
	

	;FINAL TODO: DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR

	;TODO: draw egypt
	ENDFUNC
    END
