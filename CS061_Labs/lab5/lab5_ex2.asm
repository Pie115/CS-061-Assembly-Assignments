;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu
; 
; Lab: lab 5, ex 2
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
    
    LD R1, ARRAY_PTR    ;
    
    LD R3, PALINDROME_FUNC  ;
    JSRR R3 
; your code goes here
halt

; your local data goes here

ARRAY_PTR   .FILL   x4000
STRING_FUNC .FILL   x3200
PALINDROME_FUNC .FILL   x3400  
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

;======================================
;Subroutine: SUB_IS_PALINDROME
;Parameter: R1  The starting address of a null terminated string
;Parameter: R5  The number of characters in a string
;Postcondition ; Postcondition: The subroutine has determined whether the string at (R1)
;is a palindrome or not, and returned a flag to that effect.

;Return Value: R4 {1 if the string is a palindrome 0 if otherwise}
;======================================

.ORIG x3400
    
    ;backup
    ST R7, backup_r7_3400 
    ST R5, backup_r3_3400
    ST R1, backup_r1_3400
    ST R2, backup_r2_3400
    
    
    ADD R5, R1, R5 
    ADD R1, R1, #-1 
    
    AND R4, R4, #0
    ADD R4, R4, #1
    
    DO_CHECK_LOOP
        ADD R1, R1, #1  ;get indexes for palindrome check
        ADD R5, R5, #-1 
        
        LDR R2, R1, #0
        NOT R2, R2
        ADD R2, R2, #1
        LDR R7, R5, #0
        
        ADD R2, R2, R7
        BRz IF_TRUE
            AND R4, R4, #0
        IF_TRUE

        NOT R2, R1      ;get 2s comp of r1
        ADD R2, R2, #1
        
        ADD R2, R2, R5  ;add that to r5, see if we need to keep going
        BRp DO_CHECK_LOOP
    END_DO_CHECK_LOOP
    
    
    
    ld R7, backup_r7_3400
    ld R5, backup_r3_3400
    ld R1, backup_r1_3400
    ld R2, backup_r2_3400
    
    RET
    
    
backup_r7_3400  .blkw #1
backup_r3_3400  .blkw #1
backup_r1_3400  .blkw #1
backup_r2_3400  .blkw #1

.END


.ORIG x4000

    STARTING_ADDRESS    .BLKW   x50   ;
    
.END