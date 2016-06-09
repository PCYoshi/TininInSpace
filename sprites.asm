ST7/

;************************************************************************
; TITLE:                
; AUTHOR:               
; DESCRIPTION:          
;************************************************************************

	TITLE "screen_lib.ASM"
	
	MOTOROLA
	
	#include "ST7Lite2.INC"


;************************************************************************
;
;  ZONE DE DECLARATION DES SYMBOLES
;
;************************************************************************
	
	PUBLIC	tabSprite

;************************************************************************
;
;  ZONE DE DECLARATION DES VARIABLES
;
;************************************************************************
	BYTES
	segment byte 'ram0'


;************************************************************************
;
;  ZONE DE DECLARATION DES CONSTANTES
;
;************************************************************************
	WORDS
	segment byte 'rom'


title1	DC.B	64, 20
	DC.B	63
	DC.B	18, 128, 43
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	1, 132, 2, 130, 2, 128, 2, 128, 2
		DC.B	132, 2, 130, 2, 128, 2, 128, 20
	DC.B	1, 65, 128, 65, 2, 64, 128, 64, 2, 129, 1, 128, 2, 65
		DC.B	128, 65, 2, 64, 128, 64, 2, 129, 1, 128, 14, 128, 4
	DC.B	3, 128, 5, 128, 3, 128, 64, 128, 0, 128, 4, 128, 5
		DC.B	128, 3, 128, 64, 128, 0, 128, 13, 130, 3
	DC.B	3, 128, 5, 128, 3, 128, 0, 64, 129, 4, 128
		DC.B	5, 128, 3, 128, 0, 64, 129, 14, 128, 4
	DC.B	3, 128, 4, 130, 2, 128, 1, 64, 128, 4, 128
		DC.B	4, 130, 2, 128, 1, 64, 128, 20
	DC.B	3, 64, 4, 66, 2, 64, 2, 64, 4, 64
		DC.B	4, 66, 2, 64, 2, 64, 20
	DC.B	63
	DC.B	63
	DC.B	54, 128, 7
	DC.B	63
	DC.B	63
	DC.B	15, 130, 2, 128, 2, 128, 16, 193, 17
	DC.B	15, 64, 128, 64, 2, 129, 1, 128, 16, 193, 17
	DC.B	5, 128, 9, 128, 3, 128, 64, 128, 0, 128, 15, 195, 16
	DC.B	16, 128, 3, 128, 0, 64, 129, 5, 128, 8, 195, 16

title2	DC.B	64, 20
	DC.B	15, 130, 2, 128, 1, 64, 128, 14, 197, 15
	DC.B	15, 66, 2, 64, 2, 64, 14, 197, 15
	DC.B	10, 128, 28, 199, 14
	DC.B	9, 130, 27, 199, 14
	DC.B	10, 128, 27, 201, 13
	DC.B	39, 201, 5, 128, 6
	DC.B	39, 129, 195, 131, 4, 130, 5
	DC.B	39, 129, 195, 131, 5, 128, 6
	DC.B	5, 130, 2, 130, 4, 129, 5, 129, 2, 131, 2, 129, 195, 131, 13
	DC.B	4, 128, 66, 2, 128, 65, 128, 2, 128, 65, 128, 3, 128, 65, 2
		DC.B	128, 66, 2, 129, 195, 131, 13
	DC.B	4, 64, 129, 3, 130, 64, 2, 131, 2, 128, 64, 4, 130, 3
		DC.B	129, 195, 131, 13
	DC.B	5, 65, 128, 2, 128, 65, 3, 128, 65, 128, 2, 128
		DC.B	5, 128, 65, 3, 129, 195, 131, 13
	DC.B	4, 130, 64, 2, 128, 5, 128, 1, 128, 2, 64, 130
		DC.B	2, 131, 2, 129, 195, 131, 13
	DC.B	4, 66, 3, 64, 5, 64, 1, 64, 3, 66, 2, 67
		DC.B	2, 129, 195, 131, 13
	DC.B	39, 193, 131, 195, 13
	DC.B	39, 193, 131, 195, 13
	DC.B	39, 193, 131, 195, 8, 128, 3
	DC.B	39, 193, 131, 195, 13
	DC.B	15, 128, 22, 193, 131, 195, 13
	DC.B	39, 193, 131, 195, 13

title3	DC.B	64, 20
	DC.B	39, 193, 131, 195, 13
	DC.B	39, 193, 131, 195, 4, 72
	DC.B	28, 128, 9, 129, 195, 131, 1, 75
	DC.B	5, 128, 32, 129, 195, 131, 77
	DC.B	4, 130, 27, 67, 129, 195, 131, 77
	DC.B	5, 128, 24, 71, 129, 195, 131, 77
	DC.B	27, 75, 129, 195, 131, 77
	DC.B	11, 128, 12, 77, 129, 195, 131, 77
	DC.B	22, 80, 129, 195, 131, 77
	DC.B	19, 83, 129, 195, 131, 77
	DC.B	17, 85, 193, 131, 195, 77
	DC.B	15, 87, 193, 131, 195, 77
	DC.B	12, 90, 193, 131, 195, 77
	DC.B	10, 92, 193, 131, 195, 77
	DC.B	8, 94, 193, 131, 195, 77
	DC.B	6, 96, 193, 131, 195, 77
	DC.B	5, 97, 193, 131, 195, 77
	DC.B	3, 98, 194, 131, 196, 76
	DC.B	1, 99, 205, 75
	DC.B	100, 207, 74

title4	DC.B	64, 20
	DC.B	99, 209, 73
	DC.B	98, 211, 72
	DC.B	97, 195, 69, 194, 67, 196, 71
	DC.B	96, 195, 70, 194, 68, 196, 70
	DC.B	95, 195, 71, 194, 69, 196, 69
	DC.B	94, 195, 72, 194, 70, 196, 68
	DC.B	93, 195, 73, 194, 71, 196, 67
	DC.B	92, 195, 73, 196, 71, 195, 67
	DC.B	92, 194, 73, 198, 71, 195, 66
	DC.B	91, 196, 72, 198, 71, 196, 65
	DC.B	90, 198, 71, 198, 70, 198, 64
	DC.B	90, 198, 72, 196, 71, 198, 64
	DC.B	66, 132, 65, 129, 66, 130, 64, 132, 66, 198, 73, 194, 72, 198, 64
	DC.B	66, 1, 128, 1, 64, 128, 1, 128, 64, 128, 2, 64, 1, 128
		DC.B	1, 67, 196, 87, 196, 65
	DC.B	68, 128, 66, 0, 64, 128, 0, 64, 128, 69, 128, 70, 194, 89, 194, 66
	DC.B	66, 128, 64, 128, 67, 128, 0, 65, 128, 69, 128, 105
	DC.B	66, 130, 66, 131, 64, 0, 130, 66, 128, 105
	DC.B	66, 2, 66, 3, 65, 2, 66, 0, 105
	DC.B	127
	DC.B	127

rocket	DC.B	11, 18
	DC.B	4, 192, 4
	DC.B	4, 192, 4
	DC.B	3, 194, 3
	DC.B	3, 194, 3
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	2, 196, 2
	DC.B	1, 198, 1
	DC.B	0, 200, 0
	DC.B	195, 2, 195
	DC.B	193, 6, 193
	DC.B	193, 6, 193

game	DC.B	28, 14
	DC.B	132, 4, 128, 3, 129, 0, 129, 2, 132
	DC.B	128, 67, 4, 128, 3, 129, 0, 129, 2, 128, 67
	DC.B	128, 7, 130, 2, 129, 0, 129, 2, 128, 3
	DC.B	128, 7, 128, 64, 128, 2, 129, 0, 129, 2, 128, 3
	DC.B	128, 6, 129, 0, 129, 1, 128, 64, 128, 64, 128, 2, 128, 3
	DC.B	128, 6, 128, 64, 0, 64, 128, 1, 128, 0, 128, 0, 128, 2, 128, 3
	DC.B	128, 6, 128, 2, 128, 1, 128, 0, 128, 0, 128, 2, 132
	DC.B	128, 0, 130, 2, 132, 1, 128, 0, 128, 0, 128, 2, 128, 67
	DC.B	128, 0, 65, 128, 2, 128, 66, 128, 1, 128, 0
		DC.B	64, 0, 128, 2, 128, 3
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 2, 128, 2, 128, 3
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 2, 128, 2, 128, 3
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 2, 128, 2, 128, 3
	DC.B	132, 2, 128, 2, 128, 1, 128, 2, 128, 2, 132
	DC.B	68, 2, 64, 2, 64, 1, 64, 2, 64, 2, 68

over	DC.B	28, 14
	DC.B	132, 2, 128, 2, 128, 1, 132, 2, 132
	DC.B	128, 66, 128, 2, 128, 2, 128, 1, 128, 67, 2, 128, 66, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 6, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 6, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 1, 128, 6, 128, 2, 128
	DC.B	128, 2, 128, 2, 64, 128, 0, 128, 64, 1, 128, 6, 128, 2, 128
	DC.B	128, 2, 128, 3, 128, 0, 128, 2, 132, 2, 132
	DC.B	128, 2, 128, 3, 128, 0, 128, 2, 128, 67, 2, 129, 66
	DC.B	128, 2, 128, 3, 130, 2, 128, 6, 130, 1
	DC.B	128, 2, 128, 3, 130, 2, 128, 6, 128, 64, 128, 1
	DC.B	128, 2, 128, 3, 64, 128, 64, 2, 128, 6, 128, 0, 64, 128, 0
	DC.B	128, 2, 128, 4, 128, 3, 128, 6, 128, 1, 128, 0
	DC.B	132, 4, 128, 3, 132, 2, 128, 1, 64, 128
	DC.B	68, 4, 64, 3, 68, 2, 64, 2, 64

nb0	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	132
	DC.B	132

nb1	DC.B	5, 10
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129

nb2	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	132
	DC.B	132
	DC.B	129, 2
	DC.B	129, 2
	DC.B	132
	DC.B	132

nb3	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	132
	DC.B	132

nb4	DC.B	5, 10
	DC.B	1, 130
	DC.B	0, 131
	DC.B	129, 0, 129
	DC.B	128, 1, 129
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129

nb5	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	129, 2
	DC.B	129, 2
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	132
	DC.B	132

nb6	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	129, 2
	DC.B	129, 2
	DC.B	132
	DC.B	132
	DC.B	129, 1, 128
	DC.B	129, 1, 128
	DC.B	132
	DC.B	132

nb7	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129
	DC.B	0, 131
	DC.B	0, 131
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129

nb8	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	132
	DC.B	132
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	132
	DC.B	132

nb9	DC.B	5, 10
	DC.B	132
	DC.B	132
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	128, 1, 129
	DC.B	132
	DC.B	132
	DC.B	2, 129
	DC.B	2, 129
	DC.B	2, 129

rocketBroken 	DC.B	11, 18
	DC.B	6, 192, 2
	DC.B	2, 192, 0, 128, 0, 193, 1
	DC.B	0, 194, 65, 128, 193, 1
	DC.B	0, 195, 64, 128, 194, 0
	DC.B	0, 194, 128, 65, 194, 0
	DC.B	2, 192, 128, 65, 192, 2
	DC.B	2, 193, 128, 64, 192, 2
	DC.B	2, 129, 193, 128, 2
	DC.B	0, 193, 64, 193, 65, 2
	DC.B	1, 195, 129, 2
	DC.B	2, 192, 128, 193, 129, 1
	DC.B	2, 128, 65, 193, 2
	DC.B	2, 192, 64, 193, 3
	DC.B	1, 193, 64, 128, 64, 195
	DC.B	0, 194, 129, 194, 1
	DC.B	0, 194, 128, 195, 1
	DC.B	0, 192, 1, 128, 5
	DC.B	0, 192, 8

bsod1:	DC.B	64, 20
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	204, 128, 197, 128, 234
	DC.B	203, 130, 195, 128, 235
	DC.B	204, 128, 195, 128, 236
	DC.B	209, 128, 236
	DC.B	208, 128, 237
	DC.B	208, 128, 237
	DC.B	208, 128, 237
	DC.B	209, 128, 236
	DC.B	204, 128, 195, 128, 236
	DC.B	203, 130, 195, 128, 235
	DC.B	204, 128, 197, 128, 234

bsod21	DC.B	64, 10
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	196, 128, 192, 128, 193, 128, 193, 128, 192, 128, 192, 129
	DC.B	196, 129, 192, 130, 192, 130, 194, 129, 194, 128, 193, 128
	DC.B	193, 128, 206
	DC.B	196, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192, 128
	DC.B	192, 128, 192, 128, 194, 128, 195, 128, 195, 128, 194, 128
	DC.B	192, 128, 192, 128, 192, 128, 192, 129, 192, 128, 206
	DC.B	196, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192, 128
	DC.B	192, 129, 195, 130, 193, 128, 194, 128, 195, 129, 193
	DC.B	130, 192, 128, 192, 129, 206

bsod22	DC.B	64, 10
	DC.B	197, 128, 193, 128, 192, 128, 192, 128, 192, 128, 192
	DC.B 128, 192, 128, 196, 128, 193, 128, 194, 128, 195, 128
	DC.B 192, 128, 192, 128, 192, 128, 192, 128, 193, 128, 206
	DC.B	197, 128, 194, 128, 194, 128, 193, 128, 192, 128, 194
	DC.B 129, 194, 128, 194, 128, 195, 128, 192, 128, 192, 128
	DC.B 192, 128, 192, 128, 193, 128, 206
	DC.B	255
	DC.B	255
	DC.B	196, 130, 192, 128, 192, 128, 192, 130, 193, 128, 196
	DC.B 128, 195, 129, 193, 129, 194, 128, 193, 129, 193, 128
	DC.B 194, 130, 192, 128, 194, 128, 197
	DC.B	197, 128, 193, 130, 193, 128, 193, 128, 192, 128, 194
	DC.B 128, 192, 128, 194, 128, 192, 128, 192, 128, 192, 128
	DC.B 192, 128, 192, 128, 192, 128, 192, 128, 192, 128, 194
	DC.B 128, 194, 129, 192, 129, 197
	DC.B	197, 128, 193, 128, 192, 128, 193, 128, 193, 128, 192
	DC.B 128, 194, 130, 194, 129, 193, 129, 193, 128, 192, 128, 192
	DC.B 129, 193, 128, 194, 129, 193, 128, 192, 128, 192, 128, 197
	DC.B	197, 128, 193, 128, 192, 128, 193, 128, 193, 128, 192, 128
	DC.B 194, 128, 192, 128, 194, 128, 194, 128, 192, 128, 192, 128, 192
	DC.B 128, 192, 128, 192, 128, 192, 128, 194, 128, 194, 128, 194, 128, 197
	DC.B	196, 130, 192, 128, 192, 128, 193, 128, 194, 128, 195, 128, 192
	DC.B 128, 194, 128, 194, 128, 192, 128, 193, 128, 193, 129, 193
	DC.B 130, 192, 130, 192, 128, 194, 128, 197
	DC.B	255

bsod3:	DC.B	64, 20
	DC.B	255
	DC.B	197, 128, 193, 128, 193, 128, 192, 129, 194, 128, 193, 128, 192
	DC.B	130, 192, 130, 192, 129, 194, 129, 193, 130, 193, 128, 208
	DC.B	196, 128, 192, 128, 192, 129, 192, 128, 192, 128, 192, 128, 193
	DC.B	129, 192, 128, 192, 128, 194, 128, 194, 128, 192, 128, 192, 128
	DC.B	196, 128, 193, 128, 192, 128, 207
	DC.B	196, 130, 192, 128, 192, 129, 192, 128, 192, 128, 193, 128, 192
	DC.B	129, 192, 129, 193, 129, 193, 128, 192, 128, 192, 130, 194
	DC.B	128, 193, 128, 192, 128, 207
	DC.B	196, 128, 192, 128, 192, 128, 193, 128, 192, 128, 192, 128
	DC.B	193, 128, 193, 128, 192, 128, 194, 128, 194, 128, 192, 128, 194
	DC.B	128, 194, 128, 193, 128, 192, 128, 207
	DC.B	196, 128, 192, 128, 192, 128, 193, 128, 192, 129, 194, 128, 193
	DC.B	128, 192, 130, 192, 130, 192, 129, 193, 129, 195, 128, 194, 128, 208
	DC.B	255
	DC.B	255
	DC.B	196, 129, 193, 130, 193, 129, 192, 130, 193, 128, 193, 129
	DC.B	193, 130, 223
	DC.B	196, 128, 192, 128, 192, 128, 194, 128, 195, 128, 193, 128
	DC.B	192, 128, 192, 128, 192, 128, 193, 128, 224
	DC.B	196, 129, 193, 129, 193, 130, 193, 128, 193, 130, 192, 129
	DC.B	194, 128, 224
	DC.B	196, 128, 192, 128, 192, 128, 196, 128, 193, 128, 193, 128
	DC.B	192, 128, 192, 128, 192, 128, 193, 128, 224
	DC.B	196, 128, 192, 128, 192, 130, 192, 129, 194, 128, 193, 128
	DC.B	192, 128, 192, 128, 192, 128, 193, 128, 193, 128, 221
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255

bsod4:		DC.B	64, 20
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	246, 131, 196
	DC.B	242, 129, 192, 132, 196
	DC.B	240, 131, 192, 132, 196
	DC.B	196, 129, 194, 128, 193, 128, 194, 128, 192, 130, 192, 129, 193, 130
	DC.B	192, 129, 194, 129, 193, 128, 192, 128, 197, 131, 192, 132, 196
	DC.B	196, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192
	DC.B	128, 192, 128, 194, 128, 192, 128, 192, 128, 194, 128, 192, 128, 193
	DC.B	128, 192, 128, 192, 128, 192, 128, 197, 131, 192, 132, 196
	DC.B	196, 129, 193, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192, 129, 193
	DC.B	129, 193, 129, 193, 128, 192, 128, 193, 129, 193, 128, 192, 128, 212
	DC.B	196, 128, 194, 128, 192, 128, 192, 128, 192, 128, 192, 128, 192, 128, 194
	DC.B	128, 192, 128, 192, 128, 194, 128, 192, 128, 193, 128, 192, 128, 193
	DC.B	128, 198, 131, 192, 132, 196
	DC.B	196, 128, 195, 128, 194, 128, 192, 128, 193, 130, 192, 128, 192, 128
	DC.B	192, 130, 192, 129, 194, 129, 194, 128, 198, 131, 192, 132, 196
	DC.B	240, 131, 192, 132, 196
	DC.B	242, 129, 192, 132, 196
	DC.B	246, 131, 196
	DC.B	255
	DC.B	255
	DC.B	255
	DC.B	255

you:	DC.B	21, 14
	DC.B	128, 2, 128, 2, 132, 2, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 66, 128, 2, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 2, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 2, 128
	DC.B	129, 0, 129, 2, 128, 2, 128, 2, 128, 2, 128
	DC.B	64, 128, 0, 128, 64, 2, 128, 2, 128, 2, 128, 2, 128
	DC.B	0, 130, 3, 128, 2, 128, 2, 128, 2, 128
	DC.B	0, 64, 128, 64, 3, 128, 2, 128, 2, 128, 2, 128
	DC.B	1, 128, 4, 128, 2, 128, 2, 128, 2, 128
	DC.B	1, 128, 4, 128, 2, 128, 2, 128, 2, 128
	DC.B	1, 128, 4, 128, 2, 128, 2, 128, 2, 128
	DC.B	1, 128, 4, 132, 2, 132
	DC.B	1, 64, 4, 68, 2, 68

lose:	DC.B	29, 14
	DC.B	128, 6, 132, 2, 132, 2, 132
	DC.B	128, 6, 128, 66, 128, 2, 128, 67, 2, 128, 67
	DC.B	128, 6, 128, 2, 128, 2, 128, 6, 128, 3
	DC.B	128, 6, 128, 2, 128, 2, 128, 6, 128, 3
	DC.B	128, 6, 128, 2, 128, 2, 128, 6, 128, 3
	DC.B	128, 6, 128, 2, 128, 2, 128, 6, 128, 3
	DC.B	128, 6, 128, 2, 128, 2, 132, 2, 132
	DC.B	128, 6, 128, 2, 128, 2, 67, 128, 2, 128, 67
	DC.B	128, 6, 128, 2, 128, 6, 128, 2, 128, 3
	DC.B	128, 6, 128, 2, 128, 6, 128, 2, 128, 3
	DC.B	128, 6, 128, 2, 128, 6, 128, 2, 128, 3
	DC.B	128, 6, 128, 2, 128, 6, 128, 2, 128, 3
	DC.B	132, 2, 132, 2, 132, 2, 132
	DC.B	68, 2, 68, 2, 68, 2, 68

win:	DC.B	21, 14
	DC.B	128, 6, 128, 2, 128, 2, 128, 2, 128
	DC.B	128, 6, 128, 2, 64, 2, 129, 1, 128
	DC.B	128, 6, 128, 6, 129, 1, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 130, 0, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 64, 128, 0, 128
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 0, 130
	DC.B	128, 2, 128, 2, 128, 2, 128, 2, 128, 0, 64, 129
	DC.B	128, 1, 130, 1, 128, 2, 128, 2, 128, 1, 129
	DC.B	128, 1, 128, 64, 128, 1, 128, 2, 128, 2, 128, 1, 64, 128
	DC.B	128, 0, 129, 0, 129, 0, 128, 2, 128, 2, 128, 2, 128
	DC.B	128, 0, 128, 64, 0, 64, 128, 0, 128, 2, 128, 2, 128, 2, 128
	DC.B	130, 2, 130, 2, 128, 2, 128, 2, 128
	DC.B	129, 64, 2, 64, 129, 2, 128, 2, 128, 2, 128
	DC.B	65, 4, 65, 2, 64, 2, 64, 2, 64

norris:	DC.B	11, 18
	DC.B	10
	DC.B	10
	DC.B	10
	DC.B	3, 67, 2
	DC.B	1, 71, 0
	DC.B	0, 73
	DC.B	67, 128, 64, 128, 64, 128, 64, 128
	DC.B	66, 128, 64, 128, 64, 128, 64, 128, 64
	DC.B	65, 128, 64, 192, 0, 192, 0, 192, 64, 128
	DC.B	66, 128, 192, 0, 192, 0, 192, 128, 64
	DC.B	0, 192, 128, 64, 196, 64, 0
	DC.B	0, 192, 64, 128, 197, 0
	DC.B	1, 192, 70, 0
	DC.B	2, 65, 132, 0
	DC.B	3, 129, 194, 1
	DC.B	10
	DC.B	10
	DC.B	10

c1:	DC.B	64, 20
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	27, 137, 25
	DC.B	24, 140, 25
	DC.B	23, 144, 22
	DC.B	22, 147, 20
	DC.B	21, 148, 20
	DC.B	20, 150, 19
	DC.B	20, 150, 19
	DC.B	19, 151, 19
	DC.B	19, 140, 192, 137, 19
	DC.B	18, 140, 193, 137, 19
	DC.B	17, 141, 193, 130, 193, 132, 19
	DC.B	17, 138, 192, 129, 193, 130, 193, 132, 19
	DC.B	17, 138, 197, 128, 194, 132, 19
	DC.B	17, 138, 202, 131, 19
	DC.B	17, 136, 205, 129, 20
	DC.B	20, 133, 193, 5, 193, 1, 193, 22
	DC.B	20, 194, 130, 193, 0, 193, 0, 129, 193, 0, 128, 192, 23

c2:	DC.B	64, 20
	DC.B	20, 194, 130, 193, 0, 193, 0, 129, 193, 0, 128, 192, 23
	DC.B	20, 195, 130, 195, 1, 194, 1, 193, 22
	DC.B	21, 194, 131, 203, 22
	DC.B	22, 194, 132, 201, 22
	DC.B	24, 192, 0, 136, 196, 22
	DC.B	18, 195, 5, 139, 0, 193, 19
	DC.B	17, 197, 4, 139, 0, 194, 18
	DC.B	16, 198, 1, 64, 3, 130, 197, 128, 1, 193, 18
	DC.B	16, 198, 1, 66, 1, 130, 193, 129, 193, 2, 193, 18
	DC.B	15, 199, 1, 67, 3, 192, 131, 3, 194, 17
	DC.B	14, 200, 1, 68, 8, 65, 0, 195, 16
	DC.B	14, 200, 1, 68, 0, 194, 0, 69, 0, 195, 16
	DC.B	14, 200, 1, 69, 0, 193, 70, 0, 195, 16
	DC.B	14, 199, 2, 69, 0, 192, 71, 0, 195, 16
	DC.B	13, 200, 1, 79, 0, 197, 15
	DC.B	13, 200, 1, 78, 0, 198, 15
	DC.B	13, 200, 1, 77, 1, 198, 15
	DC.B	13, 193, 29, 193, 15
	DC.B	13, 192, 0, 134, 0, 68, 9, 65, 0, 133, 15
	DC.B	15, 134, 1, 68, 2, 64, 3, 66, 0, 133, 15

c3:	DC.B	64, 20
	DC.B	13, 137, 1, 68, 1, 65, 1, 67, 0, 134, 14
	DC.B	13, 136, 2, 68, 1, 65, 1, 67, 0, 133, 15
	DC.B	13, 136, 2, 68, 1, 65, 1, 67, 1, 132, 15
	DC.B	13, 129, 9, 68, 1, 65, 1, 65, 1, 64, 21
	DC.B	13, 132, 0, 196, 13, 66, 2, 195, 14
	DC.B	13, 132, 0, 196, 12, 67, 2, 196, 13
	DC.B	13, 132, 0, 196, 0, 67, 2, 65, 1, 68, 3, 195, 13
	DC.B	13, 132, 0, 194, 0, 193, 0, 68, 0, 74, 0, 196, 13
	DC.B	13, 132, 0, 194, 0, 193, 0, 68, 1, 73, 0, 195, 14
	DC.B	13, 132, 0, 192, 2, 193, 0, 68, 2, 72, 0, 194, 15
	DC.B	13, 132, 0, 197, 0, 68, 3, 71, 19
	DC.B	13, 132, 0, 197, 0, 68, 3, 72, 18
	DC.B	13, 132, 0, 196, 1, 68, 3, 72, 18
	DC.B	13, 131, 7, 69, 3, 72, 18
	DC.B	13, 131, 197, 1, 69, 3, 72, 18
	DC.B	15, 129, 198, 0, 69, 3, 72, 18
	DC.B	24, 70, 3, 74, 16
	DC.B	24, 69, 5, 73, 16
	DC.B	18, 195, 2, 67, 6, 69, 20
	DC.B	14, 129, 200, 10, 65, 4, 195, 15

c4:	DC.B	64, 20
	DC.B	12, 129, 203, 128, 8, 64, 0, 200, 131, 11
	DC.B	11, 128, 197, 128, 198, 128, 10, 204, 128, 10
	DC.B	11, 128, 197, 128, 198, 128, 9, 128, 204, 128, 10
	DC.B	12, 133, 0, 134, 10, 137, 1, 129, 11
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	DC.B	63
	
cnf11:	DC.B	61, 5
	DC.B	130, 0, 128, 0, 128, 0, 128, 0, 128, 0, 130, 0, 128, 4
	DC.B	128, 1, 128, 0, 130, 0, 129, 1, 129, 1, 130, 1, 129, 2
	DC.B	130, 1, 128, 1, 128, 1, 128
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 2, 128, 0
	DC.B	128, 2, 129, 0, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0
	DC.B	128, 0, 128, 1, 128, 1, 128, 4, 128, 2, 128, 0, 128, 0
	DC.B	129, 0, 128
	DC.B	128, 2, 130, 0, 128, 0, 128, 0, 128, 2, 129, 3, 128, 0
	DC.B	129, 0, 128, 0, 128, 0, 129, 1, 129, 2, 128, 2, 128, 3
	DC.B	128, 2, 130, 0, 128, 0, 129
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 2, 128, 0
	DC.B	128, 2, 128, 1, 128, 0, 128, 0, 128, 0, 128, 0, 128, 0
	DC.B	128, 0, 128, 1, 128, 3, 128, 2, 128, 2, 128, 0, 128, 0
	DC.B	128, 1, 128
	DC.B	130, 0, 128, 0, 128, 0, 130, 0, 130, 0, 128, 0, 128, 2
	DC.B	128, 1, 128, 0, 130, 0, 128, 0, 128, 0, 128, 0, 128, 0
	DC.B	130, 0, 129, 3, 130, 0, 128, 0, 128, 0, 128, 1, 128
	
cnf12:	DC.B	62, 5
	DC.B	130, 0, 128, 0, 128, 0, 130, 1, 130, 0, 128, 7, 130, 0
	DC.B	128, 1, 128, 2, 129, 0, 130, 0, 130, 1, 129, 1, 130, 0
	DC.B	128, 2, 128
	DC.B	128, 0, 128, 0, 128, 0, 128, 1, 128, 2, 128, 0, 128, 0
	DC.B	128, 0, 128, 0, 130, 2, 128, 1, 129, 0, 128, 1, 128, 3
	DC.B	128, 3, 128, 1, 128, 0, 128, 0, 128, 0, 128, 0, 129, 0
	DC.B	129
	DC.B	130, 0, 128, 0, 128, 1, 128, 2, 130, 0, 129, 1, 128, 0
	DC.B	128, 2, 128, 1, 128, 0, 129, 2, 128, 2, 128, 2, 128, 2
	DC.B	129, 1, 128, 0, 128, 0, 128, 0, 128, 0, 128
	DC.B	128, 2, 128, 0, 128, 1, 128, 4, 128, 0, 128, 0, 128, 0
	DC.B	128, 0, 128, 2, 128, 1, 128, 1, 128, 3, 128, 1, 128, 2
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 2, 128
	DC.B	128, 2, 130, 1, 128, 2, 130, 0, 128, 0, 128, 0, 130, 1
	DC.B	130, 0, 128, 1, 128, 1, 129, 2, 128, 2, 128, 2, 128, 0
	DC.B	128, 0, 130, 0, 128, 2, 128

cnf21:		DC.B	54, 5
	DC.B	130, 0, 128, 0, 128, 0, 128, 0, 128, 0, 130, 0, 128, 4
	DC.B	129, 1, 130, 0, 128, 1, 128, 0, 128, 0, 130, 2, 128, 0
	DC.B	128, 1, 129, 0, 130
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 2, 128, 0
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 129, 0, 128, 0, 128
	DC.B	1, 128, 3, 128, 0, 128, 0, 128, 2, 128, 1
	DC.B	128, 2, 130, 0, 128, 0, 128, 0, 128, 2, 129, 3, 128, 0
	DC.B	128, 0, 128, 0, 128, 0, 128, 0, 129, 3, 128, 3, 128, 0, 128
	DC.B	1, 128, 1, 130
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 2, 128, 0
	DC.B	128, 2, 128, 0, 128, 0, 128, 0, 128, 0, 128, 1, 128, 3, 128
	DC.B	3, 128, 0, 128, 2, 128, 0, 128, 1
	DC.B	130, 0, 128, 0, 128, 0, 130, 0, 130, 0, 128, 0, 128, 2
	DC.B	129, 1, 130, 0, 128, 1, 128, 3, 128, 3, 130, 0, 129, 1, 130


cnf22:	DC.B	64, 6
	DC.B	0, 128, 2, 129, 0, 128, 2, 128, 2, 130, 0, 130, 0, 130
	DC.B	2, 128, 0, 128, 0, 130, 1, 129, 0, 128, 0, 128, 0, 130
	DC.B	1, 128, 2, 128, 0, 128, 0, 128, 2, 128
	DC.B	128, 0, 128, 0, 128, 2, 129, 0, 129, 3, 128, 1, 128, 0
	DC.B	128, 0, 128, 0, 128, 2, 128, 0, 128, 1, 128, 1, 128, 2
	DC.B	128, 0, 128, 1, 128, 2, 128, 2, 128, 0, 128, 0, 128, 2
	DC.B	128
	DC.B	130, 1, 128, 1, 128, 0, 128, 0, 128, 3, 128, 1, 128, 0
	DC.B	128, 0, 128, 0, 128, 2, 130, 1, 128, 1, 128, 0, 128, 0
	DC.B	130, 1, 128, 2, 128, 2, 128, 0, 128, 0, 128, 2, 128
	DC.B	128, 0, 128, 2, 128, 0, 128, 2, 128, 1, 128, 0, 128, 1
	DC.B	128, 0, 128, 0, 128, 0, 128, 2, 128, 0, 128, 1, 128, 1
	DC.B	128, 0, 128, 0, 128, 0, 128, 1, 128, 2, 128, 2, 128, 0
	DC.B	128, 0, 128, 3
	DC.B	128, 0, 128, 0, 129, 1, 128, 2, 128, 1, 128, 0, 128, 1
	DC.B	130, 0, 130, 2, 128, 0, 128, 0, 130, 0, 130, 0, 128, 0
	DC.B	128, 1, 128, 2, 130, 1, 128, 1, 130, 0, 128
	DC.B	13, 128, 48

tabSprite	DC.W	nb0, nb1, nb2, nb3, nb4, nb5, nb6, nb7, nb8, nb9	;0 2 4 6 8 10 12 14 16 18
	DC.W	title1, title2, title3, title4	;20 22 24 26
	DC.W	rocket,	;28
	DC.W	game, over,	;30 32
	DC.W	rocketBroken	;34
	DC.W	bsod1, bsod21, bsod22, bsod3, bsod4	;36 38 40 42 44
	DC.W	you, lose, win	;46 48 50
	DC.W	norris	;52
	DC.W	c1, c2, c3, c4	;54 56 58 60
	DC.W	cnf11, cnf12, cnf21, cnf22	;62 64 66 68
	

;************************************************************************

	END

;************************************************************************
