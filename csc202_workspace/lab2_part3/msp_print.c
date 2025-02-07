#include <stdio.h>

//-----------------------------------------------------------------------------
// Loads MSP launchpad board support macros and definitions
//-----------------------------------------------------------------------------
#include <ti/devices/msp/msp.h>
#include "clock.h"
#include "uart.h"


//-----------------------------------------------------------
// Define symbolic constants used by the program
//-----------------------------------------------------------




//-----------------------------------------------------------------------------
// DESCRIPTION:
//  This function formats an integer value into a string according to a given 
//  format and sends the resulting string to a serial port.
//
// INPUT PARAMETERS:
//  buffer: A format string used to format the integer value. It follows the 
//          format specifiers used by `sprintf`.
//  value:  The integer value to be formatted and included in the formatted 
//          string.
//
// OUTPUT PARAMETERS:
//  none
//
// RETURN:
//  none
// -----------------------------------------------------------------------------
void msp_printf(char* buffer, unsigned int value)
{
  unsigned int i = 0;
  unsigned int len = 0;
  char  string[80];

  len = sprintf(string, buffer, value);

  // Walk through array to send each character to serial port
  for (i = 0; i< len; i++)
  {
    UART_out_char(string[i]); 
  } /* for */
  
} /* msp_printf */