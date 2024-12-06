

	AREA MYDATA, DATA, READWRITE

RCC_BASE EQU 0x40021000
GPIOA_BASE EQU 0x40010800
	
GPIOx_CRL EQU 0x00
GPIOx_ODR EQU 0x0C
GPIOx_IDR EQU 0x08
GPIOx_CRH EQU 0x04
GPIOA_ODR EQU GPIOA_BASE +GPIOx_ODR


RCC_APB2ENR EQU 0x18 + RCC_BASE

GPIOA_CRL EQU GPIOx_CRL + GPIOA_BASE
GPIOA_CRH EQU GPIOx_CRH + GPIOA_BASE
GPIOA_IDR EQU GPIOA_BASE + GPIOx_IDR
	
INTERVAL EQU 0x186004		;just a number to perform the delay. this number takes roughly 1 second to decrement until it reaches 0
	
;just some color codes, 16-bit colors coded in RGB 565
BLACK	EQU   	0x0000
BLUE 	EQU  	0x001F
RED  	EQU  	0xF800
RED2   	EQU 	0x4000
GREEN 	EQU  	0x07E0
CYAN  	EQU  	0x07FF
MAGENTA EQU 	0xF81F
YELLOW	EQU  	0xFFE0
WHITE 	EQU  	0xFFFF
GREEN2 	EQU 	0x2FA4
CYAN2 	EQU  	0x07FF
	
	END
