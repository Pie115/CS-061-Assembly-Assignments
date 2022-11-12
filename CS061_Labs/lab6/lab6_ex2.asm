;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu 
; 
; Lab: lab 6, ex 2
; Lab section: 21
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
    
    ADD R5, R5, #1  
    
    DO_POP_WHILE
    	LD R1, POP_OP
    	JSRR R1
    
    	ADD R2, R2, #0
    	BRz END_POP_WHILE
    	BR DO_POP_WHILE
    END_POP_WHILE
    
	LEA R0, ENDLINE
	PUTS
	
    HALT
    
    
    
PUSH_OP .FILL   x3200
POP_OP  .FILL   x3400
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
	LEA R0, INTROO
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
INTROO  .STRINGZ    "PRESS ENTER TO STOP\n"
OVER .STRINGZ "\nOVERFLOW\n"
NEWLINE_PUSH .STRINGZ "\n"

	
.END

;------------------------------------------------------------------------------------------
; Subroutine: SUB_STACK_POP
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available                      ;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has popped MEM[TOS] off of the stack and copied it to R0.
;		    If the stack was already empty (TOS = BASE), the subroutine has printed
;                an underflow error message and terminated.
; Return Values: R0 ← value popped off the stack
;		   R5 ← updated TOS
;------------------------------------------------------------------------------------------

.ORIG x3400	
	ST R7, BU_R7_POP
	AND R1, R1, #0    ;

	LEA R0, INTRO1
	PUTS
	LEA R0, INTRO2
	PUTS
	GETC
	ADD R2, R0, #-10
	BRnz END_POP
	LEA R0, POP
	PUTS

	LD R3, BASEP
	ADD R3, R3, #1  ;
	NOT R3, R3
 	ADD R3, R3, #1
	ADD R2, R5, R3	
	BRz UNDERFLOW

	ADD R5, R5, #-1			

	STR R1, R5, #0			

	LEA R0, NEWLINE_POP
	PUTS
	LD R7, BU_R7_POP
	RET

    UNDERFLOW
    	LEA R0, UNDER
    	PUTS
    	LD R7, BU_R7_POP
    	HALT
    END_POP
        LEA R0, ENDP
        PUTS
    	LD R7, BU_R7_POP
    	RET
        HALT
        
BASEP .FILL xA000
BU_R7_POP .BLKW #1
INTRO1 .STRINGZ "PRESS ANY KEY TO POP VALUE FROM STACK\n"
INTRO2  .STRINGZ    "PRESS ENTER TO STOP\n"
UNDER .STRINGZ "\nUNDERFLOW\n"
POP .STRINGZ    "POP!\n"
NEWLINE_POP .STRINGZ "\n"
ENDP .STRINGZ   "ENDING PROGRAM \n"

	
.END