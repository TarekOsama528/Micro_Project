	INCLUDE DEFINITIONS.s
	
	AREA MYCODE, CODE, READONLY
		
RTC_INIT
	PUSH {R0-R12, LR}
	
    ; Enable Power Interface Clock (PWR)
    LDR R0, =RCC_APB1ENR      ; Read RCC_APB1ENR
    LDR R1, [R0]
    ORR R1, R1, #0x10000000   ; Set PWR bit (bit 28) page 115
    STR R1, [R0]       ; Write back to RCC_APB1ENR

    ; Enable Access to Backup Domain (DBP)
    LDR R0, =PWR_CR     ; Read PWR_CR
    LDR R1, [R0]       
    ORR R1, R1, #0x100        ; Set DBP bit (bit 8) page 77/78
    STR R1, [R0]       ; Write back to PWR_CR

    ; Enable LSE Oscillator
    LDR R0, =RCC_BDCR     ; Read RCC_BDCR
    LDR R1, [R0]       
    ORR R1, R1, #0x01         ; Set LSEON bit (bit 0) page 118/119
    STR R1, [R0]       ; Write back to RCC_BDCR

wait_lse_ready
    LDR R1, [R0]       ; Read RCC_BDCR
    TST R1, #0x02             ; Check LSERDY bit (bit 1) page 118/119
    BEQ wait_lse_ready       ; Wait until LSE is ready

    ; Select LSE as RTC Clock Source and Enable RTC
    LDR R1, [R0]       ; Read RCC_BDCR
    ORR R1, R1, #(1 << 8)     ; Set RTCSEL to 01 (LSE as clock source) page 118/119
    ORR R1, R1, #(1 << 15)    ; Set RTCEN bit (bit 15) page 118/119
    STR R1, [R0]       ; Write back to RCC_BDCR

    ; Wait for RTC Synchronization
    LDR R0, =RTC_CRL       ; Read RTC_CRL
    LDR R1, [R0]       
    TST R1, #0x20             ; Check RTOFF bit (bit 5) page 488
    BEQ wait_sync            ; Wait until RTC is synchronized

    ; Enter RTC Configuration Mode
    ORR R1, R1, #0x10         ; Set CNF bit (bit 4) page 488
    STR R1, [R0]       ; Write back to RTC_CRL
	
	LDR R0,=RTC_BASE
    ; Set RTC Prescaler to 32767 (LSE / (32767 + 1) = 1 Hz)
    LDR R1, =0x0000           ; High part of prescaler (RTC_PRLH = 0)
    STR R1, [R0, #0x08]       ; Write to RTC_PRLH
    LDR R1, =0x7FFF           ; Low part of prescaler (RTC_PRLL = 32767) page 489/490
    STR R1, [R0, #0x0C]       ; Write to RTC_PRLL

    ; Exit RTC Configuration Mode
	LDR R0,=RTC_CRL
    LDR R1, [R0]       ; Read RTC_CRL
    BIC R1, R1, #0x10         ; Clear CNF bit (bit 4) page 488
    STR R1, [R0]       ; Write back to RTC_CRL

wait_sync
    LDR R1, [R0]       ; Read RTC_CRL
    TST R1, #0x20             ; Check RTOFF bit (bit 5) page 488
    BEQ wait_sync            ; Wait until RTOFF is set
		
	POP {R0-R12, PC}
	END
		
		
		
		
		