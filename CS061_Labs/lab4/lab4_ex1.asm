;=================================================
; Name: Paimon Goulart 
; Email: pgoul002@ucr.edu
; 
; Lab: lab 4, ex 1
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
        
    
    HALT
    

    ARRAY_PTR   .FILL   x4000   ;
    COUNTER .FILL   #10 ;
    NUM .FILL   #0  ;
    
.END

.ORIG x4000

    ARRAY_1 .BLKW   #10 ;
    
.END
