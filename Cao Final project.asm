.MODEL SMALL
.STACK 100H

.DATA

    ;UI Messages
    Welcome_Msg     DB 10,13,'WELCOME TO JUMP IF HUNGRY <JZ> MART$'
    Menu_Header     DB 10,13,10,13,'-------- ITEMS MENU --------$',10,13
    Item_Menu_1     DB 10,13,'1. VEGETABLES     -  80 RS$'
    Item_Menu_2     DB 10,13,'2. EGGS (DOZEN)   - 300 RS$'
    Item_Menu_3     DB 10,13,'3. CANDIES        -   5 RS$'
    Item_Menu_4     DB 10,13,'4. DAIRY PRODUCTS - 250 RS$'
    Item_Menu_5     DB 10,13,'5. FRUITS         - 150 RS$'

    Status_Msg      DB 10,13,10,13,'CURRENT TOTAL: RS $'
    Choice_Msg      DB 10,13,'SELECT ITEM (1-5) OR 6 TO GENERATE INVOICE: $'

    ;Quantity Prompts
    Prompt_Veg      DB 10,13,'HOW MANY VEGETABLES DO YOU WANT TO PURCHASE? $'
    Prompt_Eggs     DB 10,13,'HOW MANY DOZEN EGGS DO YOU WANT TO PURCHASE? $'
    Prompt_Candy    DB 10,13,'HOW MANY CANDIES DO YOU WANT TO PURCHASE? $'
    Prompt_Dairy    DB 10,13,'HOW MANY DAIRY PRODUCTS DO YOU WANT TO PURCHASE? $'
    Prompt_Fruits   DB 10,13,'HOW MANY FRUITS DO YOU WANT TO PURCHASE? $'

    ;Invoice Header
    Invoice_Title   DB 10,13,10,13,'============= FINAL INVOICE =============$'
    Column_Header   DB 10,13,'ITEM NAME           QTY     PRICE     ITEM TOTAL$'
    Separator_Line  DB 10,13,'------------------------------------------------$'

    ;Item Name Strings
    Name_Veg        DB 10,13,'Vegetables          $'
    Name_Eggs       DB 10,13,'Eggs                $'
    Name_Candy      DB 10,13,'Candy               $'
    Name_Dairy      DB 10,13,'Dairy               $'
    Name_Fruits     DB 10,13,'Fruits              $'

    ;Congratulations Messages
    Sub_Total_Msg   DB 10,13,10,13,'SUBTOTAL:        RS $'
    Congrats_10     DB 10,13,'CONGRATULATIONS! YOU GOT A 10% DISCOUNT!$'
    Congrats_20     DB 10,13,'CONGRATULATIONS! YOU GOT A 20% DISCOUNT!$'
    Congrats_30     DB 10,13,'CONGRATULATIONS! YOU GOT A 30% DISCOUNT!$'
    Congrats_50     DB 10,13,'CONGRATULATIONS! YOU GOT A 50% DISCOUNT!$'
    Discount_Prefix DB 10,13,'BONUS DISCOUNT:  RS $'
    Grand_Total_Msg DB 10,13,'GRAND TOTAL:     RS $'
    Exit_Msg        DB 10,13,10,13,'THANK YOU FOR SHOPPING AT JZ MART!$'

    ;Arrays
    ;Price array  (index 0=Veg, 1=Eggs, 2=Candy, 3=Dairy, 4=Fruits)
    Prices      DW 80, 300, 5, 250, 150

    ;Quantity array (parallel to Prices)
    Counts      DW 0, 0, 0, 0, 0

    ;Name pointer array (stores offsets of each Name_xx string)
    NamePtrs    DW Name_Veg, Name_Eggs, Name_Candy, Name_Dairy, Name_Fruits

    ;Prompt pointer array (stores offsets of each Prompt_xx string)
    PromptPtrs  DW Prompt_Veg, Prompt_Eggs, Prompt_Candy, Prompt_Dairy, Prompt_Fruits

    ;Variables
    Grand_Total DW 0
    DigitCount  DW 0

;Macros
PRINT MACRO MSG
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
ENDM

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display welcome and menu
    PRINT Welcome_Msg
    PRINT Menu_Header
    PRINT Item_Menu_1
    PRINT Item_Menu_2
    PRINT Item_Menu_3
    PRINT Item_Menu_4
    PRINT Item_Menu_5

;--------------------------------------------------------------
; ITEM SELECTION LOOP
; Displays current total, prompts user for selection
; Uses CMP/JE to route to index handler
;--------------------------------------------------------------
ITEM_SELECTION_LOOP:
    PRINT Status_Msg
    MOV AX, Grand_Total
    CALL PRINT_NUMBER
    PRINT Choice_Msg

    MOV AH, 01H
    INT 21H
    SUB AL, 48         
    
    CMP AL, 6
    JE  GENERATE_INVOICE
    CMP AL, 1
    JE  IDX_0
    CMP AL, 2
    JE  IDX_1
    CMP AL, 3
    JE  IDX_2
    CMP AL, 4
    JE  IDX_3
    CMP AL, 5
    JE  IDX_4
    JMP ITEM_SELECTION_LOOP

IDX_0: MOV SI, 0   
       JMP BUY_ITEM
IDX_1: MOV SI, 2   
       JMP BUY_ITEM
IDX_2: MOV SI, 4   
       JMP BUY_ITEM
IDX_3: MOV SI, 6   
       JMP BUY_ITEM
IDX_4: MOV SI, 8   
       JMP BUY_ITEM

;--------------------------------------------------------------
; BUY_ITEM PROCEDURE (Single handler replacing 5 separate ones)
; SI = byte offset into Prices[], Counts[], NamePtrs[], PromptPtrs[]
;--------------------------------------------------------------
BUY_ITEM:
    MOV BX, PromptPtrs[SI]
    MOV DX, BX
    MOV AH, 09H
    INT 21H

    CALL GET_QUANTITY           

    ADD Counts[SI], AX          

    MOV BX, Prices[SI]          
    MUL BX                      
    ADD Grand_Total, AX

    JMP ITEM_SELECTION_LOOP

;--------------------------------------------------------------
; GENERATE INVOICE PROCEDURE
; Iterates through arrays using LOOP + SI index
;--------------------------------------------------------------
GENERATE_INVOICE:
    MOV AX, 03H
    INT 10H                     

    PRINT Invoice_Title
    PRINT Column_Header
    PRINT Separator_Line

    MOV SI, 0                  
    MOV CX, 5                   

INVOICE_LOOP:
    CMP Counts[SI], 0           
    JE  SKIP_ITEM

    ;Prints the item name
    MOV BX, NamePtrs[SI]
    MOV DX, BX
    MOV AH, 09H
    INT 21H

    ;Prints the quantity
    MOV AX, Counts[SI]
    CALL PRINT_NUMBER
    PUSH CX
    MOV CX, 8
    SUB CX, DigitCount
    CALL PRINT_SPACES
    POP CX

    ;Prints the unit price
    MOV AX, Prices[SI]
    CALL PRINT_NUMBER
    PUSH CX
    MOV CX, 10
    SUB CX, DigitCount
    CALL PRINT_SPACES
    POP CX

    ;Calculates and print the item total
    MOV AX, Counts[SI]
    MOV BX, Prices[SI]
    MUL BX
    CALL PRINT_NUMBER

SKIP_ITEM:
    ADD SI, 2                   ;Advance to next DW element
    LOOP INVOICE_LOOP          

    PRINT Separator_Line

;--------------------------------------------------------------
; FINANCIAL SUMMARY AND DISCOUNT LOGIC
;--------------------------------------------------------------
    PRINT Sub_Total_Msg
    MOV AX, Grand_Total
    CALL PRINT_NUMBER

    MOV AX, Grand_Total

    ;Types of discount applied based on total amount of purchases 
    CMP AX, 10000
    JAE APPLY_50
    CMP AX, 6000
    JAE APPLY_30
    CMP AX, 4000
    JAE APPLY_20
    CMP AX, 2000
    JAE APPLY_10
    JMP DISPLAY_FINAL

APPLY_50:
    PRINT Congrats_50
    MOV BX, 50
    JMP DO_MATH
APPLY_30:
    PRINT Congrats_30
    MOV BX, 30
    JMP DO_MATH
APPLY_20:
    PRINT Congrats_20
    MOV BX, 20
    JMP DO_MATH
APPLY_10:
    PRINT Congrats_10
    MOV BX, 10

DO_MATH:
    MUL BX                   
    MOV CX, 100
    DIV CX                      
    MOV BX, AX

    PRINT Discount_Prefix
    MOV AX, BX
    CALL PRINT_NUMBER

    SUB Grand_Total, BX       

DISPLAY_FINAL:
    PRINT Grand_Total_Msg
    MOV AX, Grand_Total
    CALL PRINT_NUMBER

    PRINT Exit_Msg

    MOV AH, 4CH
    INT 21H
MAIN ENDP

;==============================================================
; HELPER PROCEDURES
;==============================================================

;--------------------------------------------------------------
; GET_QUANTITY: Reads multi-digit integer from keyboard
; Returns: integer value in AX
; Algorithm: accumulate-and-shift (BX = BX*10 + digit)
;--------------------------------------------------------------
GET_QUANTITY PROC
    PUSH BX
    PUSH CX
    MOV BX, 0               
    MOV CX, 10             

GET_Q_LOOP:
    MOV AH, 01H
    INT 21H
    CMP AL, 13              
    JE  GET_Q_DONE
    SUB AL, 48            
    MOV AH, 0
    PUSH AX
    MOV AX, BX
    MUL CX                 
    MOV BX, AX
    POP AX
    ADD BX, AX              
    JMP GET_Q_LOOP

GET_Q_DONE:
    MOV AX, BX
    POP CX
    POP BX
    RET
GET_QUANTITY ENDP

;--------------------------------------------------------------
; PRINT_SPACES: Prints CX spaces for column alignment
; Receives: CX = number of spaces
;--------------------------------------------------------------
PRINT_SPACES PROC
    CMP CX, 0
    JLE PS_END
    PUSH AX
    PUSH DX
    MOV AH, 02H
    MOV DL, ' '
PS_L:
    INT 21H
    LOOP PS_L
    POP DX
    POP AX
PS_END:
    RET
PRINT_SPACES ENDP

;--------------------------------------------------------------
; PRINT_NUMBER: Converts 16-bit unsigned int in AX to ASCII and displays
; Sets DigitCount for use by PRINT_SPACES alignment
; Algorithm: divide by 10, push remainders, pop in order
;--------------------------------------------------------------
PRINT_NUMBER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV DigitCount, 0
    MOV BX, 10
    MOV CX, 0

PN_L1:                      
    MOV DX, 0
    DIV BX                  
    PUSH DX
    INC CX
    INC DigitCount
    OR  AX, AX
    JNE PN_L1

PN_L2:                      
    POP DX
    ADD DL, 48            
    MOV AH, 02H
    INT 21H
    LOOP PN_L2

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUMBER ENDP
END MAIN
