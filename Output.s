
RCC_BASE EQU 0x40021000
GPIOA_BASE EQU 0x40010800
	
GPIOx_CRL EQU 0x00
GPIOx_ODR EQU 0x0C
GPIOx_IDR EQU 0x08
GPIOA_ODR EQU GPIOA_BASE +GPIOx_ODR


RCC_APB2ENR EQU 0x18 + RCC_BASE

GPIOA_CRL EQU GPIOx_CRL + GPIOA_BASE
GPIOA_IDR EQU GPIOA_BASE + GPIOx_IDR
INTERVAL EQU 0X1FF

	AREA OUTPUT_CODE, CODE, READONLY
	

main_Output FUNCTION
	
Op FUNCTION
	PUSH {R0-R12, LR}
	LDR R0 ,=RCC_APB2ENR ;to enable port A
	LDR R1,[R0]
	ORR R1,R1,#0x04
	STR R1,[R0]
	
	LDR R0, =GPIOA_CRL ;to configure first pin of port A as output(medium speed)
	LDR R1,[R0]
	ORR R1,R1,#0x01
	STR R1,[R0]
	
	LDR R0, =GPIOA_ODR ;to write 1 on PA0
	LDR R1,[R0]
	ORR R1,R1,#0x01
	STR R1,[R0]
	POP {R0-R12,PC}
	
	ENDFUNC
	
	ENDFUNC
	END