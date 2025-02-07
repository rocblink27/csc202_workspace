//*****************************************************************************
//***********************    Assembly Source Code    ***************************
//*****************************************************************************
//  DESIGNER NAME:  Bruce Link
//
//       LAB NAME:  Lab 2, part 2
//
//      FILE NAME:  lab3_p2.s
//
//-----------------------------------------------------------------------------
//
// DESCRIPTION:
//    This file contains a set of ARM M0+ assembly functions designed to
//    manipulate bits within a 32-bit register value based on a provided
//    bit mask. These functions allow for setting, clearing, and checking 
//    bits in the register.
//
//  - my_asm_16bitset: 
//        Sets specified bits in the register value based on the 
//        bit mask. Bits marked with a 1 in the mask are set to 1 in the 
//        register value.
//  
//  - my_asm_16bitclr: 
//        Clears specified bits in the register value based on 
//        the bit mask. Bits marked with a 1 in the mask are set to 0 in the 
//        register value.
//  
//  - my_asm_16bitcheck:
//        Checks if all bits marked with a 1 in the mask are 
//        set in the register value. Returns 1 if all bits are set, 
//        otherwise returns 0.
//
//*****************************************************************************
//*****************************************************************************

.text
.thumb
.align 2   

// Make the following symbol available outside of this file
.global my_asm_16bitset
.global my_asm_16bitclr
.global my_asm_16bitcheck

/* NOTES on ARM Assmebly code
  According to the ARM Architecture Procedure Call Standard (AAPCS), the 
  first four parameters are passed in registers R0-R3. 

  ORRS R0, R0, R1: Performs a bitwise OR operation between reg_value 
                  (in R0) and mask (in R1), storing the result in R0 and 
                  updating the condition flags.

  MVN R1, R1: Inverts the bits of mask (in R1).

  ANDS R0, R0, R1: Performs a bitwise AND operation between reg_value 
                  (in R0) and the inverted mask (in R1), storing the result 
                  in R0 and updating the condition flags.

  TST R0, R1: Performs a bitwise AND operation between reg_value (in R0) 
              and mask (in R1), setting the condition flags based on the 
              result. The results itself is discarded.
              TST set Z=0 if any bits common between R0 and R1 (not good if
              checking for multiple bits set at same time)
              
  MOVNE R0, #1: Moves 1 into R0 if the result of the TST instruction is 
                non-zero (i.e., any of the bits specified by the mask are 
                set in the register value).

  MOVEQ R0, #0: Moves 0 into R0 if the result of the TST instruction is 
                zero (i.e., none of the bits specified by the mask are 
                set in the register value).

  BX LR: Branches to the address in the Link Register (LR), effectively 
        returning from the subroutine (aka rts).
*/

//-----------------------------------------------------------------------------
// DESCRIPTION:
//  This function sets the specified bit(s) in a 32-bit register value using
//  the provided bit mask. The bits marked with a 1 in the mask are set.
//
// FUNCTION PROTOTYPE:
//  uint32_t my_asm_16bitset(uint32_t reg_value, uint32_t mask)
//
// INPUT PARAMETERS:
//  reg_value - (R0) The original 16-bit register
//  bit_mask  - (R1) The bit mask indicating which bit(s) to clear.
//
// OUTPUT PARAMETERS:
//  none
//
// RETURN:
//  R0 - Returns the modified register value with the specified bit(s) set.
// -----------------------------------------------------------------------------
my_asm_16bitset:
    PUSH    {R4-R7, LR}     // Save R4-R7 and LR
    ORRS    R0, R1          // Perform bitwise OR of (R0) with (R1)
                            // and store result back into R0
    POP     {R4-R7, PC}     // Restore R4-R7 and PC
    BX      LR              // Return from subroutine



//-----------------------------------------------------------------------------
// DESCRIPTION:
//  This function sets the specified bit(s) in a 32-bit register value using
//  the provided bit mask. The bits marked with a 1 in the mask are cleared.
//
// FUNCTION PROTOTYPE:
//  uint32_t my_asm_16bitclr(uint32_t reg_value, uint32_t mask)
//
// INPUT PARAMETERS:
//  reg_value - (R0) The original 16-bit register
//  bit_mask  - (R1) The bit mask indicating which bit(s) to clear.
//
// OUTPUT PARAMETERS:
//  none
//
// RETURN:
//  R0 - Returns the modified register value with the specified bit(s) cleared.
// -----------------------------------------------------------------------------
my_asm_16bitclr:
    PUSH    {R4-R7, LR}   // Save R4-R7 and LR
   /* MVNS    R1, R1        // Perform 1's complement of mask
    ANDS    R0, R1        // Perform bitwise AND of (R0) with (R1)
                          // and store result to R0 */
    BICS R0, R0, R1
    POP     {R4-R7, PC}   // Restore R4-R7 and PC
    BX      LR            // Return from subroutine


//-----------------------------------------------------------------------------
// DESCRIPTION:
//  This function accepts a 32-bit register value and a mask. It checks if all
//  the bits marked with a 1 in the mask are set in the register value.
//  It returns true (1) if all the bits are set, and false (0) otherwise.
//
// FUNCTION PROTOTYPE:
//  uint32_t my_asm_16bitclr(uint32_t reg_value, uint32_t mask)
//
// INPUT PARAMETERS:
//  reg_value - (R0) The original 16-bit register
//  bit_mask  - (R1) The bit mask indicating which bit(s) to clear.
//
// OUTPUT PARAMETERS:
//  none
//
// RETURN:
//  R0 - 0 means false; 1 means true.
// -----------------------------------------------------------------------------
my_asm_16bitcheck:
    PUSH    {R4-R7, LR}   // Save R4-R7 and LR
    ANDS    R0, R1        // Perform bitwise AND between (R0) and (R1) 
                          // and store result the in R0
    CMP     R0, R1        // Compare the result with the mask
    BEQ     all_bits_set  // If result equals the mask, branch to all_bits_set
    MOVS    R0, #0        // Set R0 to 0 (false)
    B       end           // Branch to end

all_bits_set:
    MOVS    R0, #1        // Set R0 to 1 (true)

end:
    POP     {R4-R7, PC}   // Restore R4-R7 and return
    BX      LR            // Return from subroutine


my_asm_16bitcheck1:
    PUSH    {R4-R7, LR}   // Save R4-R7 and LR
    TST     R0, R1        // Perform bitwise AND between (R0) and (R1)  
                          //TST set Z=1 if no bits common between R0 and R1
    BNE     all_bits_set1  // If result equals the mask, branch to all_bits_set

    MOVS    R0, #0        // Set R0 to 0 (false)
    B       end2           // Branch to end

all_bits_set1:
    MOVS    R0, #1        // Set R0 to 1 (true)

end2:
    POP     {R4-R7, PC}   // Restore R4-R7 and return
    BX      LR            // Return from subroutine

.end