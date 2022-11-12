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

    LEA R1, ARRAY_1 ;
    LD  R2, COUNTER;
    
    DO_WHILE_LOOP
    
        GETC    ;
        STR R0, R1, #0 ;
        ADD R1, R1, #1 ;
        ADD R2, R2, #-1;
        BRp DO_WHILE_LOOP   ;
        
    END_DO_WHILE_LOOP
    
    LEA R1, ARRAY_1 ;
    LD  R2, COUNTER;

    DO_LOOP
    
        LDR R0, R1, #0 ;
        OUT ;
        LD R0, NEWLINE ;
        OUT ;
        ADD R1, R1, #1 ;
        ADD R2, R2, #-1;
        BRp DO_LOOP   ;
        
    END_DO_LOOP
    
    HALT
    
    ARRAY_1 .BLKW   #10 ;
    COUNTER   .FILL   #10 ;
    NEWLINE .STRINGZ   '\n';

.END