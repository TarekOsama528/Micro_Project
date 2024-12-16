	INCLUDE DEFINITIONS.s
	;EXPORT RTC_INIT
	;EXPORT ALARM_INIT
	
	AREA MYCODE, CODE, READONLY

RTC_INIT
    PUSH {R0-R12, LR}            ; Save registers on the stack

    ; Enable Power Interface Clock (PWR)
    LDR R0, =RCC_APB1ENR         ; Address of RCC_APB1ENR
    LDR R1, [R0]
    ORR R1, R1, #0x18000000      ; Set PWREN bit (bit 28) AND BKPEN bit (bit 27) to enable PWR clock
    STR R1, [R0]                 ; Write back to RCC_APB1ENR

    ; Enable Access to Backup Domain (DBP)
    LDR R0, =PWR_CR              ; Address of PWR_CR
    LDR R1, [R0]
    ORR R1, R1, #0x100           ; Set DBP bit (bit 8) to enable access to backup domain
    STR R1, [R0]                 ; Write back to PWR_CR

    ; Wait for DBP to take effect
retry_dbp_set
    LDR R1, [R0]
    TST R1, #0x100               ; Check if DBP bit is set
    BEQ retry_dbp_set            ; Retry if DBP is not set

    ; Enable LSE Oscillator
    LDR R0, =RCC_BDCR            ; Address of RCC_BDCR
    LDR R1, [R0]
    ORR R1, R1, #0x01            ; Set LSEON bit (bit 0) to enable LSE oscillator
    STR R1, [R0]                 ; Write back to RCC_BDCR

    ; Wait for LSE to stabilize
wait_lse_ready
    LDR R1, [R0]
    TST R1, #0x02                ; Check LSERDY bit (bit 1)
    BEQ wait_lse_ready           ; Wait until LSE is ready

    ; Select LSE as RTC Clock Source
    LDR R1, [R0]
    BIC R1, R1, #(0x3 << 8)      ; Clear RTCSEL bits (bit 8 and 9)
    ORR R1, R1, #(0x1 << 8)      ; Set RTCSEL to 01 (LSE as clock source)
    STR R1, [R0]                 ; Write back to RCC_BDCR

    ; Enable RTC
    ORR R1, R1, #(1 << 15)       ; Set RTCEN bit (bit 15) to enable RTC
    STR R1, [R0]                 ; Write back to RCC_BDCR

    ; Wait for RTC Registers Synchronization
    LDR R0, =RTC_CRL             ; RTC control register
wait_rsf
    LDR R1, [R0]
    TST R1, #0x20                ; Check RSF bit (bit 5) user must wait until it's set to be sure that the RTC_CNT, RTC_ALR or RTC_PRL registers are synchronized.
    BEQ wait_rsf                 ; Wait until RSF is set

    ; Enter RTC Configuration Mode
    ORR R1, R1, #0x10            ; Set CNF bit (bit 4) to enter configuration mode
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Set RTC Prescaler to 32767 (for 1 Hz clock with 32.768 kHz LSE)
    LDR R0, =RTC_BASE            ; Base address of RTC
    LDR R1, =0x0000              ; High part of prescaler (RTC_PRLH = 0)
    STR R1, [R0, #0x08]          ; Write to RTC_PRLH
    LDR R1, =0x7FFF              ; Low part of prescaler (RTC_PRLL = 32767)
    STR R1, [R0, #0x0C]          ; Write to RTC_PRLL

    ; Exit RTC Configuration Mode
    LDR R0, =RTC_CRL             ; RTC control register
    LDR R1, [R0]
    BIC R1, R1, #0x10            ; Clear CNF bit (bit 4)
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Wait for Configuration to Complete
wait_rtoff
    LDR R1, [R0]
    TST R1, #0x20                ; Check RTOFF bit (bit 5)
    BEQ wait_rtoff               ; Wait until RTOFF is set

    POP {R0-R12, PC}             ; Restore registers and return
	
;**********************************************************
	
ALARM_INIT
	PUSH {R0-R12, LR}
	
	LDR R0 ,=RCC_APB2ENR ;to enable port B
	LDR R1,[R0]
	ORR R1,R1,#0x08
	STR R1,[R0]
	
	LDR R0, =GPIOB_CRL ;to configure PB3 as output(medium speed)
	LDR R1,[R0]
	bic r1,r1,#0xF000
	ORR R1,R1,#0x1000
	STR R1,[R0]

    ; Step 1: Enable RTC Clock Source and Synchronization
    ; Assume the RTC clock (LSE) is already configured and RTC prescaler is set for 1 Hz

    ; Step 2: Enter RTC Configuration Mode
    LDR R0, =RTC_CRL             ; Address of RTC_CRL
wait_rsf1
    LDR R1, [R0]                 ; Read RTC_CRL
    TST R1, #0x20                ; Check RSF bit (bit 5)
    BEQ wait_rsf1            ; Wait for synchronization (RSF set)

    ORR R1, R1, #0x10            ; Set CNF bit (bit 4) to enter configuration mode
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Step 3: Set Alarm Value
    LDR R0, =RTC_ALRH            ; Base address of RTC registers
	LDR R1, [R0]
    LDR R1, =0x0000              ; High part of the alarm
    STR R1, [R0]          ; Write to RTC_ALRH (Alarm High Register)
	
	LDR R0, =RTC_ALRL
	LDR R1,[R0]
    LDR R1, =0x000A              ; Low part of the alarm (e.g., 10 seconds)
    STR R1, [R0]          ; Write to RTC_ALRL (Alarm Low Register)

    ; Step 4: Enable Alarm Interrupt in RTC
    LDR R0, =RTC_CRH             ; Address of RTC_CRH
    LDR R1, [R0]
    ORR R1, R1, #0x02            ; Set ALRIE bit (bit 1) to enable alarm interrupt
    STR R1, [R0]                 ; Write back to RTC_CRH

    ; Step 5: Exit RTC Configuration Mode
    LDR R0, =RTC_CRL             ; Address of RTC_CRL
    LDR R1, [R0]
    BIC R1, R1, #0x10            ; Clear CNF bit (bit 4)
    STR R1, [R0]                 ; Write back to RTC_CRL

    ; Step 6: Wait for Configuration Completion
wait_rtoff1
    LDR R1, [R0]                 ; Read RTC_CRL
    TST R1, #0x20                ; Check RTOFF bit (bit 5)
    BEQ wait_rtoff1              ; Wait until RTOFF is set

    ; Step 7: Enable Alarm Interrupt in NVIC
    LDR R0, =0xE000E104         ; NVIC_BASE address + ISER1 offset
    LDR R1, =(1 << 9)           ; RTC Alarm IRQ number is 17 (bit position)
    STR R1, [R0]                 ; Enable RTC Alarm interrupt

    POP {R0-R12, PC}             ; Restore registers and return

	END
		
		
		
		
		