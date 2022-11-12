;=================================================
; Name: Paimon Goulart 
; Email: pgoul002@ucr.edu
; 
; Lab: lab 5, ex 1
; Lab section: 21
; TA: Varun Sapre
; 
;=================================================
.orig x3000
; Initialize the stack. Don't worry about what that means for now.
    ld r6, top_stack_addr ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE
    LD R1, ARRAY_PTR    ;

    LD R3, STRING_FUNC  ;
    JSRR R3 ;

; your code goes here
halt

; your local data goes here

ARRAY_PTR   .FILL   x4000
STRING_FUNC .FILL   x3200
top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE
.end

; your subroutines go below here
;======================================
;Subroutine: SUB_GET_STRING
;Parameter: R1  The starting address of the character array
;Postcondition The subroutine has prompted the user to input a string,
;	terminated by the [ENTER] key (the "sentinel"), and has stored 
;	the received characters in an array of characters starting at (R1).
;	the array is NULL-terminated; the sentinel character is NOT stored.
;Return Value: The number of non-sentinel chars read from the user.
;	R1 contains the starting address of the array unchanged.
;======================================

.ORIG x3200

;======================================
;Subroutine Instructions
;======================================
    
    ADD R6, R6, #-1 ;
    STR R7, R6, #0  ;
    ADD R6, R6, #-1 ;
    STR R5, R6, #0  ;

    DO_WHILE_LOOP
        GETC    ;
        LD  R2, #0; 
        STR R0, R1, #0 ;
        ADD R5, R5, #1  ;
        OUT    ;
        LDR R2, R1, #0 ;
        ADD R1, R1, #1 ;
        ADD R2, R2, #-10;
        BRp DO_WHILE_LOOP   ;
        ADD R5, R5, #-1 ;
    END_DO_WHILE_LOOP
    
    ADD R6, R6, #1  ;
    LDR R7, R6, #0  ;
    ADD R6, R6, #1  ;
    
    ret

.END

.ORIG x4000

    STARTING_ADDRESS    .BLKW   x50   ;
    
.END