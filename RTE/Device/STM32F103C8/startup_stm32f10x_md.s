;******************** (C) COPYRIGHT 2011 STMicroelectronics ********************
;* File Name          : startup_stm32f10x_md.s
;* Author             : MCD Application Team
;* Version            : V3.5.1
;* Date               : 08-September-2021
;* Description        : STM32F10x Medium Density Devices vector table for MDK-ARM 
;*                      toolchain.  
;*                      This module performs:
;*                      - Set the initial SP
;*                      - Set the initial PC == Reset_Handler
;*                      - Set the vector table entries with the exceptions ISR address
;*                      - Configure the clock system
;*                      - Branches to __main in the C library (which eventually
;*                        calls main()).
;*                      After Reset the CortexM3 processor is in Thread mode,
;*                      priority is Privileged, and the Stack is set to Main.
;* <<< Use Configuration Wizard in Context Menu >>>   
;*******************************************************************************
;*
;* Copyright (c) 2011 STMicroelectronics.
;* All rights reserved.
;*
;* This software is licensed under terms that can be found in the LICENSE file
;* in the root directory of this software component.
;* If no LICENSE file comes with this software, it is provided AS-IS.
;
;*******************************************************************************

; Amount of memory (in bytes) allocated for Stack
; Tailor this value to your application needs
; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000200

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit

                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size
					
	EXTERN EXTI4_IRQHandler
__Vectors       DCD     __initial_sp               ; Top of Stack
                DCD     Reset_Handler              ; Reset Handler
                DCD     NMI_Handler                ; NMI Handler
                DCD     HardFault_Handler          ; Hard Fault Handler
                DCD     MemManage_Handler          ; MPU Fault Handler
                DCD     BusFault_Handler           ; Bus Fault Handler
                DCD     UsageFault_Handler         ; Usage Fault Handler
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     0                          ; Reserved
                DCD     SVC_Handler                ; SVCall Handler
                DCD     DebugMon_Handler           ; Debug Monitor Handler
                DCD     0                          ; Reserved
                DCD     PendSV_Handler             ; PendSV Handler
                DCD     SysTick_Handler            ; SysTick Handler

                ; External Interrupts
                DCD     WWDG_IRQHandler            ; Window Watchdog
                DCD     PVD_IRQHandler             ; PVD through EXTI Line detect
                DCD     TAMPER_IRQHandler          ; Tamper
                DCD     RTC_IRQHandler             ; RTC
                DCD     FLASH_IRQHandler           ; Flash
                DCD     RCC_IRQHandler             ; RCC
                DCD     EXTI0_IRQHandler           ; EXTI Line 0
                DCD     EXTI1_IRQHandler           ; EXTI Line 1
                DCD     EXTI2_IRQHandler           ; EXTI Line 2
                DCD     EXTI3_IRQHandler           ; EXTI Line 3
                DCD     EXTI4_IRQHandler           ; EXTI Line 4
                DCD     DMA1_Channel1_IRQHandler   ; DMA1 Channel 1
                DCD     DMA1_Channel2_IRQHandler   ; DMA1 Channel 2
                DCD     DMA1_Channel3_IRQHandler   ; DMA1 Channel 3
                DCD     DMA1_Channel4_IRQHandler   ; DMA1 Channel 4
                DCD     DMA1_Channel5_IRQHandler   ; DMA1 Channel 5
                DCD     DMA1_Channel6_IRQHandler   ; DMA1 Channel 6
                DCD     DMA1_Channel7_IRQHandler   ; DMA1 Channel 7
                DCD     ADC1_2_IRQHandler          ; ADC1_2
                DCD     USB_HP_CAN1_TX_IRQHandler  ; USB High Priority or CAN1 TX
                DCD     USB_LP_CAN1_RX0_IRQHandler ; USB Low  Priority or CAN1 RX0
                DCD     CAN1_RX1_IRQHandler        ; CAN1 RX1
                DCD     CAN1_SCE_IRQHandler        ; CAN1 SCE
                DCD     EXTI9_5_IRQHandler         ; EXTI Line 9..5
                DCD     TIM1_BRK_IRQHandler        ; TIM1 Break
                DCD     TIM1_UP_IRQHandler         ; TIM1 Update
                DCD     TIM1_TRG_COM_IRQHandler    ; TIM1 Trigger and Commutation
                DCD     TIM1_CC_IRQHandler         ; TIM1 Capture Compare
                DCD     TIM2_IRQHandler            ; TIM2
                DCD     TIM3_IRQHandler            ; TIM3
                DCD     TIM4_IRQHandler            ; TIM4
                DCD     I2C1_EV_IRQHandler         ; I2C1 Event
                DCD     I2C1_ER_IRQHandler         ; I2C1 Error
                DCD     I2C2_EV_IRQHandler         ; I2C2 Event
                DCD     I2C2_ER_IRQHandler         ; I2C2 Error
                DCD     SPI1_IRQHandler            ; SPI1
                DCD     SPI2_IRQHandler            ; SPI2
                DCD     USART1_IRQHandler          ; USART1
                DCD     USART2_IRQHandler          ; USART2
                DCD     USART3_IRQHandler          ; USART3
                DCD     EXTI15_10_IRQHandler       ; EXTI Line 15..10
                DCD     RTCAlarm_IRQHandler        ; RTC Alarm through EXTI Line
                DCD     USBWakeUp_IRQHandler       ; USB Wakeup from suspend
__Vectors_End

__Vectors_Size  EQU  __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler    PROC
                 EXPORT  Reset_Handler             [WEAK]
     IMPORT  __main
     IMPORT  SystemInit
                 LDR     R0, =SystemInit
                 BLX     R0
                 LDR     R0, =__main
                 BX      R0
                 ENDP

; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler                [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler          [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler          [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler           [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler         [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler           [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler             [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler            [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WWDG_IRQHandler            [WEAK] ;0
                EXPORT  PVD_IRQHandler             [WEAK] ;1
                EXPORT  TAMPER_IRQHandler          [WEAK] ;2
                EXPORT  RTC_IRQHandler             [WEAK] ;3
                EXPORT  FLASH_IRQHandler           [WEAK] ;4
                EXPORT  RCC_IRQHandler             [WEAK] ;5
                EXPORT  EXTI0_IRQHandler           [WEAK] ;6
                EXPORT  EXTI1_IRQHandler           [WEAK] ;7
                EXPORT  EXTI2_IRQHandler           [WEAK] ;8
                EXPORT  EXTI3_IRQHandler           [WEAK] ;9
                ;EXPORT  EXTI4_IRQHandler           [WEAK] ;10
                EXPORT  DMA1_Channel1_IRQHandler   [WEAK] ;11
                EXPORT  DMA1_Channel2_IRQHandler   [WEAK] ;12
                EXPORT  DMA1_Channel3_IRQHandler   [WEAK] ;13
                EXPORT  DMA1_Channel4_IRQHandler   [WEAK] ;14
                EXPORT  DMA1_Channel5_IRQHandler   [WEAK] ;15
                EXPORT  DMA1_Channel6_IRQHandler   [WEAK] ;16
                EXPORT  DMA1_Channel7_IRQHandler   [WEAK] ;17
                EXPORT  ADC1_2_IRQHandler          [WEAK] ;18
                EXPORT  USB_HP_CAN1_TX_IRQHandler  [WEAK] ;19
                EXPORT  USB_LP_CAN1_RX0_IRQHandler [WEAK] ;20
                EXPORT  CAN1_RX1_IRQHandler        [WEAK] ;21
                EXPORT  CAN1_SCE_IRQHandler        [WEAK] ;22
                EXPORT  EXTI9_5_IRQHandler         [WEAK] ;23
                EXPORT  TIM1_BRK_IRQHandler        [WEAK] ;24
                EXPORT  TIM1_UP_IRQHandler         [WEAK] ;25
                EXPORT  TIM1_TRG_COM_IRQHandler    [WEAK] ;26
                EXPORT  TIM1_CC_IRQHandler         [WEAK] ;27
                EXPORT  TIM2_IRQHandler            [WEAK] ;28
                EXPORT  TIM3_IRQHandler            [WEAK] ;29
                EXPORT  TIM4_IRQHandler            [WEAK] ;30
                EXPORT  I2C1_EV_IRQHandler         [WEAK] ;31
                EXPORT  I2C1_ER_IRQHandler         [WEAK] ;32 ;0
                EXPORT  I2C2_EV_IRQHandler         [WEAK] ;33 ;1
                EXPORT  I2C2_ER_IRQHandler         [WEAK] ;34 ;2
                EXPORT  SPI1_IRQHandler            [WEAK] ;35 ;3
                EXPORT  SPI2_IRQHandler            [WEAK] ;36 ;4
                EXPORT  USART1_IRQHandler          [WEAK] ;37 ;5
                EXPORT  USART2_IRQHandler          [WEAK] ;38 ;6
                EXPORT  USART3_IRQHandler          [WEAK] ;39 ;7
                EXPORT  EXTI15_10_IRQHandler       [WEAK] ;40 ;8
                EXPORT  RTCAlarm_IRQHandler        [WEAK] ;41 ;9
                EXPORT  USBWakeUp_IRQHandler       [WEAK] ;42 ;10

WWDG_IRQHandler
PVD_IRQHandler
TAMPER_IRQHandler
RTC_IRQHandler
FLASH_IRQHandler
RCC_IRQHandler
EXTI0_IRQHandler
	PUSH {R0-R3, LR}            ; Save registers
    LDR R0, =0x40010414            ; EXTI_PR address
    LDR R1, [R0]
    ORR R1, R1, #(1 << 0)       ; Clear EXTI0 pending flag
    STR R1, [R0]                ; Write back

    ; Toggle PA1
    LDR R0, =0x4001080C          ; GPIOA_ODR address
    LDR R1, [R0]
    EOR R1, R1, #(1 << 1)       ; Toggle PA1
    STR R1, [R0]                ; Write back
    POP {R0-R3, PC}             ; Restore registers and return
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
;EXTI4_IRQHandler
;    PUSH {R0-R3, LR}              ; Save registers and return address

;;==================================================================================
;; Check if the interrupt is caused by PB4 (EXTI4)
;               ; If not, exit handler

;; Clear the interrupt flag for PB4 (EXTI4)
;    LDR R0, =0x40010414              ; EXTI_PR address
;    MOV R1, #(1 << 4)             ; Prepare mask for EXTI4
;    STR R1, [R0]                  ; Clear EXTI4 interrupt flag by writing 1

;; Handle PB4 (Sensor logic or other tasks)
;    ; Custom logic for PB0 (sensor logic or toggling output pin, etc.)
;    LDR R0, =0x40010C0C            ; GPIOB_ODR address (Output Data Register)
;    LDR R1, [R0]                  ; Read current GPIOB_ODR value
;    EOR R1, R1, #(1 << 0)         ; Toggle PB0 (just as an example)
;    STR R1, [R0]                  ; Write back to GPIOB_ODR

;;==================================================================================sx         
;    POP {R0-R3, PC}
DMA1_Channel1_IRQHandler
DMA1_Channel2_IRQHandler
DMA1_Channel3_IRQHandler
DMA1_Channel4_IRQHandler
DMA1_Channel5_IRQHandler
DMA1_Channel6_IRQHandler
DMA1_Channel7_IRQHandler
ADC1_2_IRQHandler
USB_HP_CAN1_TX_IRQHandler
USB_LP_CAN1_RX0_IRQHandler
CAN1_RX1_IRQHandler
CAN1_SCE_IRQHandler
EXTI9_5_IRQHandler
TIM1_BRK_IRQHandler
TIM1_UP_IRQHandler
TIM1_TRG_COM_IRQHandler
TIM1_CC_IRQHandler
TIM2_IRQHandler
;    PUSH {R0-R3, LR}            ; Save working registers

;    ; Clear the Update Interrupt Flag
;    LDR R0, =0x40000000
;    LDR R1, [R0, #0x10]         ; Read TIM2_SR
;    BIC R1, R1, #0x01           ; Clear UIF (Update Interrupt Flag, bit 0)
;    STR R1, [R0, #0x10]

;    ; Toggle LED on PB0
;    LDR R0, =(0x40010C0C)          ; GPIOB Output Data Register
;    LDR R1, [R0]                ; Read current state
;    EOR R1, R1, #0x01           ; Toggle PB0 (bit 0)
;    STR R1, [R0]                ; Write back to GPIOB_ODR
;	
;	POP {R0-R3, PC}
TIM3_IRQHandler
    PUSH {R0-R3, LR}            ; Save working registers
	
	    ; Clear the Update Interrupt Flag
    LDR R0, =0x40000400
    LDR R1, [R0, #0x10]         ; Read TIM2_SR
    BIC R1, R1, #0x01           ; Clear UIF (Update Interrupt Flag, bit 0)
    STR R1, [R0, #0x10]
	

	
	LDR R0,=0x20000020
	LDR R1,[R0]
	SUB R1,R1,#1
	STR R1,[R0]
	CMP R1,#0
	BNE END_HANDLER

    ;TURN ON on PB0 (BUZZER)
    LDR R0, =(0x40010C0C)          ; GPIOB Output Data Register
    LDR R1, [R0]                ; Read current state
    ORR R1, R1, #0x01           ; TURN ON PB0 (bit 0)
    STR R1, [R0]                ; Write back to GPIOB_ODR
	
	    ; Enable TIM4 Clock in RCC_APB1ENR
;    LDR R0, =0x4002101C          ; RCC_APB1ENR address
;    LDR R1, [R0]                  ; Read current value
;    BIC R1, R1, #0x04             ; Set bit 0 to enable TIM4 clock
;    STR R1, [R0] 
	
	; Start the Timer
    LDR R0, =0x40000400            ; Base address of TIM3
	LDR R1, [R0]           ; Read TIM3_CR1 (Control Register 1)
	BIC R1, R1, #0x01             ; Set CEN bit (bit 0) to start the timer
	STR R1, [R0]           ; Write back to TIM3_CR1
	
	
END_HANDLER
	POP {R0-R3, PC}
TIM4_IRQHandler
    PUSH {R0-R3, LR}            ; Save working registers

    ; Clear the Update Interrupt Flag
    LDR R0, =0x40000800
    LDR R1, [R0, #0x10]         ; Read TIM4_SR
    BIC R1, R1, #0x01           ; Clear UIF (Update Interrupt Flag, bit 0)
    STR R1, [R0, #0x10]
	
	LDR R0,=0x20000000 ;REAL_TIME Variable
	LDR R1,[R0]
	ADD R1,R1,#1
	
	LDR R2, =86400    ; Load 86400 into register R2
	CMP R1, R2        ; Compare R1 with the value in R2
	MOVEQ R1,#0
	STR R1,[R0]
	
	LDR R0,=0X20000024
	LDR R1,[R0]
	CMP R1,#3
	BNE END_HANDLER2
	LDR R0,=0x20000036
	LDR R1,[R0]
	CMP R1,#1
	BNE END_HANDLER2
	LDR R0,=0x20000032
	LDR R1,[R0]
	ADD R1,R1,#1
	STR R1,[R0]
	
END_HANDLER2
	POP {R0-R3, PC}
I2C1_EV_IRQHandler
I2C1_ER_IRQHandler
I2C2_EV_IRQHandler
I2C2_ER_IRQHandler
SPI1_IRQHandler
SPI2_IRQHandler
USART1_IRQHandler
USART2_IRQHandler
USART3_IRQHandler
EXTI15_10_IRQHandler

    PUSH {R0, R12, LR}

    ; Clear the EXTI13 pending flag
    LDR R0, =0x40010414       ; EXTI Pending Register address
    MOV R1, #(1 << 13)        ; Prepare mask for EXTI13
    STR R1, [R0]              ; Clear the EXTI13 pending flag

    ; Turn OFF PB0 (BUZZER)
    LDR R3, =0x40010C0C       ; GPIOB Output Data Register address
    LDR R4, [R3]              ; Read current output state
    BIC R4, R4, #(1 << 0)    ; Toggle PB12
    STR R4, [R3]              ; Write back to GPIOB_ODR

    POP {R0, R12, PC}
    ;BX LR                     ; Return from interrupt

;END_HANDLER
	;BX LR                    ; Return from interrupt

	;POP {R0-R12, PC}
RTCAlarm_IRQHandler
;	PUSH {R0-R12, LR}
;	

;	LDR R0, =0x40002804           ; Address of RTC_CRL
;    LDR R1, [R0]
;    BIC R1, R1, #0x02            ; Clear ALRF bit (bit 1)
;    STR R1, [R0]                 ; Write back to RTC_CRL
;	
;	LDR R0, =0x40010C0C ;to write 1 on PB0
;	LDR R1,[R0]
;	ORR R1,R1,#0x01
;	STR R1,[R0]
;	
;	
;	POP {R0-R12, PC}
USBWakeUp_IRQHandler

                B       .

                ENDP

                ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                 IF      :DEF:__MICROLIB           
                
                 EXPORT  __initial_sp
                 EXPORT  __heap_base
                 EXPORT  __heap_limit
                
                 ELSE
                
                 IMPORT  __use_two_region_memory
                 EXPORT  __user_initial_stackheap
                 
__user_initial_stackheap

                 LDR     R0, =  Heap_Mem
                 LDR     R1, =(Stack_Mem + Stack_Size)
                 LDR     R2, = (Heap_Mem +  Heap_Size)
                 LDR     R3, = Stack_Mem
                 BX      LR

                 ALIGN

                 ENDIF

                 END

