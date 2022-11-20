%define CALL_FAR_BX_OPCODE 0x1FFF


@start:
mov si,ax
add si,(@copy-@start)

mov cl,(@copy_end - @copy)/0x2
rep movsw

push es
pop ds

inc ah
mov al,0xA3

mov bx,di
stosw
mov [di],cs
mov ss,[di]

mov ax,CALL_FAR_BX_OPCODE
les di,[bx]
xor si,si
mov cl,(@loop_end-@loop)/0x2
mov sp,[bx]
stosw
dec di

call far [bx]

@copy:
rep movsw
@loop:
mov di,[bx]
mov cl,(@copy_end - @copy)/0x2
xor si,si
stosw
dec di
call far [bx]
@loop_end:
@copy_end: