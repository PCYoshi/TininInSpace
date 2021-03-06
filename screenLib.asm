ST7/

;************************************************************************
; TITLE:          screenLib.asm      
; AUTHOR:         Joseph CAILLET & Thomas COUSSOT      
; DESCRIPTION:    driver ecran tir� du code C fourni + fonction graphique de notre cru      
;************************************************************************

	TITLE "screen_lib.ASM"
	
	MOTOROLA
	
	#include "ST7Lite2.INC"
	#include "time.INC"


;************************************************************************
;
;  ZONE DE DECLARATION DES SYMBOLES
;
;************************************************************************
	PUBLIC	initTFT
	
	PUBLIC	fillRectTFT
	PUBLIC	clrScreenZoomIn
	PUBLIC	fillScreenTFT
	PUBLIC	drawPixel
	PUBLIC	setSprite
	PUBLIC	dspSprite
	PUBLIC	dspNum
;drawpixel & fillrect
	PUBLIC	x0win
	PUBLIC	y0win
	PUBLIC	x1win
	PUBLIC	y1win

;drawrect
	PUBLIC	colorMSB
	PUBLIC	colorLSB
	PUBLIC	width
	PUBLIC	height

;setSprite
	PUBLIC	numSprite

;displaySrite
	PUBLIC	dspCoef
	PUBLIC	dsp0X
	PUBLIC	dsp0Y
	PUBLIC	temp

;dspNum
	PUBLIC	scoreD
	PUBLIC	scoreU
	PUBLIC	numX
	PUBLIC	numY

;setPalet
	PUBLIC	setPalet1
	PUBLIC	setPalet2
	PUBLIC	setPalet3
	PUBLIC	setPalet4

	
DELAY EQU $80


INITR_GREENTAB EQU $0
INITR_REDTAB   EQU $1
INITR_BLACKTAB   EQU $2

INITR_18GREENTAB    EQU INITR_GREENTAB
INITR_18REDTAB      EQU INITR_REDTAB
INITR_18BLACKTAB    EQU INITR_BLACKTAB
INITR_144GREENTAB   EQU $1

ST7735_TFTWIDTH  EQU 128		;// Width TFT display 
ST7735_TFTHEIGHT_18  EQU 160	;// Heigt TFT 1.8" display

ST7735_NOP     EQU  $00
ST7735_SWRESET EQU  $01
ST7735_RDDID   EQU  $04
ST7735_RDDST   EQU  $09

ST7735_SLPIN   EQU  $10
ST7735_SLPOUT  EQU  $11
ST7735_PTLON   EQU  $12
ST7735_NORON   EQU  $13

ST7735_INVOFF  EQU  $20
ST7735_INVON   EQU  $21
ST7735_DISPOFF EQU  $28
ST7735_DISPON  EQU  $29
ST7735_CASET   EQU  $2A
ST7735_RASET   EQU  $2B
ST7735_RAMWR   EQU  $2C
ST7735_RAMRD   EQU  $2E

ST7735_PTLAR   EQU  $30
ST7735_COLMOD  EQU  $3A
ST7735_MADCTL  EQU  $36

ST7735_FRMCTR1 EQU  $B1
ST7735_FRMCTR2 EQU  $B2
ST7735_FRMCTR3 EQU  $B3
ST7735_INVCTR  EQU  $B4
ST7735_DISSET5 EQU  $B6

ST7735_PWCTR1  EQU  $C0
ST7735_PWCTR2  EQU  $C1
ST7735_PWCTR3  EQU  $C2
ST7735_PWCTR4  EQU  $C3
ST7735_PWCTR5  EQU  $C4
ST7735_VMCTR1  EQU  $C5

ST7735_RDID1   EQU  $DA
ST7735_RDID2   EQU  $DB
ST7735_RDID3   EQU  $DC
ST7735_RDID4   EQU  $DD

ST7735_PWCTR6  EQU  $FC

ST7735_GMCTRP1 EQU  $E0
ST7735_GMCTRN1 EQU  $E1

	;EXTERN wait500ms
	;EXTERN wait

	EXTERN waitTime.B
	EXTERN tabSprite.W
	
;************************************************************************
;
;  ZONE DE DECLARATION DES VARIABLES
;
;************************************************************************
	BYTES
	segment byte 'ram0'

var	DS.B	1	;variable tepmoraire pour contrer limitation mode d'adressage
temp	DS.B	1;variable tepmoraire pour contrer limitation mode d'adressage

;Les variable ci-dessous sont pr�c�d�es du nom de la fonction qui les utilise.
;Un p indique que la variable est un param�tre.

;writeData & writeCmd & writeSPI
dataout	DS.B	1;p

;commandList
addr	DS.B	1; p
numCmd	DS.B	1
numArg	DS.B	1
ms	DS.B	1;

;setAdrWindow & drawpixel
x0win	DS.B	1;p
y0win	DS.B	1;p
x1win	DS.B	1;p
y1win	DS.B	1;p

;drawrect
colorMSB	DS.B	1;p
colorLSB	DS.B	1;p
width	DS.B 1;p
height	DS.B 1;p

;setSprite
numSprite	DS.B	1
sprite	DS.W	1

;displaySrite
dspCoef DS.B 1
dsp0X DS.B 1
dsp0Y DS.B 1
color1MSB	DS.B	1
color1LSB	DS.B	1
color2MSB	DS.B	1
color2LSB	DS.B	1
color3MSB	DS.B	1
color3LSB	DS.B	1
color4MSB	DS.B	1
color4LSB	DS.B	1

;dspNum
scoreD	DS.B	1
scoreU	DS.B	1
numX DS.B 1
numY DS.B 1

;************************************************************************
;
;  ZONE DE DECLARATION DES CONSTANTES
;
;************************************************************************
	WORDS
	segment byte 'rom'
	

;tableaux de commandes pour configurer l'�cran
Rcmd1	DC.B   15,
	DC.B   ST7735_SWRESET,   DELAY,
	DC.B     150,
	DC.B   ST7735_SLPOUT ,   DELAY,
	DC.B     255,
	DC.B   ST7735_FRMCTR1, 3  ,
	DC.B     $01, $2C, $2D,
	DC.B   ST7735_FRMCTR2, 3  ,
	DC.B     $01, $2C, $2D,
	DC.B   ST7735_FRMCTR3, 6  ,
	DC.B     $01, $2C, $2D,
	DC.B     $01, $2C, $2D,
	DC.B   ST7735_INVCTR , 1  ,
	DC.B     $07,
	DC.B   ST7735_PWCTR1 , 3  ,
	DC.B     $A2,
	DC.B     $02,
	DC.B     $84,
	DC.B   ST7735_PWCTR2 , 1  ,
	DC.B     $C5,
	DC.B   ST7735_PWCTR3 , 2  ,
	DC.B     $0A,
	DC.B     $00,
	DC.B   ST7735_PWCTR4 , 2  ,
	DC.B     $8A,
	DC.B     $2A,
	DC.B   ST7735_PWCTR5 , 2  ,
	DC.B     $8A, $EE,
	DC.B   ST7735_VMCTR1 , 1  ,
	DC.B     $0E,
	DC.B   ST7735_INVOFF , 0  ,
	DC.B   ST7735_MADCTL , 1  ,
	DC.B     $C8,
	DC.B   ST7735_COLMOD , 1  ,
	DC.B     $05
	
	
Rcmd2red DC.B 2,
	DC.B    ST7735_CASET  , 4
	DC.B      $00, $00,
	DC.B      $00, $7F,
	DC.B    ST7735_RASET  , 4
	DC.B      $00, $00,
	DC.B      $00, $9F


Rcmd3 DC.B 4,       
	DC.B    ST7735_GMCTRP1, 16      ,
	DC.B      $02, $1c, $07, $12,
	DC.B      $37, $32, $29, $2d,
	DC.B      $29, $25, $2B, $39,
	DC.B      $00, $01, $03, $10,
	DC.B    ST7735_GMCTRN1, 16      ,
	DC.B      $03, $1d, $07, $06,
	DC.B      $2E, $2C, $29, $2D,
	DC.B      $2E, $2E, $37, $3F,
	DC.B      $00, $00, $02, $10,
	DC.B    ST7735_NORON  ,    DELAY,
	DC.B      10,                    
	DC.B    ST7735_DISPON ,    DELAY,
	DC.B      100
;************************************************************************
;
;  ZONE DE DECLARATION DES SOUS-PROGRAMMES
;
;************************************************************************


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; macro pour 'et' bit � bit et complement a un ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MandComp MACRO dest mask
	LD	X,mask
	CPL	X
	LD	var,X
	LD	A,dest
	AND	A,var
	LD	dest,A
	MEND

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; macro pour 'or' bit � bit ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Mor MACRO dest src
	LD	A,dest
	OR	A,src
	LD	dest,A
	MEND


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; macro pour 'and' bit � bit ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Mand MACRO dest src
	LD	A,dest
	AND	A,src
	LD	dest,A
	MEND
	
;---------------------------------------------------	
;Fonctions du driver traduit du code C
;un p indique une varible ayant le role de parametre
;un u indique une varible utilis�e en interne
;---------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; envoi de donnees sur port spi ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;p: dataout
;u: temp
writeSPI:
	PUSH A
	LD	A,dataout
	LD	SPIDR,A	;ecriture de la donn�e
boucle_wait_spi:
	LD	A,SPISR	;wait for conversion completed
	AND A,#128
	CP	A,#0
	JREQ boucle_wait_spi
	LD	A,SPISR
	LD	temp,A
	LD	A,SPIDR
	LD	temp,A
	POP A
	RET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; envoi de cmd sur port spi ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;p: dataout
writeCmd:
	PUSH	A 
	Mand PBDR, #$FB
	Mand PBDR, #$DF
	CALL writeSPI
	Mor PBDR, #$20
	POP A
	RET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; envoi de data sur port spi ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;p: dataout
writeData:
	PUSH	A 
	Mor PBDR, #$04
	Mand PBDR, #$DF
	CALL writeSPI
	Mor PBDR, #$20
	POP A
	RET



;;;;;;;;;;;;;;;;;;;;;;;;
; execute liste de cmd ;
;;;;;;;;;;;;;;;;;;;;;;;;

;partie faisant la lecture dans A depuis la bonne source indiquee par Y � l'index X
read_src:
	CP	Y,#1
	JREQ	read_from_rcmd1
	CP	Y,#2
	JREQ	read_from_rcmd2
	CP	Y,#3
	JREQ	read_from_rcmd3
read_from_rcmd1:
	LD	A,(Rcmd1,X)
	INC	X
	RET
read_from_rcmd2:
	LD	A,(Rcmd2red,X)
	INC	X
	RET
read_from_rcmd3:
	LD	A,(Rcmd3,X)
	INC	X
	RET

;plusieurs points d'entr�es pour le meme sous programme, afin de choisir la bonne source
cmdList1:
	PUSH	Y
	PUSH	X
	PUSH	A
	
	LD Y,#1
	CLR	X
	LD	A,(Rcmd1,X)
	LD	numCmd,A	;Number of commands to follow
	INC	X
	JP while_num_cmd

cmdList2:
	PUSH	Y
	PUSH	X
	PUSH	A
	
	LD Y,#2
	CLR	X
	LD	A,(Rcmd2red,X)
	LD	numCmd,A	;Number of commands to follow
	INC	X
	JP while_num_cmd

cmdList3:
	PUSH	Y
	PUSH	X
	PUSH	A
	
	LD Y,#3
	CLR	X
	LD	A,(Rcmd3,X)
	LD	numCmd,A	;Number of commands to follow
	INC	X
	JP while_num_cmd

while_num_cmd:
	;for each cmd
	LD	A,numCmd
	CP	A,#0
	JREQ end_while_num_cmd
	DEC	numCmd
	
	CALL read_src	;Read, issue command
	LD	dataout,A
	CALL writeCmd
	
	CALL read_src	;Number of args to follow
	LD	numArg,A

	AND	A,#DELAY	;If hibit set, delay follows args
	LD	ms,A
	
	;Mask out delay bit
	Mand numArg, #$7F	;numArg&= DELAY EQU $80
	
while_num_arg:
	LD	A,numArg	;For each argument...
	CP	A,#0
	JREQ	end_while_num_arg
	DEC	numArg
	
	CALL read_src	;Read, issue argument
	LD	dataout,A
	CALL writeData
	JP while_num_arg
end_while_num_arg:
	
	LD	A,ms
	CP	A,#0
	JREQ while_num_cmd
	
	CALL read_src	;Read post-command delay time (ms)
	LD	ms,A
	
	CP	A,#255
	JRNE skip_ms_eq_255
	CALL wait500ms	;If 255, delay for 500 ms
	JP while_num_cmd
	
skip_ms_eq_255:
	LD	A,ms
	LD	waitTime,A
	CALL	wait
	JP while_num_cmd
	
end_while_num_cmd:
	POP	A
	POP	X
	POP	Y
	RET

;;;;;;;;;;;;;;;;;;;;;;;;
; initialisation ecran ;
;;;;;;;;;;;;;;;;;;;;;;;;
initTFT:
	PUSH A
	
	Mor	PBDR, #$10
	Mand	PBDR, #$DF
	CALL wait500ms
	
	Mand	PBDR, #$EF
	CALL wait500ms
	
	Mor PBDR, #$10
	CALL wait500ms
	
	Mor	PBDR, #$20
	
	CALL cmdList1
	
	CALL cmdList2
	
	CALL cmdList3
	
	LD	A,#ST7735_MADCTL
	LD	dataout,A
	CALL	writeCmd
	
	LD	A,#$C0
	LD	dataout,A
	CALL	writeData
	
	
	POP A
	RET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; select a window to write pixel ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;x0win	DS.B	1;p
;y0win	DS.B	1;p
;x1win	DS.B	1;p
;y1win	DS.B	1;p
setAddrWindow:
	PUSH	A
	
	LD A,#ST7735_CASET
	LD dataout,A
	CALL writeCmd
	
	LD A,#$00
	LD dataout,A
	CALL writeData
	
	LD A,x0win
	LD dataout,A
	CALL writeData
	
	LD A,#$00
	LD dataout,A
	CALL writeData
	
	LD A,x1win
	LD dataout,A
	CALL writeData
	
	
	LD A,#ST7735_RASET
	LD dataout,A
	CALL writeCmd
	
	LD A,#$00
	LD dataout,A
	CALL writeData
	
	LD A,y0win
	LD dataout,A
	CALL writeData
	
	LD A,#$00
	LD dataout,A
	CALL writeData
	
	LD A,y1win
	LD dataout,A
	CALL writeData
	
	
	LD A,#ST7735_RAMWR
	LD dataout,A
	CALL writeCmd
	
	POP	A
	RET
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fill a rectangle with a color ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;x0win	DS.B	1;p
;y0win	DS.B	1;p
;x1win	DS.B	1;u
;y1win	DS.B	1;u
;colorMSB;p
;colorLSB;p
;width;p
;height;p
fillRectTFT:
	PUSH	A
	PUSH	X
	PUSH	Y
	
	;Les tests ont �t�s retir�s afin de gagner en perfomance.
	;De plus, si on d�borde de l'�cran, ce dernier ne bugge pas,
	;il g�re la situation correctement tout seul.
	
	LD	A,x0win
	ADD	A,width
	DEC A
	LD	x1win,A
	
	LD	A,y0win
	ADD	A,height
	DEC A
	LD	y1win,A
	
	CALL setAddrWindow ;select window 
	
	Mor	PBDR, #$04
	Mand	PBDR, #$DF

	LD	Y,height

;for(y=h; y>0; y--)
fill_rect_for_y:
	CP	Y,#0
	JRULE	end_fill_rect_for_y

	LD	X,width

;for(x=w; x>0; x--)
fill_rect_for_x:
	CP	X,#0
	JRULE	end_fill_rect_for_x
	
	;write pixel in the window
	LD A,colorMSB
	LD dataout,A
	CALL writeSPI
	LD A,colorLSB
	LD dataout,A
	CALL writeSPI
	
	DEC X
	JP	fill_rect_for_x
	
end_fill_rect_for_x:
	DEC	Y
	JP	fill_rect_for_y
	
end_fill_rect_for_y:
	Mor PBDR, #$20
	
	POP	Y
	POP	X
	POP	A
	RET
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fill entire screen with a color ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;x0win	DS.B	1;u
;y0win	DS.B	1;u
;width	DS.B	1;u
;height	DS.B	1;u
;colorMSB;p
;colorLSB;p
fillScreenTFT:
	PUSH	A
	
	LD	A,#0
	LD	x0win,A
	LD	A,#0
	LD	y0win,A
	LD	A,#ST7735_TFTWIDTH
	LD	width,A
	LD	A,#ST7735_TFTHEIGHT_18
	LD	height,A
	CALL	fillRectTFT
	
	POP	A
	RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; draw colored pixel on screen ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;x0win	DS.B	1;p
;y0win	DS.B	1;p
;colorMSB;p
;colorLSB;p
drawPixel:
	PUSH	A
	
	LD	A,x0win
	INC A
	LD	x1win,A
	
	LD	A,y0win
	INC A
	LD	y1win,A
	
	CALL setAddrWindow

	Mor	PBDR, #$04
	Mand	PBDR, #$DF
	
	LD A,colorMSB
	LD dataout,A
	CALL writeSPI
	LD A,colorLSB
	LD dataout,A
	CALL writeSPI
	
	Mor PBDR, #$20
	
	POP	A
	RET




;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;---                  Fonctions personnelles                         ---;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; choose sprite to be displayed ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;numSprite;p
;sprite;u
setSprite:
	PUSH	A
	PUSH	X
	PUSH	Y
	
	LD	X,numSprite
	LD	A,(tabSprite,X)	;chargement MSB adresse du spite
	
	LD	Y,#0
	LD	(sprite,Y),A	;ecriture MSB adresse du spite
	
	INC	X
	LD	A,(tabSprite,X)	;chargement LSB adresse du spite
	
	INC	Y
	LD	(sprite,Y),A	;ecriture LSB adresse du spite
	
	POP	Y
	POP	X
	POP	A
	RET

;----------------------------------------------------;
;-                setPalete1                      -;
;----------------------------------------------------;
;palette normalle
setPalet1:
	;black
	LD A,#$0
	LD color1MSB,A
	LD color1LSB,A

	;gray
	LD A,#$84
	LD color2MSB,A
	LD A,#$10
	LD color2LSB,A

	;white
	LD A,#$FF
	LD color3MSB,A
	LD color3LSB,A

	;red
	LD A,#$F8
	LD color4MSB,A
	LD A,#$00
	LD color4LSB,A
	
	RET



;----------------------------------------------------;
;-                setPalete2                      -;
;----------------------------------------------------;
;palette blue screen of death
setPalet2:
	;blue 31 103 177 -> 4 26 44
	LD A,#$43
	LD color4MSB,A
	LD A,#$3C
	LD color4LSB,A
	
	RET



;----------------------------------------------------;
;-                setPalete3                      -;
;----------------------------------------------------;
;palette t�te chuck norris
setPalet3:
	;black
	LD A,#$0
	LD color1MSB,A
	LD color1LSB,A

	;marron fonc� 96 41 0 -> 12 10 0
	LD A,#$61
	LD color2MSB,A
	LD A,#$40
	LD color2LSB,A

	;marron clair 164 104 50 -> 20 26 6
	LD A,#$A3
	LD color3MSB,A
	LD A,#$46
	LD color3LSB,A

	;beige 243 211 162 -> 30 53 20
	LD A,#$F6
	LD color4MSB,A
	LD A,#$B4
	LD color4LSB,A
	
	RET
	
	
;----------------------------------------------------;
;-                setPalete4                      -;
;----------------------------------------------------;
;palette kimono chuck norris, avec couleur al�atoire du kimono
setPalet4:
	;black
	LD A,#$0
	LD color1MSB,A
	LD color1LSB,A

	;bleu 68 162 255 -> 9 41 31

	;:: Switch(LTCNTR)
		ld a,LTCNTR
		cpl a
		and a,#%00000011
		;:: case 0 :
		cp a,#0
		jrne setPalet4S1
			LD A,#$FA
			LD color2MSB,A
			LD A,#$08
			LD color2LSB,A
			jp setPalet4EndSwitch
setPalet4S1
		;:: case 1 :
		cp a,#1
		jrne setPalet4S2
			LD A,#$4D
			LD color2MSB,A
			LD A,#$3F
			LD color2LSB,A
			jp setPalet4EndSwitch
setPalet4S2
		;:: case 2 :
		cp a,#2
		jrne setPalet4S3
			LD A,#$FA
			LD color2MSB,A
			LD A,#$00
			LD color2LSB,A
			jp setPalet4EndSwitch
setPalet4S3
		;:: default :
			LD A,#$3B
			LD color2MSB,A
			LD A,#$83
			LD color2LSB,A
setPalet4EndSwitch

	;marron fonc� 96 41 0 -> 12 10 0
	LD A,#$61
	LD color3MSB,A
	LD A,#$40
	LD color3LSB,A

	;beige 243 211 162 -> 30 53 20
	LD A,#$F6
	LD color4MSB,A
	LD A,#$B4
	LD color4LSB,A
	
	RET


;----------------------------------------------------;
;-    decompress a picture / draw a sprite          -;
;----------------------------------------------------;
;Fonction de d�compression de sprite.
;On utilise directement le format de l'image pour dessiner � l'�cran, ce qui �vite de perdre de la ressource � d�compresser l'image avant affichage.
; p: sprite
; p: dspCoef
; p: dspOX
; p: dspOY

;add var sprite, dspX, dspY, dspOX, dspOY, dspCoef

dspSprite:
	push a
	push x
	push y

	ld a,dsp0X
	ld x0win,a
	ld a,dsp0Y
	ld y0win,a
	ld y,#2

boucl_dsp_title
	;tant qu'on a pas affich� toutes les lignes de l'image :
	;:: while(y0win - dspOY < sprite[1] * dspCoef) do
	ld  x,#1
	ld x,([sprite.w],x)
	ld a,dspCoef
	mul x,a
	ld x,a
	ld a,y0win
	sub a,dsp0Y
	ld temp,x
	cp a,temp
	jruge end_boucl_dsp_title

	;--- gestion de la couleur du rectangle
		;:: switch(sprite[y] & %11000000)
		ld a,([sprite.w],y)
		and a,#%11000000
			;:: case 0:
				cp a,#0
				jrne dsp_sprite_col2
				ld a,color1MSB
				ld colorMSB,a
				ld a,color1LSB
				ld colorLSB,a
				jp end_dsp_sprite_col	;: break
dsp_sprite_col2
			;:: case: 64
				cp a,#64
				jrne dsp_sprite_col3
				ld a,color2MSB
				ld colorMSB,a
				ld a,color2LSB
				ld colorLSB,a
				jp end_dsp_sprite_col 	;: break
dsp_sprite_col3
			;:: case: 128
				cp a,#128
				jrne dsp_sprite_col4
				ld a,color3MSB
				ld colorMSB,a
				ld a,color3LSB
				ld colorLSB,a
				jp end_dsp_sprite_col 	;: break
dsp_sprite_col4
			;:: default:
				ld a,color4MSB
				ld colorMSB,a
				ld a,color4LSB
				ld colorLSB,a
		;:: end switch
end_dsp_sprite_col

		
		;--- gestion de la largeur et de la hauteur du rectangle
		ld a,dspCoef
		ld height,a 				;: height = dspCoef
		ld a,([sprite.w],y)
		and a,#%00111111
		inc a
		ld x,a
		ld a,dspCoef
		mul x,a
		ld width,a 					;: width = ((sprite[y] & %00111111) + 1) * dspCoef


		;--- dessin du rectangle
		call fillRectTFT

		ld a,x0win
		add a,width
		ld x0win,a 					;: x0win += width

		inc y 						;: y++

		;Si on arrive au bout de la ligne actuelle, on passe � la suivante
		;:: if(x0win - dspOX >= sprite[0] * dspCoef) then
		ld x,[sprite.w]
		ld a,dspCoef
		mul x,a
		ld x,a
		ld a,x0win
		sub a,dsp0X
		ld temp,x
		cp a,temp
		jrult boucl_dsp_title
		;jrult dsp_end_test_line

			ld a,dsp0X
			ld x0win,a 			;: x0win = dspOX
			ld a,y0win
			add a,dspCoef
			ld y0win,a 			;: y0win += dspCoef
			;jp boucl_dsp_title	;: goto boucl_dsp_title

		;:: end if
;dsp_end_test_line


		;--- retour � la condition de la boucle
		jp boucl_dsp_title
	;:: end while
end_boucl_dsp_title

	pop y
	pop x
	pop a
	ret


;;;;;;;;;;;;;;;;;;;;
; display a number ;
;;;;;;;;;;;;;;;;;;;;
;numSprite;u
;scoreD;p
;scoreU;p
;dspCoef DS.B;p
;numX;p
;numY;p
;dsp0X;u
;dsp0Y;u
dspNum:
	PUSH	A
	PUSH	X
	
	;dizaine
	;Etant donn� que les chiffre on �t� plac�s en tout d�but du tableau de sprite
	;et que les indices vont de 2 en 2, il suffit de multiplier par 2 le chiffre
	;que l'on veut afficher pour obtenir son index.
	LD	A,scoreD
	LD	X,#2
	MUL	X,A
	LD	numSprite,A
	CALL setSprite
	
	LD	A,numX
	LD	dsp0X,A
	LD	A,numY
	LD	dsp0Y,A
	CALL	dspSprite
	
	;unitee
	LD	A,scoreU
	LD	X,#2
	MUL	X,A
	LD	numSprite,A
	CALL setSprite
	
	;ces calculs servent � d�caller le chiffre des unit�es
	;par rapport � celui des dizaines.
	LD	A,dspCoef
	LD	X,#4
	MUL	X,A
	PUSH	A
	
	LD	A,dspCoef
	LD	X,#5
	MUL	X,A
	PUSH	A
	
	LD	A,numX
	POP	X
	LD	temp,X
	ADD	A,temp
	POP	X
	LD	temp,X
	ADD	A,temp
	
	LD	dsp0X,A
	LD	X,numY
	LD	dsp0Y,X
	CALL	dspSprite
	
	
	POP	X
	POP	A
	RET


;----------------------------------------------------;
;-              clear screen zoom in                -;
;----------------------------------------------------;
;d�ssine un rectangle qui grossit du centre vers l'exterieur de l'ecran
;en tracant plusieures lignes vertcales et horizontales (de taille croissante)
;du centre vers les bords de l'�cran.
clrScreenZoomIn:
	PUSH A
	PUSH Y
	PUSH X
	
	;x = 64 //64 = 128/2
	LD	X,#64
while_zoom_in
		CP	X,#255; 255 ~= -1 (car entier non sign�)
			JREQ	end_while_zoom_in
		;drawRect en haut
		LD	x0win,X
		LD	y0win,X
		LD	A,#128
		LD	temp,X
		SUB	A,temp
		SUB	A,temp
		LD	width,A
		LD	A,#1
		LD	height,A
		CALL	fillRectTFT
		;drawRect en bas
		LD	A,#160
		LD	temp,X
		SUB	A,temp
		LD	y0win,A
		CALL	fillRectTFT
		;drawRect � gauche
		LD	y0win,X
		LD	A,#1
		LD	width,A
		LD	A,#160
		LD	temp,X
		SUB	A,temp
		SUB	A,temp
		LD	height,A
		CALL	fillRectTFT
		;drawRect � droite
		LD	A,#127
		LD	temp,X
		SUB	A,temp
		LD	x0win,A
		CALL	fillRectTFT
		;x++
		DEC	X
		JP	while_zoom_in
	;end
end_while_zoom_in	

	POP	X
	POP	Y
	POP	A
	RET
	

	
;************************************************************************

	END

;************************************************************************