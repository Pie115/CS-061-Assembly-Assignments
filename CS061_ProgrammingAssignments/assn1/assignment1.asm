;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu
; 
; Assignment name: Assignment 1
; Lab section: 021
; TA: Varun Sapre
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

;------------------------------------------
;REG VALUES     R0  R1  R2  R3  R4  R5  R6  R7
;------------------------------------------
;Pre-Loop       0   6   12  0   0   0   0   0
;Iteration 01   0   5   12  12  0   0   0   0
;Iteration 02   0   4   12  24  0   0   0   0
;...
;Iteration n    0   6-n 12  12n 0   0   0   0  
;End_of_Program 0   0   12  72  0   0   0   0
;
;
;
;
;
;
;


.ORIG x3000			; Program begins here
;-------------
;Instructions: CODE GOES HERE
;-------------
    LD R1, DEC_6; R1 
    LD R2, DEC_12; 
    LD R3, DEC_0; 

    DO_WHILE_LOOP

        ADD R3, R3, R2; 
        ADD R1, R1, #-1; 
        Brp DO_WHILE_LOOP;
        
    END_DO_WHILE_LOOP

    HALT
;---------------	
;Data (.FILL, .STRINGZ, .BLKW)
;---------------
    DEC_0   .FILL   #0; 
    DEC_6   .FILL   #6; 
    DEC_12  .FILL   #12; 

.END


