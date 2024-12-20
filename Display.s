	INCLUDE TFT.s
	AREA MYCODE, CODE, READONLY
		
		
		
;DRAW_NUMBER_ZERO
;	PUSH {R0-R12,LR}
;	MOV R0, #50	;X1
;	MOV R1, #100 ;Y1
;	MOV R3, #120 ;X2
;	MOV R4, #200 ;Y2
;	MOV R10, #RED ;Color (Red)
;	BL DRAW_RECTANGLE_FILLED
;	
;	
;	MOV R0, #70 ;X1
;	MOV R1, #120 ;Y1
;	MOV R3, #100 ;X2
;	MOV R4, #180 ;Y2
;	MOV R10, #WHITE ;Color (White)
;	BL DRAW_RECTANGLE_FILLED
;	
;	POP {R0-R12,PC}

;Width of every number = 50
;Height of every number = 80

;Starting y is 114
;ending y is 194
DRAW_NUMBER_ZERO
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6 ;62
    MOV R1, R7 ; 114  ; X2 = base_x + 120
    ADD R3, R6, #50   ; Y2 = base_y + 200
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0,R6, #10
    ADD R1,R7, #10   ; X2 =  base_x + 120
    ADD R3,R6, #40   ; Y2 = base_y + 200
	ADD R4,R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Width of every number = 20
;Height of every number = 40
DRAW_NUMBER_ZERO_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6 ;62
    MOV R1, R7 ; 114  ; X2 = base_x + 120
    ADD R3, R6, #20   ; Y2 = base_y + 200
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0,R6, #5
    ADD R1,R7, #10   ; X2 =  base_x + 120
    ADD R3,R6, #15   ; Y2 = base_y + 200
	ADD R4,R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
DRAW_NUMBER_ONE
    PUSH {R0-R12,LR}
;CLEAR EL PASHA OMAR REDA
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	ADD R0,R6,#25
    MOV R1, R7
    ADD R3, R6, #35
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_ONE_SECONDS
    PUSH {R0-R12,LR}
;CLEAR EL PASHA OMAR REDA
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	ADD R0,R6, #5
    MOV R1, R7
    ADD R3, R6, #15
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	

	
	
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_TWO
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3,R6, #40   ; Y2 = base_y + 200
	ADD R4,R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #45   ; X2 =  base_x + 120
    ADD R3, R6, #50   ; Y2 = base_y + 200
	ADD R4, R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_TWO_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3,R6, #10   ; Y2 = base_y + 200
	ADD R4,R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #25   ; X2 =  base_x + 120
    ADD R3, R6, #30   ; Y2 = base_y + 200
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_THREE
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0,R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3, R6, #40   ; Y2 = base_y + 200
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0,R6
    ADD R1, R7, #45 
    ADD R3, R6, #40
	ADD R4, R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_THREE_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0,R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3, R6, #10   ; Y2 = base_y + 200
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0,R6
    ADD R1, R7, #25 
    ADD R3, R6, #10
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_FOUR
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
	MOV R0, R6
    MOV R1, R7  
    ADD R3, R6, #50  
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    MOV R1, R7
    ADD R3, R6, #40
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1,R7, #45   ; X2 =  base_x + 120
    ADD R3, R6, #40   ; Y2 = base_y + 200
	ADD R4,R7,#80
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_FOUR_SECONDS
    PUSH {R0-R12,LR}
    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
	MOV R0, R6
    MOV R1, R7  
    ADD R3, R6, #20  
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #5
    MOV R1, R7
    ADD R3, R6, #15
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1,R7, #25   ; X2 =  base_x + 120
    ADD R3, R6, #15   ; Y2 = base_y + 200
	ADD R4,R7, #40
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_FIVE
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #10
    ADD R3, R6, #50
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #45
    ADD R3, R6, #40
	ADD R4, R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_FIVE_SECONDS
    PUSH {R0-R12,LR}
    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #5
    ADD R1, R7, #10
    ADD R3, R6, #20
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #25
    ADD R3, R6, #15
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_SIX
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3, R6, #50   ; Y2 = base_y + 200
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6,#10
    ADD R1, R7, #45   ; X2 =  base_x + 120
    ADD R3, R6, #40   ; Y2 = base_y + 200
	ADD R4, R7,#70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_SIX_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
	; mov R2,R0    ; X1 = base_x + 50
	; mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #10   ; X2 =  base_x + 120
    ADD R3, R6, #20   ; Y2 = base_y + 200
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #25   ; X2 =  base_x + 120
    ADD R3, R6, #15   ; Y2 = base_y + 200
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
    POP {R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_NUMBER_SEVEN
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0,R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #10
    ADD R3, R6, #40
	ADD R4, R7, #80
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_SEVEN_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0,R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #5
    ADD R3, R6, #15
	ADD R4, R7, #40
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DRAW_NUMBER_EIGHT
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #10
    ADD R3, R6, #40
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #45   ; X2 =  base_x + 120
    ADD R3, R6, #40   ; Y2 = base_y + 200
	ADD R4, R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_EIGHT_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
	; mov R2,R0    ; X1 = base_x + 50
	; mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #5
    ADD R1, R7, #10
    ADD R3, R6, #15
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #5
    ADD R1, R7, #25   ; X2 =  base_x + 120
    ADD R3, R6, #15   ; Y2 = base_y + 200
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_NUMBER_NINE
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #50
	ADD R4, R7, #80
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #10
    ADD R1, R7, #10
    ADD R3, R6, #40
	ADD R4, R7, #35
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #45
    ADD R3, R6, #40
	ADD R4, R7, #70
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DRAW_NUMBER_NINE_SECONDS
    PUSH {R0-R12,LR}

    ; Load base coordinates into R0 (base_x) and R1 (base_y)
    MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    MOV R10, #BLACK    ; Set color to white

    ; Draw the outer rectangle (red in original code, now black)
;    mov R2,R0    ; X1 = base_x + 50
;    mov R3,R1 ; Y1 = base_y + 100
	MOV R0, R6
    MOV R1, R7
    ADD R3, R6, #20
	ADD R4, R7, #40
    BL DRAW_RECTANGLE_FILLED
	
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	ADD R0, R6, #5
    ADD R1, R7, #10
    ADD R3, R6, #15
	ADD R4, R7, #15
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	
	MOV R6, r11  ; R0 now has Starting x coordinate
    MOV R7, r12  ; R1 now has Starting Y coordinate
    ; Draw the inner rectangle (white in original code, now black)
	MOV R0, R6
    ADD R1, R7, #25
    ADD R3, R6, #15
	ADD R4, R7, #30
    MOV R10, #WHITE
    BL DRAW_RECTANGLE_FILLED
	

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_BIG_COLON
    PUSH {R0-R12,LR}
	;CLEAR EL PASHA OMAR REDA
	MOV R0, #185
    MOV R1, #132   ; X2 = base_x + 120
    MOV R3, #196   ; Y2 = base_y + 200
	MOV R4, #145
	MOV R10, #BLACK    ; Set color to white
    BL DRAW_RECTANGLE_FILLED
	
    ; Load base coordinates into R0 (base_x) and R1 (base_y)
	MOV R0, #185
    MOV R1, #160   ; X2 = base_x + 120
    MOV R3, #196   ; Y2 = base_y + 200
	MOV R4, #173
	MOV R10, #BLACK    ; Set color to white
    BL DRAW_RECTANGLE_FILLED

    POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
DRAW_SMALL_COLON
    PUSH {R0-R12,LR}
	;CLEAR EL PASHA OMAR REDA
	MOV R0, #330
    MOV R1, #181   ; X2 = base_x + 120
    MOV R3, #341   ; Y2 = base_y + 200
	MOV R4, #194
	MOV R10, #BLACK    ; Set color to white
    BL DRAW_RECTANGLE_FILLED
	
    POP {R0-R12,PC}
	
DISPLAY_NUMBERS
	PUSH{R0-R12,LR}
	;R4 gets the value to display
	;r11 gets the x value
	;r12 gets the y value
	
	mov r11,r6
	mov r12,r7
	cmp R4,#0
	BLEQ DRAW_NUMBER_ZERO
	
	
	cmp R4,#1
	BLEQ DRAW_NUMBER_ONE
	
	
	cmp R4,#2
	BLEQ DRAW_NUMBER_TWO
	
	cmp R4,#3
	BLEQ DRAW_NUMBER_THREE
	
	cmp R4,#4
	BLEQ DRAW_NUMBER_FOUR
	
	cmp R4,#5
	BLEQ DRAW_NUMBER_FIVE
	
	cmp R4,#6
	BLEQ DRAW_NUMBER_SIX
	
	cmp R4,#7
	BLEQ DRAW_NUMBER_SEVEN
	
	cmp R4,#8
	BLEQ DRAW_NUMBER_EIGHT
	
	cmp R4,#9
	BLEQ DRAW_NUMBER_NINE
	

	
	POP{R0-R12,PC}
	
DISPLAY_NUMBERS_seconds
	PUSH{R0-R12,LR}
	;R4 gets the value to display
	;r6 gets the x value
	;r7 gets the y value
	
	mov r11,r6
	mov r12,r7
	cmp R4,#0
	BLEQ DRAW_NUMBER_ZERO_SECONDS
	
	
	
	cmp R4,#1
	BLEQ DRAW_NUMBER_ONE_SECONDS
	
	
	cmp R4,#2
	BLEQ DRAW_NUMBER_TWO_SECONDS
	
	cmp R4,#3
	BLEQ DRAW_NUMBER_THREE_SECONDS
	
	cmp R4,#4
	BLEQ DRAW_NUMBER_FOUR_SECONDS
	
	cmp R4,#5
	BLEQ DRAW_NUMBER_FIVE_SECONDS
	
	cmp R4,#6
	BLEQ DRAW_NUMBER_SIX_SECONDS
	
	cmp R4,#7
	BLEQ DRAW_NUMBER_SEVEN_SECONDS
	
	cmp R4,#8
	BLEQ DRAW_NUMBER_EIGHT_SECONDS
	
	cmp R4,#9
	BLEQ DRAW_NUMBER_NINE_SECONDS
	

	
	POP{R0-R12,PC}
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
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
	mov r6,#Fifth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds
	

    MUL R7, R4, R2          ; R7 = R6 * 10
    SUB R8, R5, R7          ; R8 = R5 - R7 (units place of seconds)
	
	
	mov r4,r8
	mov r6,#Sixth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds

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
	mov r6,#Third_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
    MUL R8, R12, R2        ; R13 = R12 * 10
    SUB R10, R11, R8       ; R14 = R11 - R13 (units place of minutes)
	
	mov r4,r10
	mov r6,#Fourth_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
SKIP_MINS

    ; Extract hours digits (units and tens)
	LDR R8,=PREV_HOURS
	LDR R6,[R8]
	CMP R9,R6
	BEQ SKIP_HOURS
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
	
SKIP_HOURS

	POP {R0-R12,PC}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CLOCK_DISPLAY_INIT
	PUSH{R0-R12,LR}
	
	MOV R4,#0
	mov r6,#First_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r6,#Second_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r6,#Third_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
	MOV R4,#0
	mov r6,#Fourth_pos_x
	mov r7,#Starting_pos_y
	BL DISPLAY_NUMBERS
	
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
	mov r6,#Fifth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds
	

    MUL R7, R4, R2          ; R7 = R6 * 10
    SUB R8, R5, R7          ; R8 = R5 - R7 (units place of seconds)
	
	
	mov r4,r8
	mov r6,#Sixth_pos_x
	mov r7,#Starting_pos_y_seconds
	BL DISPLAY_NUMBERS_seconds

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
		
		
		
		
		
		