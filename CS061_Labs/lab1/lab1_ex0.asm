;=================================================
; Name: Paimon Goulart
; Email: pgoul002@ucr.edu 
; 
; Lab: lab 1, ex 0
; Lab section: 21
; TA: Varun Sapre
; 
;=================================================
; 
;Hello World Program

.ORIG x3000
;-------------

    LEA R0, MSG_TO_PRINT; 
    PUTS;
    HALT; 
;-------------
;Local Data
;-------------
    MSG_TO_PRINT    .STRINGZ    "Hello world! \n"
    
    
.END
