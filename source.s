    
	;INCLUDE Output.s
	;INCLUDE TFT.s
	INCLUDE RTC.S
	;INCLUDE timer.s
	;INCLUDE DEFINITIONS.s
	;IMPORT RTC_INIT
	;IMPORT SETUP
	;IMPORT DRAW_RECTANGLE_FILLED
	;IMPORT RTC_INIT
	;IMPORT ALARM_INIT
	IMPORT TIMER_INIT
		
    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	
	BL RTC_INIT
	;BL ALARM_INIT
	;BL TIMER_INIT
	
	
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
;    LDR R1, =0x0000              ; High part of counter
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
;	
	;BL ALARM_INIT
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	
Lop1
	LDR R0,=RTC_CNTL
	LDR R1,[R0]
	
	;CMP R1,#10
	;BEQ ODR

	B Lop1
	
ODR
	LDR R0, =0x40010C0C ;to write 1 on PB0
	LDR R1,[R0]
	ORR R1,R1,#0x01
	STR R1,[R0]
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;	BL SETUP

;	MOV r0, #0; x1
;	MOV r3, #480; x2
;	MOV r1, #0; y1
;	mov r4, #320; y2
;	mov r10, #WHITE
;	BL DRAW_RECTANGLE_FILLED
;	
;	
;	  ; Draw '0'
;	  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    MOV R0, #50        ; X1
;    MOV R1, #100        ; Y1
;    MOV R3, #120        ; X2
;    MOV R4, #200        ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

;	;Draw One
;	MOV R0, #70        ; X1
;    MOV R1, #120        ; Y1
;    MOV R3, #100        ; X2
;    MOV R4, #180       ; Y2
;    MOV R10, #WHITE      ; Color
;    BL DRAW_RECTANGLE_FILLED
;	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	; Draw 2
;	; Top horizontal line
;	;Draw 1
;	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	;Draw One
;	MOV R0, #200        ; X1
;    MOV R1, #100        ; Y1
;    MOV R3, #220        ; X2
;    MOV R4, #200       ; Y2
;    MOV R10, #RED      ; Color
;    BL DRAW_RECTANGLE_FILLED
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	MOV R0, #200        ; X1
;    MOV R1, #100        ; Y1
;    MOV R3, #220        ; X2
;    MOV R4, #200       ; Y2
;    MOV R10, #RED      ; Color
;    BL DRAW_RECTANGLE_FILLED
;	
;	;Draw 2
;	MOV R0, #50        ; X1
;    MOV R1, #100        ; Y1
;    MOV R3, #120        ; X2
;    MOV R4, #200        ; Y2
;    MOV R10, #RED   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

;	 MOV R0, #0      ; X1
;    MOV R1, #160      ; Y1
;    MOV R3, #100     ; X2
;    MOV R4, #200     ; Y2
;    MOV R10, #GREEN   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED
;	
;	
;    MOV R0, #0        ; X1
;    MOV R1, #0        ; Y1
;    MOV R3, #120        ; X2
;    MOV R4, #20        ; Y2
;    MOV R10, #BLUE   ; Color (white)
;    BL DRAW_RECTANGLE_FILLED

    ; Draw the horizontal line of 'A'
   
	
	ENDFUNC
    END
		
		
		
