/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

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
#include <stdint.h>
#include "xil_printf.h"
#include "xtraffic_generate_and_execute.h"
#include "xparameters.h"


volatile uint64_t *memory = (uint64_t*)(0x40000000);


XTraffic_generate_and_execute_Config *fpga_cfg = NULL;
XTraffic_generate_and_execute fpga;

// try to initialize the FPGA, return -1 on error
int init_fpga() {
    xil_printf("calling lookupConfig\n\r");


    fpga_cfg = XTraffic_generate_and_execute_LookupConfig(XPAR_TRAFFIC_GENERATE_AND_EXECUTE_0_DEVICE_ID);

    xil_printf("!!!!!!!!!!!!!!!!!!!!!!\n\r");
    if (fpga_cfg == NULL) {
    	xil_printf("FAILED TO INIT FPGA CONFIG OBJECT\n\r");
    	return -1;
    }

    int status  = XTraffic_generate_and_execute_CfgInitialize(&fpga, fpga_cfg);
    if (status != XST_SUCCESS) {
    	xil_printf("FAILED TO INITIALIZE FPGA USING CONFIG | status: %d\n\r", status);
    	return -1;
    }

    xil_printf("INITIALIZED FPGA SUCCESSFULLY \n\r");

    return 0;


}


int main()
{
    // init_platform();

    xil_printf("-------\n\r");
    xil_printf("-------\n\r");
    xil_printf("-------\n\r");

    xil_printf("calling lookupConfig\n\r");


    fpga_cfg = XTraffic_generate_and_execute_LookupConfig(XPAR_TRAFFIC_GENERATE_AND_EXECUTE_0_DEVICE_ID);

    xil_printf("!!!!!!!!!!!!!!!!!!!!!!\n\r");
    if (fpga_cfg == NULL) {
    	xil_printf("FAILED TO INIT FPGA CONFIG OBJECT\n\r");
    	return -1;
    }

    int status  = XTraffic_generate_and_execute_CfgInitialize(&fpga, fpga_cfg);
    if (status != XST_SUCCESS) {
    	xil_printf("FAILED TO INITIALIZE FPGA USING CONFIG | status: %d\n\r", status);
    	return -1;
    }

    xil_printf("INITIALIZED FPGA SUCCESSFULLY \n\r");


    uint32_t i;
    for(i = 0; i < 30; i++) memory[i] = i;

    for(i = 0; i < 5; i++) {
    	xil_printf("memory[%u] = %u\n\r", i, memory[i]);
    }

    xil_printf("Hello World\n\r");
    xil_printf("-------\n\r");

    return 0;


    /*
    const int INIT_FPGA = init_fpga();
    if (-1 == INIT_FPGA) {
    	return 1;
    }
    */

    /*
    for(i = 0; i < 30; i++) memory[i] = i;

    for(i = 0; i < 5; i++) {
    	xil_printf("memory[%u] = %u\n\r", i, memory[i]);
    }
    */

    xil_printf("-------\n\r");
    cleanup_platform();
    return 0;
}
