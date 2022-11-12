;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu 
; 
; Lab: lab 6, ex 3
; Lab section: 21
; TA: Varun Sapre
; 
;=================================================
.ORIG x3000

    LD R3, BASE ;
    LD R4, MAX  ;
    LD R5, TOS  ;
    
    LEA R0, FIRST   ;
    PUTS    ;
    LD R1, PUSH_OP
    JSRR R1
    LEA R0, SECOND  ;
    PUTS
    JSRR R1
    LEA R0, OPERATOR  ;
    PUTS
    JSRR R1
    
    LD  R1, ADD_OP  ;
    JSRR R1 ;
    
    
    
PUSH_OP .FILL   x3200
POP_OP  .FILL   x3400
ADD_OP  .FILL   X3600
BASE    .FILL   xA000
MAX     .FILL   xA005
TOS     .FILL   xA000
FIRST   .STRINGZ    "ENTER FIRST VALUE TO ADD:\n"
SECOND  .STRINGZ    "ENTER SECOND VALUE TO ADD:\n"
OPERATOR    .STRINGZ    "ENTER PLUS OPERATOR:\n"
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
INTRO .STRINGZ "INPUT VALUE: \n"
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

;------------------------------------------------------------------------------------------
; Subroutine: SUB_RPN_ADDITION
; Parameter (R3): BASE: A pointer to the base (one less than the lowest available                      ;                       address) of the stack
; Parameter (R4): MAX: The "highest" available address in the stack
; Parameter (R5): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has popped off the top two values of the stack,
;		    added them together, and pushed the resulting value back
;		    onto the stack.
; Return Value: R5 ← updated TOS address
;------------------------------------------------------------------------------------------
.ORIG x3600

    AND R2, R2, #0    ;
    AND R1, R1, #0    ;
    STR R2, R5, #0  ;
    
    ADD R5, R5, #-1
    LDR R0, R5, #0 ;
    LD R2, CONVERT  ;
    ADD R0, R0, R2  ;
    AND R2, R2, #0    ;
    STR R2, R5, #0  ;
    
    ADD R5, R5, #-1
    LDR R1, R5, #0 ;
    LD R2, CONVERT  ;
    ADD R1, R1, R2  ;
    AND R2, R2, #0    ;
    STR R2, R5, #0  ;
    
    ADD R0, R0, R1  ;
    STR R0, R5, #0
    LD R2, CONVERTBACK  ;
    ADD R0, R0, R2
    OUT
    RET 
    HALT
    
PUSH_ADD    .FILL   X3200
POP_ADD .FILL   x3400
CONVERT .FILL   #-48
CONVERTBACK .FILL   #48

.END


