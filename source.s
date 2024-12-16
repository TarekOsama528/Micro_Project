    
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
		
    AREA MYCODE, CODE, READONLY
    EXPORT __main
    ENTRY 
	
__main FUNCTION

	
	BL RTC_INIT

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
;wait_rtoff1
;    LDR R1, [R0]                 ; Read RTC_CRL
;    TST R1, #0x20                ; Check RTOFF bit (bit 5)
;    BEQ wait_rtoff1              ; Wait until RTOFF is set
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
;ALARM_INIT
;	;PUSH {R0-R12, LR}
;	
;	LDR R0 ,=RCC_APB2ENR ;to enable port B
;	LDR R1,[R0]
;	ORR R1,R1,#0x08
;	STR R1,[R0]
;	
;	LDR R0, =GPIOB_CRL ;to configure PB0 as output(medium speed)
;	LDR R1,[R0]
;	bic r1,r1,#0x0F
;	ORR R1,R1,#0x01
;	STR R1,[R0]

;    ; Step 1: Enable RTC Clock Source and Synchronization
;    ; Assume the RTC clock (LSE) is already configured and RTC prescaler is set for 1 Hz

;    ; Step 2: Enter RTC Configuration Mode
;    LDR R0, =RTC_CRL             ; Address of RTC_CRL
;wait_rsf_sync
;    LDR R1, [R0]                 ; Read RTC_CRL
;    TST R1, #0x20                ; Check RSF bit (bit 5)
;    BEQ wait_rsf_sync            ; Wait for synchronization (RSF set)

;    ORR R1, R1, #0x10            ; Set CNF bit (bit 4) to enter configuration mode
;    STR R1, [R0]                 ; Write back to RTC_CRL

;    ; Step 3: Set Alarm Value
;    LDR R0, =RTC_BASE            ; Base address of RTC registers
;    LDR R1, =0x0000              ; High part of the alarm
;    STR R1, [R0, #0x20]          ; Write to RTC_ALRH (Alarm High Register)
;    LDR R1, =0x0010              ; Low part of the alarm (e.g., 10 seconds)
;    STR R1, [R0, #0x24]          ; Write to RTC_ALRL (Alarm Low Register)

;    ; Step 4: Enable Alarm Interrupt in RTC
;    LDR R0, =RTC_CRH             ; Address of RTC_CRH
;    LDR R1, [R0]
;    ORR R1, R1, #0x02            ; Set ALRIE bit (bit 1) to enable alarm interrupt
;    STR R1, [R0]                 ; Write back to RTC_CRH

;    ; Step 5: Exit RTC Configuration Mode
;    LDR R0, =RTC_CRL             ; Address of RTC_CRL
;    LDR R1, [R0]
;    BIC R1, R1, #0x10            ; Clear CNF bit (bit 4)
;    STR R1, [R0]                 ; Write back to RTC_CRL

;    ; Step 6: Wait for Configuration Completion
;wait_rtoff11
;    LDR R1, [R0]                 ; Read RTC_CRL
;    TST R1, #0x20                ; Check RTOFF bit (bit 5)
;    BEQ wait_rtoff11             ; Wait until RTOFF is set

;    ; Step 7: Enable Alarm Interrupt in NVIC
;    LDR R0, =0xE000E100          ; NVIC_ISER0 base address
;    LDR R1, =(1 << 17)           ; RTC Alarm IRQ number is 17 (bit position)
;    STR R1, [R0]                 ; Enable RTC Alarm interrupt

    ;POP {R0-R12, PC}             ; Restore registers and return
	
Lop1
	LDR R0,=RTC_CNTL
	LDR R1,[R0]
	
	B Lop1
	
	
	
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
		
		
		
