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

    LDI R3, DEC_65_PTR  ;
    LDI R4, HEX_41_PTR  ;
    
    ADD R3, R3, #1; 
    ADD R4, R4, #1; 
    
    STI R3, DEC_65_PTR ;
    STI R4, HEX_41_PTR ; 
    
    HALT    ;
    
    ;------------
    ;local data
    ;------------
    
    DEC_65_PTR  .FILL   x4000 ;
    HEX_41_PTR  .FILL   x4001 ;
    
    ;; Remote data
.end

.orig x4000

    NEW_DEC_65	.FILL #65
    NEW_HEX_41	.FILL x41
    
.end