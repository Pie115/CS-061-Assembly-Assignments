;=================================================
; Name: Paimon Goulart 
; Email: pgoul002@ucr.edu
; 
; Lab: lab 4, ex 2
; Lab section: 21
; TA: Varun Sapre
; 
;=================================================
.ORIG x3000

    LD, R1, ARRAY_PTR  ;
    LD, R2, NUM ;
    LD, R3, COUNTER ;
    
    DO_WHILE_LOOP
        
        STR, R2, R1, #0;
        ADD, R1, R1, #1   ;
        ADD, R2, R2, #1 ;
        ADD, R3, R3, #-1;
        BRP DO_WHILE_LOOP   ;
        
    END_DO_WHILE_LOOP`;
    
    
    LD, R1, ARRAY_PTR  ;
    LD, R3, COUNTER ;
    LD, R4, PRINT   ;
    
    DO_PRINT_LOOP
        LDR, R0, R1, #0 ;
        ADD, R0, R0, R4  ;
        OUT ;
        ADD, R1, R1, #1   ;
        LD, R0, #0  ;
        ADD, R3, R3, #-1;
        BRP DO_PRINT_LOOP   ;
    END_DO_PRINT_LOOP`;
    
    HALT

    ARRAY_PTR   .FILL   x4000   ;
    COUNTER .FILL   #10 ;
    NUM .FILL   #0  ;
    PRINT   .FILL   #48 ;
    
.END

.ORIG x4000

    ARRAY_1 .BLKW   #10 ;
    
.END
