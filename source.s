    
	;INCLUDE Output.s
	;INCLUDE TFT.s
	;INCLUDE RTC.S
	INCLUDE timer.s
		
    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BL TIMER_INIT

MAIN_LOOP
;    LDR R0, =TIM2_BASE            ; Base address of TIM2
;	MOV R1, 0
;	LDR R1, [R0, #0x24]           ; Read TIM2_CNT

    B MAIN_LOOP                   ; Loop indefinitely

	
	ENDFUNC
    END
		
		
		
