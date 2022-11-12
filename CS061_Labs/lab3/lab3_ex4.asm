;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu  
; 
; Lab: lab 3, ex 2
; Lab section: 021
; TA: 
; 
;=================================================
.ORIG x3000

    LD R1, ARRAY_1_PTR ;
    LD R2, #0;
    DO_WHILE_LOOP
        GETC    ;
        LD  R2, #0; 
        STR R0, R1, #0 ;
        OUT    ;
        LDR R2, R1, #0 ;
        ADD R1, R1, #1 ;
        ADD R2, R2, #-10;
        BRp DO_WHILE_LOOP   ;
        
    END_DO_WHILE_LOOP
    
    LD R1, ARRAY_1_PTR ;
    LD  R2, #0;

    DO_LOOP
    
        LD  R2, #0; 
        LDR R0, R1, #0 ;
        OUT ;
        LDR R2, R1, #0 ;
        ADD R1, R1, #1 ;
        ADD R2, R2, #-10;
        BRp DO_LOOP   ;
        
    END_DO_LOOP
    
    LD R0, NEWLINE ;
    OUT; 
    
    HALT
    
    ARRAY_1_PTR .FILL   x4000 ;
    NEWLINE .STRINGZ   '\n';

.END