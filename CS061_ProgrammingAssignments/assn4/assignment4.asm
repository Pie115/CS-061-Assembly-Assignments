;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Paimon Goulart
; Email: paimon.goulart@email.ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 21
; TA: Varun Sapre
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

;-------------
;Instructions
;-------------

; output intro prompt
						
; Set up flags, counters, accumulators as needed

; Get first character, test for '\n', '+', '-', digit/non-digit 	
					
; is very first character = '\n'? if so, just quit (no message)!

; is it = '+'? if so, ignore it, go get digits

; is it = '-'? if so, set neg flag, go get digits
					
; is it < '0'? if so, it is not a digit	- o/p error message, start over

; is it > '9'? if so, it is not a digit	- o/p error message, start over
				
; if none of the above, first character is first numeric digit - convert it to number & store in target register!
					
; Now get remaining digits from user in a loop (max 5), testing each to see if it is a digit, and build up number in accumulator

; remember to end with a newline!
;-------------------------------
;INSERT CODE STARTING FROM HERE 
;--------------------------------
.ORIG x3000		
    
    START 
        LD R2, MINUSCHECKER   
        AND R5, R5, #0  
        LD R7, LOOPCOUNT1 
        
        AND R1, R1, #0
        AND R0, R0, #0
        LD R0, introPromptPtr
        PUTS
        OUT
        
    GETC
    
    ADD R1, R0, #0
    ADD R0, R4, #0
    LD R6, NEWLINECHECK  
    ADD R0, R0, R6
    BRz INPUTNEWLINE   
    
    ADD R4, R1, #0
    ADD R0, R4, #0
    OUT
    
    LD R6, MINUSCHECKER
    ADD R0, R0, R6
    BRz MINUS
    
    ADD R0, R4, #0
    LD R6, PLUSCHECKER    
    ADD R0, R0, R6  
    BRz PLUS  
    
    ADD R0, R4, #0
    LD R6, CHECK2   
    ADD R0, R0, R6
    LD R6, CHECK1
    ADD R0, R0, R6
    BRnz INPUTNUMBER
    ADD R6, R6, #0
    ADD R0, R0, R6
    BRn INPUTNOTNUM
    
    ADD R0, R4, #0
    LD R6, CHECK2
    ADD R0, R0, R6
    LD R6, CHECK1
    ADD R0, R0, R6
    BRp INPUTNOTNUM2
    
    INPUTNEWLINE
    HALT
    
    MINUS
        LD R5, NEGATIVEONE  
        AND R0, R0, #0
        AND R4, R4, #0
        BRz SECONDLOOP 
    
    INPUTNOTNUM
        LD R0, errorMessagePtr
        PUTS
        AND R0, R0, #0
        BRz START
    
    INPUTNOTNUM2
        LD R0, errorMessagePtr
        PUTS
        AND R0, R0, #0
        BRz START
    
    INPUTNUMBER
        ADD R7, R7, #-1
        LD R0, CHECK2
        ADD R1, R4, #0
        ADD R4, R4, R0
        ADD R1, R1, R0
        AND R0, R0, #0
        BRz SECONDLOOP
    
    PLUS
        AND R4, R4, #0
    SECONDLOOP
        ADD R7, R7, #-1
        
    AND R0, R0, #0
    AND R1, R1, #0
    AND R2, R2, #0
    AND R3, R3, #0
    AND R6, R6, #0
    
    REPEATLOOP    
        AND R0, R0, #0
        AND R1, R1, #0
        AND R2, R2, #0
        AND R3, R3, #0
        AND R6, R6, #0
        GETC
        OUT
        
        ADD R1, R0, #0
        LD R6, NEWLINECHECK
        ADD R0, R0, R6
        BRz INPUTNEWLINEFUNC 
    
    ADD R0, R1, #0
    LD R6, CHECK2
    ADD R0, R0, R6
    AND R6, R6, #0
    ADD R0, R0, R6
    BRn INPUTNOTNUMFUNC 
    
    ADD R0, R1, #0
    LD R6, CHECK2
    ADD R0, R0, R6
    LD R6, CHECK1
    ADD R0, R0, R6
    BRnz INPUTNUMBERFUNC
    BRp INPUTNOTNUM2FUNC 
    
    INPUTNOTNUMFUNC
        LD R0, errorMessagePtr
        PUTS
        AND R0, R0, #0
        BRz START
    
    INPUTNOTNUM2FUNC
        LD R0, errorMessagePtr
        PUTS
        AND R0, R0, #0
        BRz START
        
    
    INPUTNUMBERFUNC
        LD R0, CHECK2
        ADD R1, R1, R0
        AND R6, R6, #0
    
        ADD R0, R4, #0
        LD R3, LOOPCOUNT2
    
        MULTIPLYLOOP
            ADD R0, R0, R4
            AND R6, R6, #0
            ADD R3, R3, #-1
            BRp MULTIPLYLOOP
            
        ADD R4, R0, #0
        ADD R4, R4, R1
        
        ADD R7, R7, #-1
        BRp REPEATLOOP
    
    INPUTNEWLINEFUNC 
        ADD R5, R5, #1
        BRz TAKECOMPLEMENT
        LD R0, NEWLINEOUT 
        OUT
        HALT
    
    TAKECOMPLEMENT
        NOT R4, R4
        ADD R4, R4, #1
        
        LD R0, NEWLINEOUT
        OUT

HALT

MINUSCHECKER  .FILL   x-2D
PLUSCHECKER   .FILL   x-2B
CHECK1    .FILL   #-9
CHECK2  .FILL   x-30
NEGATIVEONE .FILL   #-1
NEWLINEOUT    .STRINGZ   "\n"
NEWLINECHECK .FILL   #-10
LOOPCOUNT1    .FILL   #6
LOOPCOUNT2 .FILL   #9
introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200

.END
;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
.STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
.STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------
.END

;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.