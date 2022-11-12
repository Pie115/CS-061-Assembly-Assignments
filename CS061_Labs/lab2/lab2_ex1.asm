;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu 
; 
; Lab: lab 2. ex 1
; Lab section: 21
; TA: 
; 
;=================================================
.orig x3000 

    LD R3, DEC_65   ;
    LD R4, HEX_41   ;
    
    HALT    ;
    
    ;------------
    ;local data
    ;------------
    
    DEC_65  .FILL   #65 ;
    HEX_41  .FILL   x41 ;
    
.end