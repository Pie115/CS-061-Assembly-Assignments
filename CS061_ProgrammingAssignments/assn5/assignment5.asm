; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Paimon Goulart
; Email: paimon.goulart@email.ucr.edu
; 
; Assignment name: Assignment 5
; Lab section: 21
; TA: Varun Sapre
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
; PUT ALL YOUR CODE AFTER THE main LABEL
;=================================================================================

;---------------------------------------------------------------------------------
;  Initialize program by setting stack pointer and calling main subroutine
;---------------------------------------------------------------------------------
.ORIG x3000

; initialize the stack
ld r6, stack_addr

; call main subroutine
lea r5, main
jsrr r5

;---------------------------------------------------------------------------------
; Main Subroutine
;---------------------------------------------------------------------------------
main
; get a string from the user
    lea R0, user_prompt
    PUTS
    
    ld R1, ARRAY_PTR
    LD r4, get_user_string_addr
    jsrr r4

;Got string from user
    AND R1, R1, #0  ;
    ld R1, ARRAY_PTR    ;
;reset r1 ^

;Get String length and store it in R2
    LD r4, strlen_addr
    jsrr r4
;Got length from user

    AND R1, R1, #0  ;
    ld R1, ARRAY_PTR    ;
;reset r1 ^

; call palindrome method
    
    LD r4, palindrome_addr
    jsrr r4

; determine of stirng is a palindrome
;If r2 is negative, it isn't a palindrome, so it'll print not
    LEA R0, result_string
    PUTS
    ADD R2, R2, #-1
    BRn Not_Palindrome
    BRz Is_Palindrome
;
; print the result to the screen
    

; decide whether or not to print "not"
    Not_Palindrome
        LEA R0, not_string
        PUTS
        LEA R0, final_string
    End_Not_Palindrome
    
    Is_Palindrome
        LEA R0, final_string
        PUTS
    

HALT

;---------------------------------------------------------------------------------
; Required labels/addresses
;---------------------------------------------------------------------------------

; Stack address ** DO NOT CHANGE **
stack_addr           .FILL    xFE00

; Addresses of subroutines, other than main
get_user_string_addr .FILL    x3200
strlen_addr          .FILL    x3300
palindrome_addr      .FILL	  x3400


; Reserve memory for strings in the progrtam
user_prompt          .STRINGZ "Enter a string: "
result_string        .STRINGZ "The string is "
not_string           .STRINGZ "not "
final_string         .STRINGZ	"a palindrome\n"

; Reserve memory for user input string
user_string          .BLKW	  100

ARRAY_PTR   .FILL   x5000

.END

;---------------------------------------------------------------------------------
; get_user-string - Get input string from user
;
; parameter: R1 - starting address of string
;
; returns: The string as an array in memory
;---------------------------------------------------------------------------------
.ORIG x3200
    get_user_string
    
    ST R5, backup_r5_3200
    ST R7, backup_r7_3200
    
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
        
        
    ld R5, backup_r5_3200
    ld R7, backup_r7_3200

    ret
    
backup_r5_3200  .blkw #1
backup_r7_3200  .blkw #1

.END

;---------------------------------------------------------------------------------
; strlen - compute the length of a zero terminated string
;
; parameter: R1 - the address of a zero terminated string
;
; returns: The length of the string
;---------------------------------------------------------------------------------
.ORIG x3300

    ST R2, backup_r2_3300

    strlen
        AND R2, R2, #0  ;
        AND R3, R3, #0
        
        DO_COUNT_LOOP
            ADD R2, R2, #1
            LDR R3, R1, #0 ;
            ADD R1, R1, #1
            ADD R3, R3, #-10
            BRp DO_COUNT_LOOP
            ADD R2, R2, #-1
            
        END_DO_COUNT_LOOP
        
        ld R5, backup_r5_3200
        ret
        
backup_r2_3300  .blkw #1

.END

;---------------------------------------------------------------------------------
; Palindrome - compute the length of a zero terminated string
;
; parameter: R1 - the starting address of the string
;            R2 - the length of the string
;
; returns: 1 to R2 if it is a palindrome, and 0 to R2 if it isn't
;---------------------------------------------------------------------------------

.ORIG x3400
ST R2, backup_r2_3400
ST R4, backup_r4_3400
ST R5, backup_r5_3400
ST R6, backup_r6_3400
ST R7, backup_r7_3400

palindrome ; Hint, do not change this label and use for recursive alls
; Backup all used registers, R7 first, using proper stack discipline
    
    ADD R2, R2, #-1
    BRnz Return_True
    Brp Check_Char
    
    Check_Char
        AND R3, R3, #0
        ADD R3, R1, R2
        LDR R4, R1, #0
        LDR R5, R3, #0
        NOT R5, R5
        ADD R5, R5, #1
        ADD R4, R4, R5
        BRNP Return_False
        BRz Recurse
    End_Check_Char
    
    Return_True
        AND R2, R2, #0
        ADD R2, R2, #1
        
        ld R4, backup_r4_3400
        ld R5, backup_r5_3400
        ld R6, backup_r6_3400
        ld R7, backup_r7_3400

        RET
    End_Return_True
    
    Return_False    
        AND R2, R2, #0
        ADD R2, R2, #0
        
        ld R4, backup_r4_3400
        ld R5, backup_r5_3400
        ld R6, backup_r6_3400
        ld R7, backup_r7_3400
        
        RET
    End_Return_False
    
    Recurse
        ADD R1, R1, #1
        ADD R2, R2, #-1
        JSR palindrome
    End_Recurse
; Resture all used registers, R7 last, using proper stack discipline

backup_r2_3400  .blkw #1
backup_r4_3400  .blkw #1
backup_r5_3400  .blkw #1
backup_r6_3400  .blkw #1
backup_r7_3400  .blkw #1


.END

