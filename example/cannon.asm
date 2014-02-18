;
; A smarter version of a 'bomber' survivor.
;
; Bombs the arena in circles, by writing the byte 0xCC (a 'bad' opcode: INT3).
;
; The survivor does not bomb the *entire* arena, but instead bombs with 'jumps'
; (meaning there is a gap between two consecutive bombs). We assume our
; enemies' code will be longer than a single byte... so we'll still hit them :)
;
; The survivor avoids hitting its own code, by setting the starting bomb offset
; to be the first offset right after its own code. Then, it makes sure the bomb
; 'jump' skips its own code after a full round.
;
; @author DL
;

;
; 1. initialization
;
@start:
mov bx, ax               ; on startup, AX holds our load-address
add bx, (@end - @start)  ; BX is now the first offset after our own code
mov al, 0CCh             ; AL = our bomb data (0xCC, see above)

;
; 2. bombing loop
;
@loop:
mov [bx], al             ; write the value in AL to the offset BX points to
add bx, 8                ; add our bombing jump size to BX (we use a jump size
                         ; of 8 bytes, since it's longer than our code size and
                         ; divides with the arena's size. think why ... :)
jmp @loop
@end:
