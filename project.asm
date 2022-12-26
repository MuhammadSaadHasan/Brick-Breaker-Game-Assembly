.model small
.stack 100h
.data


score db 0

matrix db "HHH0000000000000000000000000000000000000000000000000000000000000GBRYGBRYGBRYGBRYGBR00BYRGBYRGBYRGBYRGBYR00GBRYGBRYGBRYGBRYGBR00BRYGBRYGBRYGBRYGBRY0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
matrix2 db "HHH0000000000000000000000000000000000000000000000000000000000000GBRFGBRFGBRFGBRFGBR00BYRFBYRFBYRFBYRFBYR00GBRFGBRFGBRFGBRFGBR00BRYFBRYFBRYFBRYFBRY0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
matrix3 db "HHH0000000000000000000000000000000000000000000000000000000000000GBRFGBRFGBRFGBRFGBR00BYRFBYRFBYRFBYRFSYR00GBRFGBRFGBRFGBRFGBR00BRYFBRYFBRYFBRYFBRY0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"


tempmatrix db "HHH0000000000000000000000000000000000000000000000000000000000000GBRYGBRYGBRYGBRYGBR00BYRGBYRGBYRGBYRGBYR00GBRYGBRYGBRYGBRYGBR00BRYGBRYGBRYGBRYGBRY0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"

numberOfHitsMatrix db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"


heartmatrix db "000000000000000000000000000000000000000000000000HH00000HH00000HHHH000HHHH000HHHHHH0HHHHHH00HHHHHHHHHHHHH000HHHHHHHHHHH00000HHHHHHHHH0000000HHHHHHH000000000HHHHH00000000000HHH0000000000000H0000000000000000000000000000000000000"      
ballmatrix db "00HHHH000HHHHHH00HHHHHH00HHHHHH000HHHH00"

paddlechanged db 0

tempBX dw 0

level db 1
numberOfBricksBroken db 0

livesleft dw 2
                            
heartrow db 0
heartcol db 0
heartcount dw 0

paddlecolor db 3

rem db 0

QuotientRow db 0
QuotientCol db 0

brickCX dw 0
brickDX dw 0


Hitbrickleft db 0
Hitbrickright db 0
Hitbricktop db 0
Hitbrickbottom db 0

side db 0

bricktoplocation dw 0
brickleftlocation dw 0
brickrightlocation dw 0
brickbottomlocation dw 0

balltoplocation dw 0
ballleftlocation dw 0
ballrightlocation dw 0
ballbottomlocation dw 0


ballcolor db 15

hitmade db 1


paddlestart dw 120
paddleend dw 180


UPleft db 1
UPright db 0
DOWNright db 0
DOWNleft db 0

ballrow dw 0
ballcol dw 0
ballcount dw 0
balllocationcx dw 130
balllocationdx dw 160

paddle1 dw 236
paddle2 dw 240

temp dw 0
col db 0
row db 0
tempDX dw 0
tempCX dw 0
colornum db 0
count dw 0
;........MENUE PORTION................

str1 db "WELCOME TO BRICK BREAKER$"
textrow db 0 
textcol db 0

	str2 db "PLEASE ENTER YOUR NAME $"
	username db 50 dup ("$")
	str3 db "Welcome back $"
	str4 db "   PLEASE PRESS ENTER TO CONTINUE $"
	str5 db "INSTRUCTIONS: $"
	str6 db "1. Use left and right key to move paddle around $"

	str7 db "2. Do not let the ball fall down $"  
	
	str8 db "3. Break as many bricks as you can $"
      nameL dw 0
      str12 db "THANK YOU FOR PLAYING $"
      

	str13 db " PRESS ENTER TO EXIT $"
	str14 db "     PRESS R TO RESTART THE GAME $"
     strP db " GAME IS PAUSED $"
     strS db "Score $"

bin2 db  "kingsv.wav",0
sound_index dw 0


;........................
.code

mov ax, @data
mov ds, ax

jmp main

movement proc


        cmp balllocationcx, 0
        jne skip1
                cmp UPleft, 0
                jne end5
                        cmp UPright, 0
                        jne end5
                                cmp DOWNleft,1
                                jne end5
                                        cmp DOWNright, 0
                                        jne end5
                                                mov UPleft, 0
                                                mov UPright, 0
                                                mov DOWNleft, 0
                                                mov DOWNright, 1
                end5:


                cmp UPleft, 1
                jne end6
                        cmp UPright, 0
                        jne end6
                                cmp DOWNleft,0
                                jne end6
                                        cmp DOWNright, 0
                                        jne end6
                                                mov UPleft, 0
                                                mov UPright, 1
                                                mov DOWNleft, 0
                                                mov DOWNright, 0

                end6:


        skip1:

        cmp balllocationcx, 315
        jne skip2
                cmp UPleft, 0
                jne end7
                        cmp UPright, 0
                        jne end7
                                cmp DOWNleft,0
                                jne end7
                                        cmp DOWNright, 1
                                        jne end7
                                                mov UPleft, 0
                                                mov UPright, 0
                                                mov DOWNleft, 1
                                                mov DOWNright, 0
                end7:


                cmp UPleft, 0
                jne end8
                        cmp UPright, 1
                        jne end8
                                cmp DOWNleft,0
                                jne end8
                                        cmp DOWNright, 0
                                        jne end8
                                                mov UPleft, 1
                                                mov UPright, 0
                                                mov DOWNleft, 0
                                                mov DOWNright, 0

                end8:


        skip2:






       cmp balllocationdx, 187
       jne skip3
               cmp UPleft, 0
               jne end9
                       cmp UPright, 0
                       jne end9
                               cmp DOWNleft,1
                               jne end9
                                       cmp DOWNright, 0
                                       jne end9
                                               mov UPleft, 1
                                               mov UPright, 0
                                               mov DOWNleft, 0
                                               mov DOWNright, 0
               end9:
               cmp UPleft, 0
               jne end10
                       cmp UPright, 0
                       jne end10
                               cmp DOWNleft,0
                               jne end10
                                       cmp DOWNright, 1
                                       jne end10
                                               mov UPleft, 0
                                               mov UPright, 1
                                               mov DOWNleft, 0
                                               mov DOWNright, 0
               end10:

                mov ax, paddlestart
                mov bx, paddleend
                cmp balllocationcx, ax
                jnb p1
                        mov bx, livesleft
                        mov matrix[bx], '0'
                        mov row, 0
                        mov ax, livesleft
                        mov col, al
                        mov dl, 0
                        call drawbrick
                        dec livesleft


                p1:

                cmp balllocationcx, bx
                jng p2
                        mov bx, livesleft
                        mov matrix[bx], '0'
                        mov row, 0
                        mov ax, livesleft
                        mov col, al
                        mov dl, 0
                        call drawbrick
                        dec livesleft


                p2:






       skip3:


       cmp balllocationdx, 30
       jne skip4
               cmp UPleft, 1
               jne end11
                       cmp UPright, 0
                       jne end11
                               cmp DOWNleft,0
                               jne end11
                                       cmp DOWNright, 0
                                       jne end11
                                               mov UPleft, 0
                                               mov UPright, 0
                                               mov DOWNleft, 1
                                               mov DOWNright, 0
               end11:
               cmp UPleft, 0
               jne end12
                       cmp UPright, 1
                       jne end12
                               cmp DOWNleft,0
                               jne end12
                                       cmp DOWNright, 0
                                       jne end12
                                               mov UPleft, 0
                                               mov UPright, 0
                                               mov DOWNleft, 0
                                               mov DOWNright, 1
               end12:


               
                        






        skip4:



        cmp UPleft, 1
        jne end1
                cmp UPright, 0
                jne end1
                        cmp DOWNleft,0
                        jne end1
                                cmp DOWNright, 0
                                jne end1
                                        dec balllocationcx
                                        dec balllocationdx
        end1:


        cmp UPleft, 0
        jne end2
                cmp UPright, 0
                jne end2
                        cmp DOWNleft,1
                        jne end2
                                cmp DOWNright, 0
                                jne end2
                                        dec balllocationcx
                                        inc balllocationdx

        end2:

        cmp UPleft, 0
        jne end3
                cmp UPright, 0
                jne end3
                        cmp DOWNleft,0
                        jne end3
                                cmp DOWNright, 1
                                jne end3
                                        inc balllocationcx
                                        inc balllocationdx

        end3:

        cmp UPleft, 0
        jne end4
                cmp UPright, 1
                jne end4
                        cmp DOWNleft,0
                        jne end4
                                cmp DOWNright, 0
                                jne end4
                                        inc balllocationcx
                                        dec balllocationdx

        end4:


       mov ax, balllocationcx
       mov bl, 15
       div bl
       mov QuotientCol, al
       mov ax, balllocationdx
       mov bl, 15
       div bl
       mov QuotientRow, al
       mov al, QuotientRow
       mov bl, 19
       mul bl
       mov bl, QuotientCol
       mov bh, 0
       add ax, bx
       mov bx, ax

        
        mov dx, balllocationdx
        mov cx, balllocationcx 


        mov balltoplocation, dx
        mov ballbottomlocation, dx
        ;add ballbottomlocation, 8

        mov ballleftlocation, cx
        mov ballrightlocation, cx
        ;add ballrightlocation, 7
        

        mov ax, balllocationcx
        mov bl, 15
        div bl
        mov QuotientCol, al

        mov ax, balllocationdx
        mov bl, 15
        div bl
        mov QuotientRow, al

        mov al, QuotientRow
        mov bl, 21
        mul bl

        mov bl, QuotientCol
        mov bh, 0
        add ax, bx

        mov bx, ax


        mov tempBX, bx

        cmp matrix[bx], 48
        je r4

                cmp level, 1
                jne g1
                        mov matrix[bx], 48
                        mov dl, 0
                        mov al, QuotientRow
                        mov row, al
                        mov al, QuotientCol
                        mov col, al
                        call drawbrick
                        inc numberOfBricksBroken  
                        add score, 10
                        jmp skip5
                g1:

                cmp level, 2
                jne g2
                        mov bx, tempBX
                        cmp numberOfHitsMatrix[bx], '2'
                        jb u
                                cmp matrix[bx], 'F'
                                je r1
                                        mov bx, tempBX
                                        cmp matrix[bx], 'S'
                                        jne d1
                                                add score, 20
                                                jmp j44
                                        d1:
                                                add score, 50
                                        j44:
                                        mov matrix[bx], 48
                                        mov dl, 0
                                        mov al, QuotientRow
                                        mov row, al
                                        mov al, QuotientCol
                                        mov col, al
                                        call drawbrick
                                        inc numberOfBricksBroken  
                                        jmp g2
                                r1:
                        u:
                        
                        mov bx, tempBX
                        mov al, QuotientRow
                        mov row, al
                        mov al, QuotientCol
                        mov col, al
                        
                        mov dl, matrix[bx]
                        cmp dl, 66
                        jne nextch1
                                mov dl, 3
                                call drawbrick
                                jmp jEnd
                        nextch1:

                        cmp dl, 71
                        jne nextch2
                                mov dl, 2
                                call drawbrick
                                jmp jEnd
                        nextch2:

                        cmp dl, 89
                        jne nextch3
                                mov dl, 7
                                call drawbrick
                                jmp jEnd
                        nextch3:

                        cmp dl, 82
                        jne nextch4
                                mov dl, 4
                                call drawbrick
                                jmp jEnd
                        nextch4:

                        cmp dl, 48
                        jne nextch5
                                mov dl, 0
                                call drawbrick
                                jmp jEnd
                        nextch5:


                        cmp dl, 'F'
                        jne nextch99
                                mov dl, 15
                                call drawbrick
                                jmp jEnd
                        nextch99:

                        cmp dl, 'S'
                        jne nextch55
                                mov dl, 11
                                call drawbrick
                                jmp jEnd
                        nextch55:


                        jEnd:
                        mov bx, tempBX

                        mov al, numberOfHitsMatrix[bx]
                        inc al
                        mov numberOfHitsMatrix[bx], al

                        cmp numberOfHitsMatrix[bx], '0'
                        jne f1
                                mov numberOfHitsMatrix[bx], '1'
                        f1:

                        cmp numberOfHitsMatrix[bx], '1'
                        jne f2
                                mov numberOfHitsMatrix[bx], '2'
                        f2:

                g2:
                   
                   
                cmp level, 3
                jne g3
                        mov bx, tempBX
                        cmp numberOfHitsMatrix[bx], '3'
                        jb u1
                                mov bx, tempBX
                                mov matrix[bx], 48
                                mov dl, 0
                                mov al, QuotientRow
                                mov row, al
                                mov al, QuotientCol
                                mov col, al
                                call drawbrick
                                inc numberOfBricksBroken  
                                jmp g3
                        u1:
                        
                        mov bx, tempBX
                        mov al, QuotientRow
                        mov row, al
                        mov al, QuotientCol
                        mov col, al
                        
                        mov dl, matrix[bx]
                        cmp dl, 66
                        jne nextch6
                                mov dl, 3
                                call drawbrick
                                jmp jEnd1
                        nextch6:

                        cmp dl, 71
                        jne nextch7
                                mov dl, 2
                                call drawbrick
                                jmp jEnd1
                        nextch7:

                        cmp dl, 89
                        jne nextch8
                                mov dl, 7
                                call drawbrick
                                jmp jEnd1
                        nextch8:

                        cmp dl, 82
                        jne nextch9
                                mov dl, 4
                                call drawbrick
                                jmp jEnd1
                        nextch9:

                        cmp dl, 48
                        jne nextch10
                                mov dl, 0
                                call drawbrick
                                jmp jEnd1
                        nextch10:

                        jEnd1:
                 
                        mov bx, tempBX

                        mov al, numberOfHitsMatrix[bx]
                        inc al
                        mov numberOfHitsMatrix[bx], al

                        cmp numberOfHitsMatrix[bx], '0'
                        jne f11
                                mov numberOfHitsMatrix[bx], '1'
                        f11:

                        cmp numberOfHitsMatrix[bx], '1'
                        jne f22
                                mov numberOfHitsMatrix[bx], '2'
                        f22:

                        cmp numberOfHitsMatrix[bx], '2'
                        jne f33
                                mov numberOfHitsMatrix[bx], '3'
                        f33:

                g3:   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                                                                     ;should be 76 total
                

                skip5:
                mov cx, brickCX
                mov dx, brickDX

                mov bricktoplocation, dx
                mov brickbottomlocation, dx
                add brickbottomlocation, 14

                mov brickleftlocation, cx

                mov brickrightlocation, cx
                add brickrightlocation, 14


                               
                ;;;;;;;;;;;;;;;THIS
                mov ax, bricktoplocation
                mov bx, ballbottomlocation
                cmp ax, bx
                jne w1
                        
                        cmp UPleft, 0
                        jne e1
                                cmp UPright, 0
                                jne e1
                                        cmp DOWNleft,1
                                        jne e1
                                                cmp DOWNright, 0
                                                jne e1
                                                        mov UPleft, 1
                                                        mov UPright, 0
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 0
                                                        jmp r4
                        e1:

                        cmp UPleft, 0
                        jne e2
                                cmp UPright, 0
                                jne e2
                                        cmp DOWNleft,0
                                        jne e2
                                                cmp DOWNright, 1
                                                jne e2
                                                        mov UPleft, 0
                                                        mov UPright, 1
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 0

                                                        jmp r4
                        e2:

                w1:


                mov ax, brickbottomlocation
                cmp ax, balltoplocation
                jne w2
                        cmp UPleft, 0
                        jne e3
                                cmp UPright, 1
                                jne e3
                                        cmp DOWNleft,0
                                        jne e3
                                                cmp DOWNright, 0
                                                jne e3
                                                        mov UPleft, 0
                                                        mov UPright, 0
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 1
                                                        jmp r4
                        e3:

                        cmp UPleft, 1
                        jne e4
                                cmp UPright, 0
                                jne e4
                                        cmp DOWNleft,0
                                        jne e4
                                                cmp DOWNright, 0
                                                jne e4
                                                        mov UPleft, 0
                                                        mov UPright, 0
                                                        mov DOWNleft, 1
                                                        mov DOWNright, 0
                                                        jmp r4
                         e4:
                
                w2:

                ;;;;;;;;;;;THIS
                mov ax, brickleftlocation
                cmp ax, ballrightlocation
                jne w3
                        cmp UPleft, 0
                        jne e5
                                cmp UPright, 1
                                jne e5
                                        cmp DOWNleft,0
                                        jne e5
                                                cmp DOWNright, 0
                                                jne e5
                                                        mov UPleft, 1
                                                        mov UPright, 0
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 0

                                                        jmp r4
                        e5:
                       
                        cmp UPleft, 0
                        jne e6
                                cmp UPright, 0
                                jne e6
                                        cmp DOWNleft,0
                                        jne e6
                                                cmp DOWNright, 1
                                                jne e6
                                                        mov UPleft, 0
                                                        mov UPright, 0
                                                        mov DOWNleft, 1
                                                        mov DOWNright, 0

                                                        jmp r4
                        e6:
              
                w3:

                mov ax, brickrightlocation
                cmp ax, ballleftlocation
                jne w4
                        cmp UPleft, 1
                        jne e7
                                cmp UPright, 0
                                jne e7
                                        cmp DOWNleft,0
                                        jne e7
                                                cmp DOWNright, 0
                                                jne e7
                                                        mov UPleft, 0
                                                        mov UPright, 1
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 0
                                                        jmp r4
                        e7:  

                        cmp UPleft, 0
                        jne e8
                                cmp UPright, 0
                                jne e8
                                        cmp DOWNleft,1
                                        jne e8
                                                cmp DOWNright, 0
                                                jne e8
                                                        mov UPleft, 0
                                                        mov UPright, 0
                                                        mov DOWNleft, 0
                                                        mov DOWNright, 1
                        e8:
                
                w4:

                









                


        r4:
        
        ret
movement endp


drawheart proc

        mov tempCX, cx
        mov tempDX, dx

        	mov heartcount, 0
                mov heartrow, 0
                heartj1:

                        mov heartcol, 0
                        heartj2:

                                mov bx, heartcount
                                mov dh, heartmatrix[bx]
                                

                                mov al, 15
                                mov bl, col
                                mul bl
                                mov cx, ax

                                add cl, heartcol
                                mov dl, heartrow

                                cmp dh, 72
                                jne nextpixel
                                        mov ah, 0ch
                                        mov al, 12             ;number = color
                                        int 10h

                                nextpixel:



                               
                                mov bx, heartcount
                                inc bx
                                mov heartcount, bx
                                inc heartcol



                        cmp heartcol, 15
                        jne heartj2

                        inc heartrow
                cmp heartrow, 15
                jne heartj1




        ret
drawheart endp



drawpaddle proc

        mov ax, paddlestart
        mov tempCX, ax
        mov cx, paddlestart
        mov dx, 195

        drawrec:
                mov cx, tempCX
                mov ah, 0ch
                mov al, paddlecolor                                        ;number = color
                int 10h

                inc tempCX
                mov ax, tempCX
                cmp ax, paddleend
                jne drawrec

                inc dx

                mov ax, paddlestart
                mov tempCX, ax
                mov cx, paddlestart

                cmp dx, 200
                jne drawrec

drawpaddle endp





drawball proc
         mov tempCX, cx
         mov tempDX, dx
        	mov ballcount, 0
                mov ballrow, 0
                ballj1:
                        mov ballcol, 0
                        ballj2:

                                mov bx, ballcount
                                cmp ballmatrix[bx], 72
                                jne nextpixel
                                       mov cx, balllocationcx
                                       mov dx, balllocationdx

                                       add cx, ballrow
                                       add dx, ballcol

                                        mov ah, 0ch
                                        mov al, ballcolor           ;number = color
                                        int 10h

                                nextpixel:


                                inc ballcount
                                inc ballcol



                        cmp ballcol, 8
                        jne ballj2

                        inc ballrow
                cmp ballrow, 5
                jne ballj1

            mov cx, tempCX
            mov dx, tempDX


        ret




drawball endp





drawbrick proc

        ;pop dx
        mov colornum, dl

        mov al, 15
        mov bl, col
        mul bl
        mov cx, ax

        mov al, 15
        mov bl, row
        mul bl
        mov dx, ax


        mov tempCX, cx
        mov tempDX, dx

        mov brickCX, cx
        mov brickDX, dx
        
        mov bh, 0
        mov bl, 0
        drawline:
                
                inc cx          ;cx will be x axis and dx will be the y axis
                inc bh

                mov ah, 0ch
                mov al, colornum              ;number = color
                int 10h

                cmp bh, 15                   ;number of cols
                jne drawline

                inc bl
                inc dx
                mov cx, tempCX
                mov bh, 0
                
                cmp bl, 15                   ;number of rows
                jne drawline

        mov cx, tempCX
        mov dx, tempDX

        ret
drawbrick endp

;...............MENUEPROC.............................
TextPrint proc 
T:
	mov  dl,textCol   ;Column
	sub dl,cl
	mov  dh, textRow  ;Row
	mov  bh, 0    ;Display page
	mov  ah, 02h  ;SetCursorPosition
	int  10h
      
      mov  bh, 0    ;Display page
	mov  bl, 1110b  ;Color is red
	mov  al, [si]
	mov  ah, 0Eh  
	int  10h
	inc si
loop T
ret
TextPrint endp


;...........................................
;.....SOUND..............

;........SOUND PROC..................................

Sound proc

mov ah,0eh
mov al,'A'
int 10h
;...........................
L111:
mov dx,22ch ;.....DSP Command
mov al,10h
out dx,al
;...........................
mov si,[sound_index]; ....send byte audio
mov al,[bin2+si]
out dx,al
;...........................
mov cx,1000
delay:

loop delay

inc word ptr [sound_index]
cmp word ptr [sound_index],50000 
jb L111

ret
Sound endp
;....................................................



;.....SOUND..............









main proc

        mov ax, @data
        mov ds, ax
;....................MENUE1..................................

I1:

restart0:

;set video mode
mov ah,00h
mov al,10h
int 10h

	mov si,offset str1
	mov cx,lengthof str1
	sub cx,1
	mov textcol,45
	mov textrow,5

call TextPrint
;...........................................

      mov si,offset str2
      mov cx,lengthof str2
      sub cx,1
      mov textcol,45
      mov textrow,8

call TextPrint

;...........................................

;...........NAME INPUT......................
mov dx,0 ;.........counter

mov si,offset username
loop1:
mov ah,01
int 21h
mov [si],al
inc si
inc dx
cmp al,13
JNE loop1
mov nameL,dx

;..........................................



      mov si,offset str3
      mov cx,lengthof str3
      sub cx,1
      mov textcol,41
      mov textrow,11

      call TextPrint
;..........................................
      mov si,offset username
      mov cx,nameL
      sub cx,1
      mov textcol,37
      mov textrow,14 

      call TextPrint
;..........................................


      mov si,offset str4
      mov cx,lengthof str4
      sub cx,1
      mov textcol,50
      mov textrow,17 

      call TextPrint
;..........................................

;.......CONTINUE...........................

L1:
mov ah,01
int 21h
CMP al,13
JNE L1

;..........................................

;.............INSTRUCTION PAGE.............

I2:

mov ah,00h
mov al,10h
int 10h


      mov si,offset str5
      mov cx,lengthof str5
      sub cx,1
      mov textcol,45
      mov textrow,5

      call TextPrint

;................INSTRUCTION 1............................


      mov si,offset str6
      mov cx,lengthof str6
      sub cx,1
      mov textcol,60
      mov textrow,9

      call TextPrint

;................INSTRUCTION 2............................


      mov si,offset str7
      mov cx,lengthof str7
      sub cx,1
      mov textcol,45
      mov textrow,11

      call TextPrint

;................INSTRUCTION 3............................


      mov si,offset str8
      mov cx,lengthof str8
      sub cx,1
      mov textcol,47
      mov textrow,13

      call TextPrint
;.........................................................

;..........................................

;.......CONTINUE...........................

L2:
mov ah,01
int 21h
CMP al,13
JNE L2

;..........................................






;..........................................................
      

        mov ah, 00h		;Video mode
        mov al, 13h
        int 10h

        mov ah, 0ch		;drawing a pixel
        mov al, 0fh
        mov bh,0
;................SCORE BOARD............................


      mov si,offset strS
      mov cx,lengthof strS
      sub cx,1
      mov textcol,150
      mov textrow,10

      call TextPrint
;.........................................................


restart:
         mov paddlechanged, 0
        mov tempBX , 0
       ; mov level , 1
        mov numberOfBricksBroken , 0
       ; mov livesleft , 2         
        mov heartrow , 0
        mov heartcol , 0
        mov heartcount , 0
        mov paddlecolor , 3
        mov rem , 0
        mov QuotientRow , 0
        mov QuotientCol , 0
        mov brickCX , 0
        mov brickDX , 0
        mov Hitbrickleft , 0
        mov Hitbrickright , 0
        mov Hitbricktop , 0
        mov Hitbrickbottom , 0
        mov side , 0
        mov bricktoplocation , 0
        mov brickleftlocation , 0
        mov brickrightlocation , 0
        mov brickbottomlocation , 0
        mov balltoplocation , 0
        mov ballleftlocation , 0
        mov ballrightlocation , 0
        mov ballbottomlocation , 0
        mov ballcolor , 15
        mov hitmade , 1
        mov paddlestart , 120
        mov paddleend , 180
        mov UPleft , 1
        mov UPright , 0
        mov DOWNright , 0
        mov DOWNleft , 0
        mov ballrow , 0
        mov ballcol , 0
        mov ballcount , 0
        mov balllocationcx , 130
        mov balllocationdx , 160
        mov paddle1 , 236
        mov paddle2 , 240
        mov temp , 0
        mov col , 0
        mov row , 0
        mov tempDX , 0
        mov tempCX , 0
        mov colornum , 0
        mov count , 0
        



        start:

        mov count, 0
        mov row, 0
        j1:

                mov col, 0
                j2:

                        mov bx, count
                        mov dl, matrix[bx]
                        mov ah, row
                        mov al, col


                        cmp dl, 66
                        jne nextch1
                                mov dl, 9
                                call drawbrick
                                jmp jEnd
                        nextch1:

                        cmp dl, 71
                        jne nextch2
                                mov dl, 10
                                call drawbrick
                                jmp jEnd
                        nextch2:

                        cmp dl, 89
                        jne nextch3
                                mov dl, 14
                                call drawbrick
                                jmp jEnd
                        nextch3:

                        cmp dl, 82
                        jne nextch4
                                mov dl, 12
                                call drawbrick
                                jmp jEnd
                        nextch4:

                        cmp dl, 48
                        jne nextch5
                                mov dl, 0
                                call drawbrick
                                jmp jEnd
                        nextch5:


                        cmp dl, 72
                        jne nextch6
                                call drawheart
                                jmp jEnd
                        nextch6:

                        cmp dl, 'F'
                        jne nextch7
                                mov dl, 15
                                call drawbrick
                                jmp jEnd
                        nextch7:
                         
                        cmp dl, 'S'
                        jne nextch8
                                mov dl, 11
                                call drawbrick
                                jmp jEnd
                        nextch8:
                        
                        jEnd:

                        mov bx, count
                        inc bx
                        mov count, bx
                        inc col



                cmp col, 21
                jne j2

                inc row
        cmp row, 7
        jne j1

        call drawpaddle

        mov bx, 147
        mov cx, 100
        empty:
                mov matrix[bx], 48
                inc bx
        loop empty





        game:

                ;......test al,0 ;.............reset carry flag

                cmp matrix[0], '0'
                je final
        
                mov ballcolor, 15
                call drawball

                cmp level, 1
                jne t
                                        mov cx, 65000
                                        L99:
                                        loop L99
                t:
                cmp level, 2
                jne t2
                                        
                                        cmp paddlechanged, 0
                                        jne t1
                                                mov paddlecolor, 0
                                                call drawpaddle
                                                mov paddlestart, 130
                                                mov paddleend, 170
                                                mov paddlecolor, 3
                                                call drawpaddle
                                                mov paddlechanged, 1
                                                mov ballcolor, 0
                                                call drawball

                                                mov cx, 100000
                                                o:
                                                loop o

                                                mov balllocationcx, 130
                                                mov balllocationdx, 160

                                                
                                                mov UPleft, 1
                                                mov UPright, 0
                                                mov DOWNright, 0
                                                mov DOWNleft, 0

                                                ;mov cx, livesleft
                                                ;fixhearts:
                                                ;        mov bx, cx
                                                ;        mov matrix[bx], 'H'
                                                ;        
;
;
;
                                                ;loop fixhearts




                                                

                                        t1:

                                        mov cx, 45000
                                        L9:
                                        loop L9
                t2:
                cmp level, 3
                jne t3
                                        mov cx, 35000
                                        L10:
                                        loop L10

                t3:


                        
                mov ballcolor, 0
                call drawball

                call movement


                cmp numberOfBricksBroken, 76
                jne Q

                        cmp level, 3
                        je u
                                inc level
                        u:

                        mov numberOfBricksBroken, 0

                        mov bx, 65
                        redraw:
                                cmp level, 2
                                jne c1
                                        mov al, matrix2[bx]
                                c1:

                                cmp level, 3
                                jne c2
                                        mov al, matrix3[bx]
                                c2:

                                mov matrix[bx], al
                                inc bx
                        cmp bx, 144
                        jne redraw

                        jmp start
                Q:



;...................PADDLE MOVEMENT...............................................                          
                                  
mov ah,01
int 16h

jz notset
 
                                
 mov ah,00
 int 16h                                        
    



;..................BACK AND FORTH JUMPS......................

            cmp al,49 ;............... jump to main menue page
            je I1

            cmp al,50 ;............... jump to instruction page
            je I2

           cmp al,112
           je I3 ;............... jump to pause page
           
;.............................................................



                cmp paddlestart, 0
                je skip
                        cmp ah, 4Bh
                        jne next
                                mov paddlecolor, 0
                                call drawpaddle
                                sub paddlestart, 5
                                sub paddleend, 5
                                mov paddlecolor, 3
                                call drawpaddle
                        next:
                skip:

                cmp paddleend, 315
                je skip2
                        cmp ah, 4Dh
                        jne next2
                                mov paddlecolor, 0
                                call drawpaddle
                                add paddlestart, 5
                                add paddleend, 5
                                mov paddlecolor, 3
                                call drawpaddle
                        next2:
                                         


                skip2:


               notset:


;.................................................................................
             


            

        mov ah, 0
JMP game


     

;...........FINAL PAGE.....................

final:

mov ah,00h
mov al,10h
int 10h



;................INSTRUCTION 1............................


      mov si,offset str12
      mov cx,lengthof str12
      sub cx,1
      mov textcol,44
      mov textrow,9

      call TextPrint

;................INSTRUCTION 2............................


      mov si,offset str13
      mov cx,lengthof str13
      sub cx,1
      mov textcol,43
      mov textrow,11

      call TextPrint

;................INSTRUCTION 3............................


      mov si,offset str14
      mov cx,lengthof str14
      sub cx,1
      mov textcol,48
      mov textrow,13

      call TextPrint
;.........................................................


mov ah,01
int 21h
CMP al,114 ;,,,,,,,,,,,,,,,ASCII FOR R

je restart0 ;....................RESTART GAME...................
CMP al,13  ;....................END GAME
je exit



I3:

;...............PAUSE PAGE............................

      mov si,offset strP
      mov cx,lengthof strP
      sub cx,1
      mov textcol,27
      mov textrow,8

call TextPrint

mov ah,01h
int 21h

cmp al,112
je restart


;...........................................






main endp




exit:




mov ah,00h
mov al,10h
int 10h

call Sound


mov ah,4ch
int 21h

















end