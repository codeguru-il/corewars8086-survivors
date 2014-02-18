;
; The simplest 'bomber' survivor.
;
; Bombs the entire arena by writing the byte 0xCC starting with offset 0.
; The above byte was chosen since it specifies a 'bad' opcode (INT3), thus
; hitting another survivor's code would probably kill it.
;
; @note The survivor makes no attempt to avoid bombing itself :)
;
; @author DL
;

;
; 1. initialization
;
mov al, 0CCh     ; AL = our bomb data (0xCC, see above)
mov bx, 0        ; BX = starting offset

;
; 2. bombing loop
;
@loop:
mov [bx], al     ; write the value in AL to the offset BX points to
inc bx           ; advance BX to the next offset
jmp @loop
