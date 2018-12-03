/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"
#include <xtoplevel.h>
#include <xparameters.h>

const volatile UINTPTR MEMORY = (UINTPTR)(0x40000000);
const volatile UINTPTR REG = (UINTPTR)(0x43C00000);

XToplevel toplevel;
XToplevel_Config *toplevel_cfg;


int main()
{
	u32 i, j;
    xil_printf("HELLO WORLD\r\n");

	//init_platform();
	init_uart();

    xil_printf("INITIALIZED PLATFORM, NOW INITIALIZING TOPLEVEL\r\n");

    toplevel_cfg = XToplevel_LookupConfig(XPAR_TOPLEVEL_1_DEVICE_ID);

    if (toplevel_cfg == NULL) {
    	xil_printf("FAILED TO INIT toplevel_cfg");
    	return 0;
    }

    int status  = XToplevel_CfgInitialize(&toplevel, toplevel_cfg);
    xil_printf("status: %u\r\n", status);

    if (status != XST_SUCCESS) {
    	xil_printf("FAILED TO INIT!!");
    	return -1;
    }

    xil_printf("INITIALIZED SUCCESSFULLY!\r\n");

    xil_printf("Hello World\r\n");



	print("MEMORY CONTENTS BEFORE CALL:\r\n");
	for(j = 0; j < 40; j++) {
		xil_printf("WRITING j: %u\r\n", j);
		Xil_Out32(MEMORY + j, j);
	}

	for(j = 0; j < 40; j++) {
		xil_printf("MEMORY + j: %x\n", MEMORY + j);
		u32 z = Xil_In32(MEMORY + j);
	    xil_printf("MEM[%u] = %u\r\n", j, z);

	}

    return 0;

    for(i = 0; i < 20; i++) {
    	print("CALLING FPGA...\r\n");
    	XToplevel_Start(&toplevel);

    	volatile u32 WAIT = 0;
    	while (!XToplevel_IsDone(&toplevel)) {
    		print(".");
    		WAIT++;
    		if (WAIT > 1000) {
    			WAIT = 0;
    			print("\r\n");
    		}
    	}


    	print("\r\n");

    	volatile  u32 regval = Xil_In32(REG);
    	xil_printf("REGVAL: %u |\r\n", regval);

    	// const int regval_high = (int)XToplevel_ReadReg(XPAR_TOPLEVEL_1_S_AXI_AXILITES_HIGHADDR - 4, 0);
    	// xil_printf("ANSWER (REG FROM HIGHADDR): %d|\r\n", regval_high);


    	xil_printf("\r\n");
    }

    xil_printf("DONE");


    return 0;

}
