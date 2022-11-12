;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu
; 
; Lab: lab 6, ex 1
; Lab section:  21 
; TA: Varun Sapre
; 
;=================================================
.ORIG x3000

    LD R3, BASE ;
    LD R4, MAX  ;
    LD R5, TOS  ;
    
    DO_WHILE
    	LD R1, PUSH_OP
    	JSRR R1
    
    	ADD R2, R2, #0
    	BRz END_WHILE
    	BR DO_WHILE
    END_WHILE
    
	LEA R0, ENDLINE
	PUTS
	
    HALT
    
    
    
PUSH_OP .FILL   x3200
BASE    .FILL   xA000
MAX     .FILL   xA005
TOS     .FILL   xA000
ENDLINE .STRINGZ    "\n"

.END


;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_PUSH
; Parameter (R1): The value to push onto the stack
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available                      ;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has pushed (R1) onto the stack (i.e to address TOS+1). 
;		    If the stack was already full (TOS = MAX), the subroutine has printed an
;		    overflow error message and terminated.
; Return Value: R5 ← updated TOS
;------------------------------------------------------------------------------------------
.ORIG x3200	;PUSH
	ST R7, BU_R7_PUSH

	LEA R0, INTRO
	PUTS
	GETC
	OUT

	ADD R2, R0, #-10
	BRz END_PUSH

	LD R4, MAXP
	NOT R4, R4
 	ADD R4, R4, #1
	ADD R2, R5, R4	
	BRzp OVERFLOW

	ADD R5, R5, #1			

	STR R0, R5, #0			

	LEA R0, NEWLINE_PUSH
	PUTS
	LD R7, BU_R7_PUSH
	RET

    OVERFLOW
    	LEA R0, OVER
    	PUTS
    	LD R7, BU_R7_PUSH
    	HALT
    END_PUSH
    	LD R7, BU_R7_PUSH
    	RET
        HALT
        
MAXP .FILL xA005
BU_R7_PUSH .BLKW #1
INTRO .STRINGZ "INPUT VALUE TO PLACE ON STACK\n"
OVER .STRINGZ "\nOVERFLOW\n"
NEWLINE_PUSH .STRINGZ "\n"

	
.END