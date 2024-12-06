	INCLUDE DEFINITIONS.s
	
	AREA MYCODE, CODE, READONLY


	

;the following are pins connected from the TFT to our EasyMX board
;RD = PA10		Read pin	--> to read from touch screen input 
;WR = PA11		Write pin	--> to write data/command to display
;RS = PA12		Command pin	--> to choose command or data to write
;CS = PA15		Chip Select	--> to enable the TFT, lol	(active low)
;RST = PA8		Reset		--> to reset the TFT (active low)
;D0-7 = PA0-7	Data BUS	--> Put your command or data on this bus



;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FUNCTIONS' DEFINITIONS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



	



;#####################################################################################################################################################################
LCD_WRITE
	;this function takes what is inside r2 and writes it to the tft
	;this function writes 8 bits only
	;later we will choose whether those 8 bits are considered a command, or just pure data
	;your job is to just write 8-bits (regardless if data or command) to PE0-7 and set WR appropriately
	;arguments: R2 = data to be written to the D0-7 bus

	;TODO: PUSH THE NEEDED REGISTERS TO SAVE THEIR CONTENTS. HINT: Push any register you will modify inside the function, and LR 
	PUSH {R0-R12, LR}
	
	MOV R3, R2

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 0 ;;;;;;;;;;;;;;;;;;;;;
	;TODO: RESET WR TO 0
	MOV R2,  #0x0B
	bl reset_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;;;;;;;;;;;;; HERE YOU PUT YOUR DATA which is in R2 TO PE0-7 ;;;;;;;;;;;;;;;;;
	;TODO: SET PE0-7 WITH THE LOWER 8-bits of R2
	;only write the lower byte to PE0-7
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
;	MOV R1, R3
;	STRB R1, [R0]

	AND R1,R1,#0xFFFFFF00
	AND R3,R3, #0x0FF
	ORR R1,R3,R1
	STR R1,[R0]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET WR TO 1 AGAIN (ie make a rising edge)
	MOV R2,  #0x0B
	bl set_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;TODO: POP THE REGISTERS YOU JUST PUSHED, and PC
	POP {R0-R12, PC}
;#####################################################################################################################################################################











;#####################################################################################################################################################################
LCD_COMMAND_WRITE
	;this function writes a command to the TFT, the command is read from R2
	;it writes LOW to RS first to specify that we are writing a command not data.
	;then it normally calls the function LCD_WRITE we just defined above
	;arguments: R2 = data to be written on D0-7 bus
	
	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH {R0-R12, LR}
	
	MOV R3, R2
	
	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RD to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RD HIGH (we won't need reading anyways, but we must keep read pin to high, which means we will not read anything)
	MOV R2, #0x0A
	bl set_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



	;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RS to 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 0 (to specify that we are writing commands not data on the D0-7 bus)
	MOV R2, #0x0C
	bl reset_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	MOV R2, R3
	
	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE


	;TODO: POP ALL REGISTERS YOU PUSHED
	POP {R0-R12, PC}
	
;#####################################################################################################################################################################






;#####################################################################################################################################################################
LCD_DATA_WRITE
	;this function writes Data to the TFT, the data is read from R2
	;it writes HIGH to RS first to specify that we are writing actual data not a command.
	;arguments: R2 = data

	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH {R0-R12, LR}

	MOV R3, R2
	
	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RD to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RD HIGH (we won't need reading anyways, but we must keep read pin to high, which means we will not read anything)
	MOV R2, #0x0A
	BL set_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	



	;;;;;;;;;;;;;;;;;;;; SETTING RS to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 1 (to specify that we are sending actual data not a command on the D0-7 bus)
	MOV R2, #0x0C
	BL set_pin
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	MOV R2, R3
	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE

	;TODO: POP ANY REGISTER YOU PUSHED
	POP {R0-R12, PC}
	
;#####################################################################################################################################################################




; REVISE WITH YOUR TA THE LAST 3 FUNCTIONS (LCD_WRITE, LCD_COMMAND_WRITE AND LCD_DATA_WRITE BEFORE PROCEEDING)




;#####################################################################################################################################################################
LCD_INIT
	;This function executes the minimum needed LCD initialization measures
	;Only the necessary Commands are covered
	;Even tho there are so many more in the DataSheet

	;TODO: PUSH ANY NEEDED REGISTERS
	push {R0-R12, LR}


	;;;;;;;;;;;;;;;;; HARDWARE RESET (putting RST to high then low then high again) ;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RESET PIN TO HIGH
	MOV R2, #0x8
	BL set_pin
	

	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	bl delay_half_second

	;TODO: RESET RESET PIN TO LOW
	BL reset_pin

	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	bl delay_half_second

	;TODO: SET RESET PIN TO HIGH AGAIN
	bl set_pin

	;TODO: DELAY FOR SOME TIME (USE ANY FUNCTION AT THE BOTTOM OF THIS FILE)
	bl delay_half_second
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






	;;;;;;;;;;;;;;;;; PREPARATION FOR WRITE CYCLE SEQUENCE (setting CS to high, then configuring WR and RD, then resetting CS to low) ;;;;;;;;;;;;;;;;;;
	;TODO: SET CS PIN HIGH
	MOV R2, #0x0f
	BL set_pin

	;TODO: SET WR PIN HIGH
	MOV R2, #0x0B
	BL set_pin
	
	;TODO: SET RD PIN HIGH
	MOV R2, #0x0A
	BL set_pin

	;TODO: SET CS PIN LOW
	MOV R2, #0x0F
	BL reset_pin
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	




	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SOFTWARE INITIALIZATION SEQUENCE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;ISSUE THE "SET CONTRAST" COMMAND, ITS HEX CODE IS 0xC5
;	MOV R2, #0xC5
;	BL LCD_COMMAND_WRITE

;	;THIS COMMAND REQUIRES 2 PARAMETERS TO BE SENT AS DATA, THE VCOM H, AND THE VCOM L
;	;WE WANT TO SET VCOM H TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 1111111 OR 0x7F HEXA
;	;SEND THE FIRST PARAMETER (THE VCOM H) NEEDED BY THE COMMAND, WITH HEX 0x7F, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
;	MOV R2, #0x7F
;	BL LCD_DATA_WRITE

;	;WE WANT TO SET VCOM L TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 00000000 OR 0x00 HEXA
;	;SEND THE SECOND PARAMETER (THE VCOM L) NEEDED BY THE CONTRAST COMMAND, WITH HEX 0x00, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
;	MOV R2, #0x00
;	BL LCD_DATA_WRITE


	;MEMORY ACCESS CONTROL AKA MADCLT | DATASHEET PAGE 127
	;WE WANT TO SET MX (to draw from left to right) AND SET MV (to configure the TFT to be in horizontal landscape mode, not a vertical screen)
	;TODO: ISSUE THE COMMAND MEMORY ACCESS CONTROL, HEXCODE 0x36
	MOV R2, #0X36
	BL LCD_COMMAND_WRITE 

	;TODO: SEND ONE NEEDED PARAMETER ONLY WITH MX AND MV SET TO 1. HOW WILL WE SEND PARAMETERS? AS DATA OR AS COMMAND?
	MOV R2, #0x28
	BL LCD_DATA_WRITE



	;COLMOD: PIXEL FORMAT SET | DATASHEET PAGE 134
	;THIS COMMAND LETS US CHOOSE WHETHER WE WANT TO USE 16-BIT COLORS OR 18-BIT COLORS.
	;WE WILL ALWAYS USE 16-BIT COLORS
	;TODO: ISSUE THE COMMAND COLMOD
	MOV R2, #0x3A
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE NEEDED PARAMETER WHICH CORRESPONDS TO 16-BIT RGB AND 16-BIT MCU INTERFACE FORMAT
	MOV R2, #0x55
	BL LCD_DATA_WRITE
	

	;SLEEP OUT | DATASHEET PAGE 101
	;TODO: ISSUE THE SLEEP OUT COMMAND TO EXIT SLEEP MODE (THIS COMMAND TAKES NO PARAMETERS, JUST SEND THE COMMAND)
	MOV R2, #0x11
	BL LCD_COMMAND_WRITE

	;NECESSARY TO WAIT 5ms BEFORE SENDING NEXT COMMAND
	;I WILL WAIT FOR 10MSEC TO BE SURE
	;TODO: DELAY FOR AT LEAST 10ms
	BL delay_half_second


	;DISPLAY ON | DATASHEET PAGE 109
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
	MOV R2, #0x29
	BL LCD_COMMAND_WRITE
	


	;COLOR INVERSION OFF | DATASHEET PAGE 105
	;NOTE: SOME TFTs HAS COLOR INVERTED BY DEFAULT, SO YOU WOULD HAVE TO INVERT THE COLOR MANUALLY SO COLORS APPEAR NATURAL
	;MEANING THAT IF THE COLORS ARE INVERTED WHILE YOU ALREADY TURNED OFF INVERSION, YOU HAVE TO TURN ON INVERSION NOT TURN IT OFF.
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
;	MOV R2, #0x20
;	BL LCD_COMMAND_WRITE
	MOV R2, #0x21
	BL LCD_COMMAND_WRITE
	


	;MEMORY WRITE | DATASHEET PAGE 245
	;WE NEED TO PREPARE OUR TFT TO SEND PIXEL DATA, MEMORY WRITE SHOULD ALWAYS BE ISSUED BEFORE ANY PIXEL DATA SENT
	;TODO: ISSUE MEMORY WRITE COMMAND
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE
		


	;TODO: POP ALL PUSHED REGISTERS
	pop {R0-R12, PC}
	

;#####################################################################################################################################################################






; REVISE THE FUNCTION LCD_INIT WITH YOUR TA BEFORE PROCEEDING






;#####################################################################################################################################################################
ADDRESS_SET
	;THIS FUNCTION TAKES X1, X2, Y1, Y2
	;IT ISSUES COLUMN ADDRESS SET TO SPECIFY THE START AND END COLUMNS (X1 AND X2)
	;IT ISSUES PAGE ADDRESS SET TO SPECIFY THE START AND END PAGE (Y1 AND Y2)
	;THIS FUNCTION JUST MARKS THE PLAYGROUND WHERE WE WILL ACTUALLY DRAW OUR PIXELS, MAYBE TARGETTING EACH PIXEL AS IT IS.
	;R0 = X1
	;R1 = X2
	;R3 = Y1
	;R4 = Y2

	;PUSHING ANY NEEDED REGISTERS
	PUSH {R0-R12, LR}

	;COLUMN ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2A
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING COLUMN, AKA HIGHER 8-BITS OF X1)	
	MOV R2, R0 ,LSR #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING COLUMN, AKA LOWER 8-BITS OF X1)
	MOV R2, R0
	BL LCD_DATA_WRITE


	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING COLUMN, AKA HIGHER 8-BITS OF X2)
	MOV R2, R1, LSR #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING COLUMN, AKA LOWER 8-BITS OF X2)
	MOV R2, R1
	BL LCD_DATA_WRITE



	;PAGE ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2B
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING PAGE, AKA HIGHER 8-BITS OF Y1)
	MOV R2, R3, LSR #8
	BL LCD_DATA_WRITE	

	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING PAGE, AKA LOWER 8-BITS OF Y1)
	MOV R2, R3
	BL LCD_DATA_WRITE	


	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING PAGE, AKA HIGHER 8-BITS OF Y2)
	MOV R2, R4, LSR #8
	BL LCD_DATA_WRITE	

	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING PAGE, AKA LOWER 8-BITS OF Y2)
	MOV R2, R4
	BL LCD_DATA_WRITE	

	;MEMORY WRITE
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE


	;POPPING ALL REGISTERS I PUSHED
	POP {R0-R12, PC}
;#####################################################################################################################################################################



;#####################################################################################################################################################################
DRAWPIXEL
	PUSH {R0-R12, LR}
	;THIS FUNCTION TAKES X AND Y AND A COLOR AND DRAWS THIS EXACT PIXEL
	;NOTE YOU HAVE TO CALL ADDRESS SET ON A SPECIFIC PIXEL WITH LENGTH 1 AND WIDTH 1 FROM THE STARTING COORDINATES OF THE PIXEL, THOSE STARTING COORDINATES ARE GIVEN AS PARAMETERS
	;THEN YOU SIMPLY ISSUE MEMORY WRITE COMMAND AND SEND THE COLOR
	;R0 = X
	;R1 = Y
	;R10 = COLOR

	;R0 = X1
	;R1 = X2
	;R3 = Y1
	;R4 = Y2

	;CHIP SELECT ACTIVE, WRITE LOW TO CS
	LDR r3, =GPIOA_ODR
	LDR r4, [r3]
	AND r4, r4, #0xFFFF7FFF
	STR r4, [r3]

	;TODO: SETTING PARAMETERS FOR FUNC 'ADDRESS_SET' CALL, THEN CALL FUNCTION ADDRESS SET
	;NOTE YOU MIGHT WANT TO PERFORM PARAMETER REORDERING, AS ADDRESS SET FUNCTION TAKES X1, X2, Y1, Y2 IN R0, R1, R3, R4 BUT THIS FUNCTION TAKES X,Y IN R0 AND R1
	MOV r0,r0
	mov r6,r1
	add r1,r0,#1
	mov r3,r6
	add r4,r3,#1
	BL ADDRESS_SET
	
	;MEMORY WRITE
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE


	;SEND THE COLOR DATA | DATASHEET PAGE 114
	;HINT: WE SEND THE HIGHER 8-BITS OF THE COLOR FIRST, THEN THE LOWER 8-BITS
	;HINT: WE SEND THE COLOR OF ONLY 1 PIXEL BY 2 DATA WRITES, THE FIRST TO SEND THE HIGHER 8-BITS OF THE COLOR, THE SECOND TO SEND THE LOWER 8-BITS OF THE COLOR
	;REMINDER: WE USE 16-BIT PER PIXEL COLOR
	;TODO: SEND THE SINGLE COLOR, PASSED IN R10
	MOV R2,R10,LSR #8
	BL LCD_DATA_WRITE
	MOV R2,R10
	BL LCD_DATA_WRITE
	


	
	POP {R0-r12, PC}
;#####################################################################################################################################################################


;	REVISE THE PREVIOUS TWO FUNCTIONS (ADDRESS_SET AND DRAW_PIXEL) WITH YOUR TA BEFORE PROCEEDING








;##########################################################################################################################################
DRAW_RECTANGLE_FILLED
	;TODO: IMPLEMENT THIS FUNCTION ENTIRELY, AND SPECIFY THE ARGUMENTS IN COMMENTS, WE DRAW A RECTANGLE BY SPECIFYING ITS TOP-LEFT AND LOWER-RIGHT POINTS, THEN FILL IT WITH THE SAME COLOR
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3
	;Y2 = [] r4
	;COLOR = [] r10
	push {r0-r12, LR}
	
	mov r5, r0; X1
	mov r6, r3;X2
	mov r7, r1;Y1
	mov r8, r4;Y2
	
	mov r0, r5
	mov r1, r6
	mov r3, r7
	mov r4, r8
	BL ADDRESS_SET

	sub r1, r1, r0
	sub r4, r4, r3
	
	mul r1, r1, r4 ; area in r1


colour_send_loop
	MOV R2,R10,LSR #8
	BL LCD_DATA_WRITE
	MOV R2,R10
	BL LCD_DATA_WRITE
	sub r1, r1, #1
	cmp r1,#0
	bge colour_send_loop
	
	
	
	POP {R0-R12, PC}
	








;##########################################################################################################################################













;#####################################################################################################################################################################
SETUP
	;THIS FUNCTION ENABLES PORT A, MARKS IT AS OUTPUT, CONFIGURES SOME GPIO
	;THEN FINALLY IT CALLS LCD_INIT (HINT, USE THIS SETUP FUNCTION DIRECTLY IN THE MAIN)
	PUSH {R0-R12, LR}

	;Make the clock affect port A by enabling the corresponding bit (the third bit) in RCC_AHB1ENR register
	LDR r1, =RCC_APB2ENR
	LDR r0, [r1]
	ORR r0, r0, #0x04
	STR r0, [r1]
	
	
	;Make the GPIO A mode as output (01 for each pin)
	LDR r0, =GPIOA_CRL
	mov r1, #0x11111111
	STR r1, [r0]
	
	LDR R0,=GPIOA_CRH
	MOV R1, #0x11111111
	STR R1,[R0]
	
	
;	;Make the Output type as Push-Pull not Open-drain, by clearing all the bits in the lower 2 bytes of OTYPE register, the higher 2 bytes are reserved.
;	mov r0, #0
;	LDR r1, =GPIOE_BASE
;	ADD r1, r1, #0x04	;go to OTYPER of GPIOE which is at offset 0x04 from base of GPIOE
;	STRH r0, [r1]
;	
;	;Make the Output speed as super fast by clearing all the bits in the OSPEED register
;	;00 means slow
;	;01 means medium
;	;10 means fast
;	;11 means super fast
;	;2 bits for each pin and we will choose slow
;	;this register just scales the time of flipping from low to high or from high to low.
;	mov r0, #0xFFFFFFFF
;	LDR r1, =GPIOE_BASE
;	ADD r1, r1, #0x08	;go to OSPEEDR of GPIOE which is at offset 0x08 from base of GPIOE
;	STR r0, [r1]
;	
;	
;	;Clear the Pullup-pulldown bits for each port, we don't need the internal resistors
;	mov r0, #0
;	LDR r1, =GPIOE_BASE
;	ADD r1, r1, #0x0c	;go to PUPDR of GPIOE which is at offset 0x0C from base of GPIOE
;	STR r0, [r1]


    ;DELETE ANY GARBAGE IN PORT A
	LDR r1, =GPIOA_ODR
	LDR r0, [r1]
	ORR r0, #0x00007F00 ;(DATA =0 & CS =0)
	STRH r0, [r1]
	

	BL LCD_INIT

	POP {R0-R12, PC}
;#####################################################################################################################################################################






; HELPER DELAYS IN THE SYSTEM, YOU CAN USE THEM DIRECTLY


;##########################################################################################################################################
delay_1_second
	;this function just delays for 1 second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop
	SUBS r8, #1
	CMP r8, #0
	BGE delay_loop
	POP {R8, PC}
;##########################################################################################################################################




;##########################################################################################################################################
delay_half_second
	;this function just delays for half a second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop1
	SUBS r8, #2
	CMP r8, #0
	BGE delay_loop1

	POP {R8, PC}
;##########################################################################################################################################


;##########################################################################################################################################
delay_milli_second
	;this function just delays for a millisecond
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop2
	SUBS r8, #1000
	CMP r8, #0
	BGE delay_loop2

	POP {R8, PC}
;##########################################################################################################################################



;##########################################################################################################################################
delay_10_milli_second
	;this function just delays for 10 millisecondS
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop3
	SUBS r8, #100
	CMP r8, #0
	BGE delay_loop3

	POP {R8, PC}
;##########################################################################################################################################


; Set Pin
set_pin ; PIN LOCATION IN R2
	PUSH {R0-R12, LR}
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	MOV R3, #1
	LSL R3, R3, R2
	ORR R1, R3, R1
	STR R1, [R0]
	POP {R0-R12, PC}
	
	
; Set Pin
reset_pin ; PIN LOCATION IN R2
	PUSH {R0-R12, LR}
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	MOV R3, #1
	LSL R3, R3, R2
	MVN R3, R3
	AND R1, R1, R3
	STR R1, [R0]
	POP {R0-R12, PC}



	END