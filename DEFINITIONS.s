

	AREA MYDATA, DATA, READWRITE

RCC_BASE EQU 0x40021000
PWR_BASE EQU 0x40007000  
GPIOA_BASE EQU 0x40010800
GPIOB_BASE EQU 0x40010C00
GPIOC_BASE EQU 0x40011000
RTC_BASE EQU 0x40002800
ADC1_BASE EQU 0x40012400
	
GPIOx_CRL EQU 0x00
GPIOx_CRH EQU 0x04
GPIOx_ODR EQU 0x0C
GPIOx_IDR EQU 0x08
	
GPIOA_ODR EQU GPIOA_BASE + GPIOx_ODR
GPIOA_CRL EQU GPIOA_BASE + GPIOx_CRL
GPIOA_CRH EQU GPIOA_BASE + GPIOx_CRH
GPIOA_IDR EQU GPIOA_BASE + GPIOx_IDR

GPIOB_ODR EQU GPIOB_BASE + GPIOx_ODR
GPIOB_CRL EQU GPIOB_BASE + GPIOx_CRL
GPIOB_CRH EQU GPIOB_BASE + GPIOx_CRH
GPIOB_IDR EQU GPIOB_BASE + GPIOx_IDR

GPIOC_ODR EQU GPIOC_BASE + GPIOx_ODR
GPIOC_CRL EQU GPIOC_BASE + GPIOx_CRL
GPIOC_CRH EQU GPIOC_BASE + GPIOx_CRH
GPIOC_IDR EQU GPIOC_BASE + GPIOx_IDR

RCC_APB1ENR EQU RCC_BASE + 0x1C
RCC_APB2ENR EQU RCC_BASE + 0x18
RCC_BDCR EQU RCC_BASE + 0x20


ADC1_CR2 EQU ADC1_BASE + 0x08   
ADC1_SMPR2 EQU ADC1_BASE + 0x10 
ADC1_SQR3 EQU ADC1_BASE + 0x34  
ADC1_DR EQU ADC1_BASE + 0x4C    

	
PWR_CR EQU PWR_BASE + 0x00
		
RTC_CRL EQU RTC_BASE + 0x04
RTC_PRLL EQU RTC_BASE + 0x0C
RTC_PRLH EQU RTC_BASE + 0x08
RTC_CNTH EQU RTC_BASE + 0x18
RTC_CNTL EQU RTC_BASE + 0x1C

TIM2_BASE EQU 0x40000000

	
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
