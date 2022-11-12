;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Paimon Goulart
; Email: paimon.goulart@email.ucr.edu	
; 
; Assignment name: Assignment 3
; Lab section: 21
; TA: Varun Sapre
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
    LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
    LDR R1, R6, #0			; R1 <-- value to be displayed as binary 

    ADD R2, R2, #15
    ADD R3, R3, #4

    DO_WHILE_LOOP
    
        ADD R3, R3, #0
        BRp BRANCH
        
        ADD R4, R4, #-7 ; 
        ADD R4, R4, R2 ;
        BRN PRINT_SPACE ; 
        LEA R0, space
        PUTS
        
    PRINT_SPACE
        
        AND R3, R3, #0
        ADD R3, R3, #4
        ADD R2, R2, #0
        BR END_BRANCH

        BRANCH

            ADD R1, R1, #0
            BRn IF_ZERO
            
                LEA R0, printzero
                PUTS
                BR END_IF_ZERO
                
            IF_ZERO
            
            LEA R0, printone
            PUTS
            END_IF_ZERO

            ADD R1, R1, R1
            ADD R2, R2, #-1
            ADD R3, R3, #-1

        END_BRANCH
        
        BRzp DO_WHILE_LOOP
        
    END_DO_WHILE_LOOP
        
    LEA R0, newLine
    PUTS

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------

    HALT
    ;---------------	
    ;Data
    ;---------------
    Value_ptr	.FILL xCA01	; The address where value to be displayed is stored
    printzero  .STRINGZ   "0"
    printone   .STRINGZ   "1"
    space    .STRINGZ   " "
    newline .STRINGZ    "\n"

.END

.ORIG xCA01					; Remote data
Value .FILL b1111111111111111	    ; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
