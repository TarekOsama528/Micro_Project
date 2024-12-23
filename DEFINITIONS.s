

	AREA MYDATA, DATA, READONLY

; here we store out variables used across the code as registers could get messed up
; all are 4 BYTES
REAL_TIME EQU 0x20000000 ; this variable stores the real time in seconds 4BYTES
PREV_HOURS EQU 0X20000004 ;PREVIOUS HOURS 
PREV_MINS EQU 0x20000008	;PREVIOUS MINIUTES
PREV_SECS EQU 0x20000012 ; PREVIOUS SECONDS
WEEK_DAY EQU  0x20000016 ; TRACKS THE WEEK DAY 0-SAT 6-FRI
TIMER_COUNTDOWN EQU 0x20000020 ; THE CURRENT VALUE OF THE TIMER (REAL TIMER MODE)
MODE_SELECT EQU 0X20000024 ; Stores the current mode according to the value 0:CLOCK 1:ALARM 2:TIMER 3:STOPWATCH
;FIELD_SELECT EQU 0x20000028 ;Store whether we are incrementing 0:seconds, 1:minutes, 2:hours
STOPWATCH_TIME EQU 0x20000032 ;store the value of stopwatch
CONFIG_MODE EQU 0x20000036 ;   0: configuration mode & seconds 1:minutes 2:hours 3:days 4: running mode
ALARM_VALUE EQU 0x20000040        ;store the value of alarm
CURRENT_TEMP EQU 0x20000044       ;stores the current value of the temprature
CURRENT_HUM  EQU 0x20000048
PREV_MODE EQU 0x20000052
MODE_Changed EQU 0x20000056      ;0:No change 1:Mode Changed
STOPWATCH_ON EQU 0x20000060
CLOCK_CONFIGURED EQU 0x20000064   ;0: NOT CONFIGURED
ALARM_CONFIGURED EQU 0x20000068
TIMER_CONFIGURED EQU 0x20000072
DID_INCREMENT EQU 0x20000076
SECONDS_MINS_LAST  EQU 0x20000080
MINS_HOURS_LAST EQU 0x20000084
INVERTED_CHECK EQU 0x20000088
DAY_NIGHT EQU 0x20000092

	
; End of declared variables

RCC_BASE EQU 0x40021000
PWR_BASE EQU 0x40007000  
GPIOA_BASE EQU 0x40010800
GPIOB_BASE EQU 0x40010C00
GPIOC_BASE EQU 0x40011000
RTC_BASE EQU 0x40002800
ADC1_BASE EQU 0x40012400
NVIC_BASE EQU 0xE000E100
TIM2_BASE EQU 0x40000000
TIM3_BASE EQU 0x40000400
TIM4_BASE EQU 0x40000800
EXTI_BASE EQU 0x40010400
AFIO_BASE EQU 0x40010000
	
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
	
RTC_CRH EQU RTC_BASE + 0x00
RTC_CRL EQU RTC_BASE + 0x04
RTC_PRLL EQU RTC_BASE + 0x0C
RTC_PRLH EQU RTC_BASE + 0x08
RTC_CNTH EQU RTC_BASE + 0x18
RTC_CNTL EQU RTC_BASE + 0x1C
RTC_ALRH EQU RTC_BASE + 0x20
RTC_ALRL EQU RTC_BASE + 0x24
	
EXTI_IMR EQU EXTI_BASE + 0x00
EXTI_EMR EQU EXTI_BASE + 0x04
EXTI_RTSR EQU EXTI_BASE + 0x08
EXTI_FTSR EQU EXTI_BASE + 0x0C
EXTI_PR EQU EXTI_BASE + 0x14
	
AFIO_EXTICR1 EQU AFIO_BASE + 0x08
AFIO_EXTICR2 EQU AFIO_BASE + 0x0C
AFIO_EXTICR3 EQU AFIO_BASE + 0x10
AFIO_EXTICR4 EQU AFIO_BASE + 0x14
	
NVIC_ISER0 EQU NVIC_BASE + 0x000
NVIC_ISER1 EQU NVIC_BASE + 0x004
NVIC_ICPR0 EQU NVIC_BASE + 0x180
NVIC_ICPR1 EQU NVIC_BASE + 0x184
	
TIM3_CR1 EQU TIM3_BASE + 0x00
TIM3_ARR EQU TIM3_BASE + 0x2C
TIM3_PSC EQU TIM3_BASE + 0x28
TIM3_DIER EQU TIM3_BASE + 0x0C
	
TIM4_CR1 EQU TIM4_BASE + 0x00
TIM4_ARR EQU TIM4_BASE + 0x2C
TIM4_PSC EQU TIM4_BASE + 0x28
TIM4_DIER EQU TIM4_BASE + 0x0C
	
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
	
First_pos_x EQU 25
Second_pos_x EQU 115
Third_pos_x EQU 225
Fourth_pos_x EQU 315
Fifth_pos_x EQU 415
Sixth_pos_x EQU 445


Starting_pos_y EQU 94
Starting_pos_y_seconds EQU 164
Starting_pos_y_dot_seconds EQU 190

;A_CHARDW DCD 0x7F7FF078, 0x3C1FFFFF, 0x83C1E0F0, 0x78300000
A_CHAR DCW 0xF078, 0x7F7F, 0xFFFF, 0x3C1F, 0xE0F0, 0x83C1, 0x0000, 0x7830
B_CHAR DCW 0xF078, 0xFF7F, 0xFBFD, 0x3C1F, 0xE0FF, 0x83C1, 0x0000, 0xFFE0
C_CHAR DCW 0xF078, 0x7F7F, 0x301, 0xC06, 0x60FF, 0x80C0, 0x0000, 0xEFE0
D_CHAR DCW 0xF0F8, 0xFF7F, 0xF07, 0x3C1E, 0xE1FF, 0x83C1, 0x0000, 0xFFE0
E_CHAR DCW 0xF018, 0xFFFF, 0xF3F9, 0xC07, 0x603F, 0x80C0, 0x0000, 0xFFF0
F_CHAR DCW 0xF018, 0xFFFF, 0xF3F9, 0xC07, 0x6030, 0x80C0, 0x0000, 0x1800
G_CHAR DCW 0xF018, 0x7FFF, 0x7B3F, 0xC06, 0xE0FF, 0x9BC1, 0x0000, 0xEFE0
H_CHAR DCW 0xF078, 0xC1E0, 0xFFFF, 0x3C1F, 0xE0F0, 0x83C1, 0x0000, 0x7830
I_CHAR DCW 0x301, 0x1E06, 0x6030, 0x80C0, 0x603, 0x180C, 0x0000, 0x3C0
J_CHAR DCW 0x180, 0xF03, 0x3018, 0xC060, 0x633F, 0xC06, 0x0000, 0x8F80
K_CHAR DCW 0xB39B, 0xC3E3, 0x83E1, 0x8F87, 0x63B0, 0xB8CE, 0x0000, 0xF830
L_CHAR DCW 0x3018, 0xC060, 0x301, 0xC06, 0x607F, 0x80C0, 0x0000, 0xFFF0
M_CHAR DCW 0xF07C, 0xC1E0, 0xFF77, 0x7F7F, 0xE0F0, 0x93C1, 0x0000, 0x7830
N_CHAR DCW 0xFC7F, 0xC1F0, 0x7F1F, 0x3DDE, 0xE0F0, 0x87C1, 0x0000, 0x7830
P_CHAR DCW 0xF078, 0xFF7F, 0xFFFD, 0x3C1F, 0x6030, 0x80C0, 0x0000, 0x1800
Q_CHAR DCW 0xF078, 0x7F7F, 0xF07, 0x3C1E, 0xE3BF, 0x83C3, 0x0000, 0xEFB0
R_CHAR DCW 0xF078, 0xFF7F, 0xFFFD, 0x3C1F, 0x6731, 0xF0DC, 0x0000, 0xD870
S_CHAR DCW 0xF018, 0x7FFF, 0xF9FE, 0xC07, 0x80FF, 0x301, 0x0000, 0xFFE0
T_CHAR DCW 0xD321, 0x7FBF, 0x6030, 0x80C0, 0x603, 0x180C, 0x0000, 0x180
U_CHAR DCW 0xF078, 0xC1E0, 0xF07, 0x3C1E, 0xE0FF, 0x83C1, 0x0000, 0xEFE0
V_CHAR DCW 0xF078, 0xC1E0, 0xF07, 0x3C1E, 0xBF8F, 0x83E3, 0x0000, 0x8380
W_CHAR DCW 0xF078, 0xC1E0, 0xEFFF, 0x3C9E, 0xE0F0, 0xEFE3, 0x0000, 0x7830
X_CHAR DCW 0xDDC7, 0xC1F1, 0xE070, 0xC1C0, 0x71F0, 0x7C77, 0x0000, 0x7010
Y_CHAR DCW 0xCCC3, 0x61B0, 0x6030, 0xC1E0, 0x603, 0x180C, 0x0000, 0x180
Z_CHAR DCW 0xC060, 0xFFFF, 0x7070, 0x7070, 0x703F, 0x7070, 0x0000, 0xFFF0
;NO_CHAR DCW 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
BLANK  DCW 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
;blank DCD 0x0, 0x0, 0x0, 0x0

EIGHT_DIGIT DCW 0xF078, 0x7F7F, 0xF9FD, 0x3C1B, 0xE0FF, 0x83C1, 0x0000, 0xEFE0
FIVE_DIGIT 	DCW 0xF018, 0xFFFF, 0xF9FE, 0xC07, 0x80FF, 0x301, 0x0000, 0xFFE0
FOUR_DIGIT 	DCW 0xB0D8, 0xC361, 0xFDFE, 0x6C37, 0x180, 0x603, 0x0000, 0xC060
NINE_DIGIT 	DCW 0xF078, 0x7F7F, 0xFDFE, 0x3C1F, 0x80FF, 0x301, 0x0000, 0xFFE0
ONE_DIGIT 	DCW 0x603, 0x381C, 0xC060, 0x180, 0xC0F, 0x3018, 0x0000, 0x780
SEVEN_DIGIT DCW 0xC060, 0x7FBF, 0x3018, 0x6030, 0x603, 0xC0C, 0x0000, 0x180
SIX_DIGIT 	DCW 0xF018, 0x7FFF, 0xFFFF, 0xC07, 0xE0FF, 0x83C1, 0x0000, 0xEFE0
THREE_DIGIT DCW 0xC060, 0xFF7F, 0xF8FC, 0x3019, 0x80FF, 0x301, 0x0000, 0xFFE0
TWO_DIGIT 	DCW 0xC060, 0xFF7F, 0xFFFF, 0x301B, 0x603F, 0x80C0, 0x0000, 0xFFF0
ZERO_DIGIT DCW 0xF078, 0x7F7F, 0xF07, 0x3C1E, 0xE0FF, 0x83C1, 0x0000, 0xEFE0

DOT DCD 0x783F1, 0xFE7F9FE7, 0xF8FC1E00, 0x0

CLOCK_ICON DCD 0x7, 0x3807C0, 0x3E07C00F, 0x87C7E3E3, 0x8FFC718F, 0xFF188FFF, 0xC40FFFF0, 0x7F3F807, 0xF9FE03FC, 0xFF03FE7F, 0xC1FF3FE0, 0xFF8FF03F, 0xE3F01FF9, 0xF807FFFC, 0x1FFFC00, 0xFFFE00FF, 0xFF80EFFE, 0xE073FE70, 0x0, 0x0

Celsius DCD 0x1E0C01, 0xF0CC4807, 0xC6192000, 0x10249E1C, 0x408CC071, 0x2020004, 0x8081F13, 0x20307C4C, 0x80780132, 0x1C4C8, 0x71320, 0x4C80, 0x1F13200, 0x7C4C800, 0x132000, 0x1C4C8000, 0x71320000, 0x4C8001F, 0x1320007C, 0xCCC00006, 0x31800031, 0xE30000CC, 0xCC000333, 0x30000CCC, 0xC00019E6, 0x3030, 0x7380, 0x7800, 0x0

percentage DCD 0xE00000F, 0xE03807FC, 0x1E01EF07, 0x80F1E3C0, 0x3C78E00F, 0x1E7803C7, 0xBC007BCF, 0x1C1FF79F, 0xC3F9CFF8, 0x38F3DE00, 0x39E3C01E, 0x78F00F1E, 0x3C03C78F, 0x1E0F780, 0x703FE01C, 0x7F00000, 0x70000000

celsius_25 DCD 0x78403C, 0x66500021, 0x29C71089, 0x83884080, 0x42041E2, 0xD0300168, 0xE38B400, 0x1C5A0000, 0x2D000F16, 0x80000B40, 0x1C5A000, 0xE2D00001, 0x680079B6, 0x11880, 0x9E4000, 0x49200024, 0x900013C8, 0x40800, 0x39C0000, 0x78000000


GEAR DCD 0x0, 0x3C00003C, 0xC7E30, 0x1FFFF81F, 0xFFF80FE7, 0xF00F81F0, 0xF00F01E, 0x787E00, 0x7E7C003E, 0x7C003E7E, 0x7E1E00, 0x780F00F0, 0xF81F00F, 0xE7F01FFF, 0xF81FFFF8, 0xC7E3000, 0x3C00003C, 0x0


MOON DCD 0x3F0000, 0xFFF801FE, 0xE01F801, 0x80F80060, 0xF80010F8, 0x47C00, 0x7E0000, 0x3F00001F, 0xF80, 0x7C000, 0x3E00001, 0xF00000FC, 0x7E00, 0x1F0000, 0xF800043, 0xE00040F8, 0x607E00, 0x601FE0E0, 0x1FF8000, 0x3F000000


SUN DCD 0x80000, 0xE000007, 0xFE0, 0x1E003C0, 0xC3F86061, 0xFC3021FF, 0x801FFC0, 0xBFFFA05, 0xFFFD0EFF, 0xFEEF7FFF, 0x7BBFFFB8, 0x5FFFD02F, 0xFFE801FF, 0xC0087FC2, 0x61FC303, 0xFE181E0, 0x3C003F8, 0x7000, 0x380000, 0x8000000


LOGO_S DCD 0x0, 0x4, 0x0, 0x2000000, 0x10000, 0x80, 0x0, 0x40000000, 0x200000, 0x1000, 0x3FF, 0xE0000006, 0xA0C0000, 0xE050380, 0xC0000, 0x60001800, 0xC0010, 0x1100100, 0x18018C00, 0xC01000FE, 0x100800, 0x41000808, 0x248002, 0x4001240, 0x1040008, 0x20004200, 0x4100022, 0x0, 0x90002AA, 0x48003, 0x1800280, 0x1554000, 0xC000AAA0, 0x60007F, 0xF0003000, 0x10100018, 0x2D5A00, 0xC0016AD, 0x6000A, 0xDA800080, 0x5D74002, 0x400288A0, 0x1200146, 0x50009000, 0xA228004C, 0x501400, 0x62002C1A, 0x210017, 0x1D001040, 0xFFF8010, 0x30010100, 0x180800C9, 0x80080201, 0x64D00800, 0x80202008, 0x201930, 0x8000C0C, 0x98180003, 0x64C1800, 0x732670, 0xF93, 0xE0000000, 0x3E000000

LOGO DCD 0x0, 0x0, 0xC, 0x0, 0x30, 0x0, 0xC0, 0x0, 0x300, 0x0, 0xC00, 0x0, 0x3000, 0x0, 0xC000, 0x0, 0x30000, 0x0, 0xC0000, 0x0, 0x300000, 0x0, 0xC00000, 0x1, 0xF7BE0000, 0x3C, 0x120F0000, 0x380, 0x48070000, 0x3001, 0x20030000, 0x3000C, 0xC0030000, 0x180021, 0x60000, 0x1800084, 0x60000, 0xC000618, 0xC0000, 0x60001020, 0x180003, 0x4080, 0x300018, 0x30100, 0x600040, 0x1FFE00, 0x800200, 0x201000, 0x1001800, 0xAD4000, 0x6004000, 0x2B50000, 0x8020000, 0xAD40000, 0x10080000, 0x7FF80000, 0x40400000, 0x80400000, 0x81000002, 0x1000002, 0xC000018, 0x600000C, 0x20000240, 0x9000010, 0x8000096D, 0xA4000046, 0x28B4, 0x50000190, 0xA001, 0x40000240, 0x32493, 0x900, 0xC924C, 0x2400, 0x200010, 0xB000, 0xFFFFC0, 0x3C000, 0x800400, 0xF0000, 0x2925000, 0x3C0000, 0x4A494800, 0xF00001, 0x29252000, 0x3C00007, 0xFFFF8000, 0x9000012, 0x73920000, 0x2400004B, 0x33480000, 0x90000138, 0xC7200002, 0x400004C3, 0xC800009, 0x8000130F, 0x32000062, 0x4838, 0x48000108, 0x120C1, 0x20000430, 0x4C00C, 0x80003040, 0x130032, 0x8100, 0x4E01C8, 0x20200, 0x12C0D20, 0x100800, 0x49FE480, 0x401000, 0x1FFFFE00, 0x2006000, 0x28005000, 0x18008000, 0xAA154000, 0x40010002, 0xAB550002, 0x6000A, 0xAD540018, 0xC007F, 0xFFF800C0, 0x1800A0, 0x1400600, 0x3002AB, 0x55003000, 0x600AAD, 0x54018000, 0x602AB5, 0x50180000, 0xC0AAD5, 0x40C00000, 0xC2AB55, 0xC000000, 0xEAAD55, 0xC0000000, 0xFAB57C, 0x0, 0x7FFF80, 0x0, 0xFC000, 0x0


BATMAN DCD 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	DCD 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
		DCD 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1C000, 0x0, 0x0, 0x0, 0x0, 0x0
			DCD 0x3C0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0xC0000000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x13F00000, 0x0, 0x0, 0x1C000000, 0x0, 0x0, 0xFF000, 0x0
			DCD	0x0, 0x180000, 0x0, 0x0, 0x1FE0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x3F, 0xEC000000, 0x200, 0xF66, 0x0, 0x0, 0x0, 0x7FFF0000, 0x60002, 0xF 
			DCD	0xFF800000, 0x0, 0x0, 0x7FFE00, 0x600, 0x2000000, 0xFFF0000, 0x0, 0x0, 0xFFFE, 0x6, 0x1E020000, 0x7FF00, 0x0, 0x0, 0x1FF, 0xFE200000 
			DCD	0x63FC200, 0x87FF, 0x10000000, 0x0, 0x3, 0xFFE1E000, 0x0, 0x1FF, 0xFF100000, 0x0, 0x0, 0x1FFFE1FD, 0x4C0, 0x200007F, 0xFFFF1000, 0x0 
			DCD	0x0, 0x3, 0xFD000000, 0x40200000, 0x7FFFFF08, 0x0, 0x0, 0xC000, 0x3FCFC00, 0x23F0400, 0x3FBFFFFD, 0x8F000000, 0x0, 0x80, 0x23FFC
			DCD	0x23E46, 0x7FFFFF, 0xF3090000, 0x0, 0x0, 0x4000007F, 0xFC00022E, 0x4003FFF, 0xFFF00100, 0x0, 0x0, 0xFF0000, 0x3FFC7FF4, 0xE803E7F 
			DCD	0xFFFFF801, 0x40000000, 0x0, 0xF300, 0x7FFFFF, 0xFFFFFFFF, 0xFFFFFFFC, 0x1F00000, 0x0, 0xF8, 0x7FFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFC01E000, 0x0, 0x0, 0x7800007F, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFC01F0, 0x0, 0x0, 0x780000, 0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFC01, 0xE2000000, 0x0, 0x7C000, 0x43F87F, 0xFA0005FF, 0xFFFFFACF, 0x803E0000, 0x0, 0x7C0, 0x43F8, 0x7FF20007, 0xFFFFFFFA, 0xF803C00, 0x0, 0x1F, 0xC000007F, 0xFFFFFE00, 0x7FFFFFF, 0xFB8F003C, 0x0, 0x0, 0xA7C01F00, 0x63FC7FF1, 0xFBF9FFFF, 0xFFF85FF0, 0x3CC00000, 0x0, 0xF8800F, 0x23FC7F, 0xF4FFF1FF, 0xC7FFFC7F, 0xF027C000, 0x0, 0xF800, 0x1F006000, 0x7FF20005, 0xFFE3FFFC, 0x7FF00780, 0x0, 0xFC, 0xBF0220, 0x7FF200, 0x5FFE3FF, 0xFC7FF003, 0xE0000000
				DCD 0x0, 0xFE00FD03, 0x20007FFE, 0x7FFE3, 0xF24C7FF0, 0x3700000, 0x0, 0x7800F0, 0x200007F, 0xFE3FC7FF, 0xE3E3807F, 0xF0003000, 0x0, 0x2F800, 0xF8030000, 0x7FFE3FC7, 0xFFE3E3A0, 0x7FE200B0, 0x0, 0x2F8, 0xF80200, 0x7FFE3F, 0xC7FFE3A3, 0xE07FE200, 0x30000000, 0x7, 0x8807C01E, 0x381FFFF, 0xC03FFFE3, 0xE0007B1E, 0xF00000, 0x0
			DCD	0x3F880440, 0x110381FF, 0xFF403FFF, 0xE3E00070, 0x1E00BE00, 0x0, 0x3FB806, 0xC0130381, 0xFFFF403F, 0xFFE3E000, 0x73DE00FE, 0x0, 0x3FC0, 0x1900F40F
			DCD	0x81FFFF3F, 0xDFFFE3E0, 0x783FC0, 0x3E000000, 0xFF, 0xC01F00BC, 0xF81DFFF, 0xFFF27FE3, 0xE0007C0D, 0x403E0000, 0x0, 0xFA000000, 0x9C0F818F, 0xFFFFE8BF, 0xE3E0007C, 0xC403E00, 0x0, 0xFE0000, 0x19C0F81, 0x8FFFFFF8, 0xBFE3E000, 0x7C0E603E, 0x40000000, 0x7E00, 0x37C0F, 0x818FFFFF, 0xF8BFE3E0, 0x7C0BB0, 0x3FC00000, 0xBE, 0x1E0, 0xF818000, 0xFD03, 0xE0007C01, 0xF03FC000, 0x7, 0xBE000011, 0xE00F8180, 0x6DF, 0x3E0607C, 0x1F03FC0, 0x0, 0x63E0000, 0x13E00F81, 0x80000007, 0xFD03E060, 0x7C01F03F, 0xC0000000, 0x3F006, 0x1E207F, 0x81800000, 0x71F03E0, 0x600C0020, 0x7C00000, 0x7F0, 0x4001EA0, 0x7F808000, 0x71F03, 0xE0400800, 0x2007F800, 0x3, 0xF004001F, 0xE07F8080, 0x51F, 0x3E04008, 0x3007F8, 0x0, 0x3F039C0, 0x1F007F8E, 0x7E01FFF9, 0x1F03E05C, 0xF800607, 0xF8000000, 0x3FC02F, 0xC01F003E, 0x8FFE01FF, 0xF30303E0, 0x7C0F8002, 0x7F80000, 0x3FF0, 0x2FC01F00, 0x7F8FFE01, 0xFFEF1F03, 0xE07C0F80, 0x6073800, 0x3F, 0x8167C01F, 0x23C0FFE, 0x1FFF810, 0x3E07C0F, 0x800000FE, 0x0, 0x3F814FC0, 0x1F02FC0F, 0xFE01FFF8, 0x1003E07C, 0xF800000, 0xFE000000, 0x3E01FF, 0xC01F0000, 0xFFE01FF, 0xF81803E0, 0x7C0F8000, 0xFE0000, 0x7E01, 0xFFC01F00, 0xFFE01, 0xFFF81803, 0xE07C0F80, 0xFE00, 0x3E, 0x1FFC01F, 0xFFE, 0x1FFF818, 0x3E07C0F, 0x800000FE, 0x1, 0xD601F880, 0x1000000F, 0xF201FF40, 0x3E048, 0x1800000, 0x1C000000, 0x1D607FA, 0x0, 0xFF601FE, 0x400003E0, 0x6001F000, 0x180000, 0x1DE07, 0xF9C01800, 0xFEE01, 0xFFC01803, 0xE05C01F0, 0x1E00, 0x1F0, 0x7FC00C0, 0x3000F90, 0x6FE0000, 0x3E04001, 0xF03E0018, 0xF, 0xF007FE00, 0xC0030007, 0xF007FE00
			DCD	0x3E040, 0x1F03C00, 0x7C00000, 0xFF007FE, 0xC00300, 0xFF007FE, 0x3E0, 0x6001F03E, 0x1FC000, 0xFF007, 0xFE07C01D, 0x77F007, 0xFE000003, 0xE00001F0, 0x3DC007C0, 0xFF0, 0x7FE07C0, 0x1D0057F0, 0x7FE0000, 0x3E00001, 0xF03DC007, 0xC000000E, 0x7F805, 0x1F007F, 0xF007F000, 0x3E000, 0x1003C0, 0x7800000, 0xE0007F8, 0x19009F00, 0x7FF007F0, 0x103E0, 0xF801003, 0xE8078800, 0xE0007, 0xF811009F, 0x7FF007, 0xF0000103, 0xE0078010, 0x3C80780, 0xE00, 0x7C00800, 0xFF007FD0, 0x6C00003, 0x3E00F80, 0x3007F800, 0xF800003C, 0x3C018, 0x3FF007F, 0x9006C038, 0x303E07F, 0xF03E07FE, 0xF80000, 0x3F8007C0, 0x803FF00, 0x7FF005C0, 0x380303E0, 0x7FF03E07, 0xFC00F800, 0x3C0000, 0xE803FF, 0x7F803A, 0xD81F03
			DCD	0xE07FF03E, 0x7FDC0F8, 0x2C00, 0xF801, 0xF8007F80, 0x3E00F81F, 0x3E07FF0, 0x3E07FFC0, 0xF800002C, 0xF8, 0x3F3007F, 0x803E00F8, 0x1F03E07F, 0xF03E07FF, 0xC0E00000, 0x31F00007, 0xF7FFEC03, 0xBF803E07, 0xF81F03E0, 0x7FF03E07, 0xFFC01800, 0x1B1F000, 0x6F7F3F4, 0x3BF803E, 0x7F81F03, 0xE07FF03E, 0x7FFC01B, 0x1F1F0, 0x7FFFF, 0xFC03FF80, 0x1007F800, 0x3E07FF0, 0xE07FF80, 0x1F0001FF, 0xD60027FF, 0xFFFC03FF, 0x8F8007F8, 0xE003E07F, 0xF00A07FF, 0xC81F0001, 0xEDCA0027, 0xFFFFFC03, 0xFF8F6007, 0xF88003E0, 0x7FF00A07, 0xFFC81F00, 0x1FBFE00, 0x2FFFFFE0, 0x3FF8FE0, 0x7F8A003, 0xE07FF00E, 0x7FFF81F, 0x1FC3F, 0xFFFFFFFF, 0xE003FFFF, 0xF03FFFF8, 0x3FFFFF0, 0x3FFFFFFF, 0xFF0001FF, 0xFFFFFFFF, 0xFFE003FF, 0xFFF03FFF, 0xF803FFFF, 0xF03FFFFF, 0xFFFF0000, 0x3FFFFF, 0xFFFFE00F, 0xFFFFF03F, 0xFFF803FF, 0xFFF03FFF, 0xFFFFFF00, 0x37FF, 0xFFFFFFE0, 0xFFFFFF0, 0x3FFFF803, 0xFFFFF01F, 0xFFFFFFFF, 0x7, 0xFFFFFFFF, 0xE00FFFFF, 0xF03FFFF8, 0x3FFFFF0, 0x3FFFFFFF, 0xFF000000, 0x7FFFFFF, 0xFFE00FFF, 0xFFFFCFFF, 0xF803FFFF, 0xF1DFFFFF, 0xFFFF0000, 0x3FFFF, 0xFFFFE00F, 0xFFFFFFDF, 0xFFF803FF, 0xFFF13FFF, 0xFFFFFF00, 0x7F, 0xFFFFFFE0, 0xFFFFFFF, 0xFFFFF803, 0xFFFFF1FF, 0xFF800007, 0x0, 0xFFFFFFFF, 0xFF0FFFFF, 0xFFFFFFF8, 0x3FFFFF1, 0xFFFFC000, 0x7000000, 0x3FFFFF, 0xFFFE0FFF, 0xFFFFFFFF, 0xF803FFFF, 0xF1FFFFC0, 0xF0000, 0x7F80, 0x7FFE0F, 0xFFFFFFFF, 0xFFF803FF, 0xFFF1FFEE, 0x100, 0xB, 0x80001FFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xE0000002, 0x0, 0x2780000F, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFE20000, 0x2000000, 0x200000, 0xFFFFFFF
			DCD	0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFE000, 0x0, 0x3000, 0x3FFFF, 0xFFFFFFFF, 0xFEFFFFEF, 0xFFFFFFE0, 0x0, 0x0, 0x13C0, 0x3FFF, 0xFFFE0000, 0xFFFE000, 0x0, 0x0, 0x3, 0xC000003F, 0xFFFFFE00, 0xFFFE0, 0x0, 0x0, 0x0, 0x1C00000, 0x3FFFFFFE, 0x7FF, 0xE0000000, 0x0, 0x0, 0x0, 0x7FFF, 0x0, 0x7F000000, 0x0, 0x0, 0x0, 0x7F, 0xFF800000, 0x7F0000, 0x0, 0x0, 0x0, 0x0, 0xFFFE0000, 0x7F00, 0x0, 0x0, 0x0, 0x0, 0x3FFE00, 0xC, 0x0, 0x0, 0x0, 0x0, 0x2FF0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x2F, 0xF8000000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x7F00000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x6B000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4A0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x800000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	
;Change BYTE 
	
	END
