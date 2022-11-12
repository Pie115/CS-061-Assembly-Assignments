;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: 
; Email: 
; 
; Assignment name: Assignment 2
; Lab section: 
; TA: 
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

;----------------------------------------------
;output prompt
;----------------------------------------------	
    LEA R0, intro			; get starting address of prompt string
    PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
    LD  R1, zero;
    LD  R2, zero;
    
    GETC;
    OUT ;
    
    ADD, R1, R1, R0; 
    
    LD R0, newline ;
    OUT ;
    
    LD R0, #0 ;
    GETC;
    OUT ;
    
    ADD, R2, R2, R0; 
    
    LD R0, newline ;
    OUT ;
    
    LD R0, zero ;

    ADD R0, R0, R1 ;
    OUT;

    LEA R0, minus ;
    PUTS ;

    LD R0, zero ;

    ADD R0, R0, R2 ;
    OUT;
    
    LEA R0, equals ;
    PUTS ;

    ADD R3, R2, #0
    NOT R3, R3
    ADD R3, R3, 1
    
    ADD R4, R1, R3

    BRn IS_NEGATIVE

        ADD R4, R4, #15 ;
        ADD R4, R4, #15 ;  
        ADD R4, R4, #15 ;
        ADD R4, R4, #3  ;
  
        ADD R0, R4, #0  ;
        OUT ;
        LEA R0, NEWLINE ;
        OUT    ;
        
    IS_NEGATIVE ;

        NOT R4, R4  ;
        ADD R4, R4, #1  ;

        ADD R4, R4, #15 ;
        ADD R4, R4, #15 ;
        ADD R4, R4, #15 ;
        ADD R4, R4, #3  ;

        LEA R0, negative    ;
        PUTS    ;
        ADD R0, R4, #0  ;
        OUT    ;
        LEA R0, NEWLINE ;

;------
;Data
;------
        HALT				; Stop execution of programfile:///Applications/LC3Tools.app/Contents/Resources/app.asar/dist/electron/index.html#/simulator
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline .FILL x0A	; newline character - use with LD followed by OUT
minus   .STRINGZ    " - "
equals  .STRINGZ    " = "
zero    .FILL   #0 ;
negative .STRINGZ   "-"


;---------------	
;END of PROGRAM
;---------------	
.END

