;=================================================
; Name: Paimon Goulart
; Email:  pgoul002@ucr.edu
; 
; Lab: lab 1, ex 1
; Lab section: 21
; TA: Varun Sapre
; 
;=================================================
.orig x3000; 

    ;--------------
    ;instructions 
    ;--------------
    
    LD R1, DEC_0; 
    LD R2, DEC_12; 
    LD R3, DEC_6; 
    
    DO_WHILE_LOOP
        ADD R1, R1, R2      ; R1 = R1 + R2
        ADD R3, R3, #-1     ; R3 = R3 - 1
        BRp DO_WHILE_LOOP   ; if(R3 > 0): goto DO_WHILE_LOOP, add 12 to itself until 6 = 0
    END_DO_WHILE_LOOP
    
    HALT
    ;---------------
    ;Local data
    ;---------------
    
    DEC_0   .FILL   #0; 
    DEC_12  .FILL   #12; 
    DEC_6   .FILL   #6;
    
.end
