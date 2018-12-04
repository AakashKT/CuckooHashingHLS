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
#include "types.h"
#include "xil_cache.h"
#include "xil_io.h"
#include <assert.h>
volatile  uint32_t *memory = (uint32_t*)(0x40000000);
volatile uint32_t *ints = (uint32_t*)(0x42000000);

const int NUM_ITEMS = 4;


void print_tag(OpType tag) {
	if (tag == OP_TYPE_INSERT) {
		xil_printf("OP_TYPE_INSERT");
	}
	else if (tag == OP_TYPE_DELETE) {
		xil_printf("OP_TYPE_DELETE");
	}
	else if (tag == OP_TYPE_SEARCH) {
		xil_printf("OP_TYPE_SEARCH");
	}
	else if (tag == OP_TYPE_ILLEGAL) {
		xil_printf("OP_TYPE_ILLEGAL");
	}
	else {
		xil_printf("GARBLED");
		assert(false && "unknown tag");
	}
}

void print_request(struct Request r) {
	xil_printf("tag: ");
	print_tag(r.tag);
	xil_printf("\n\r");
	xil_printf("key: %u\n\r", r.key);
	xil_printf("insert_value: %u\n\r", r.insert_value);
}

void print_response(struct Response r) {
	xil_printf("tag: ");
	print_tag(r.tag);
	xil_printf("\n\r");
	if (r.insert_collided) {
			xil_printf("ERROR: insert collided \n\r");
	}
	else if (r.search_element_not_found) {
		xil_printf("ERROR: search element not found \n\r");
	}
	else if (r.delete_element_not_found) {
		xil_printf("ERROR: delete element not found \n\r");
	}
	else {
		xil_printf("search value: %u", r.search_value);
	}

}


int main()
{
	Xil_DCacheDisable();
	// init_platform();
	uint32_t i = 0;
	print("123456789-123456789\n\r");


    printf("testing memory:\n\r");

    for(i = 0; i < 10; i++) {
    	memory[i] = 42;
    	assert(memory[i] == 42);

    	ints[i] = 42;
    	assert(ints[i] == 42);

    }
    xil_printf("calling lookupConfig\n\r");

    /*
    fpga_cfg = XTraffic_generate_and_execute_LookupConfig(XPAR_TRAFFIC_GENERATE_AND_EXECUTE_0_DEVICE_ID);

    print("123456789-123456789\n\r");
    if (fpga_cfg == NULL) {
    	xil_printf("FAILED TO INIT FPGA CONFIG OBJECT\n\r");
    	return -1;
    }

    const int cfg_status  = XTraffic_generate_and_execute_CfgInitialize(&fpga, fpga_cfg);
    if (cfg_status != XST_SUCCESS) {
    	xil_printf("FAILED TO INITIALIZE FPGA CONFIG | status: %d\n\r", cfg_status);
    	return -1;
    }


    */
    // XTraffic_generate_and_execute_Config *fpga_cfg = NULL;
    XTraffic_generate_and_execute fpga;
    const int fpga_status = XTraffic_generate_and_execute_Initialize(&fpga, XPAR_TRAFFIC_GENERATE_AND_EXECUTE_0_DEVICE_ID) ;
    if (fpga_status != XST_SUCCESS) {
    	xil_printf("FAILED TO INITIALIZE FPGA: | status: %d\n\r", fpga_status);
    	return -1;
    }
    else {
    	xil_printf("INITIALIZED FPGA.\n\r");
    }

    xil_printf("BOOTED UP FPGA SUCCESSFULLY \n\r");

    xil_printf("EXECUTING FPGA\n\r");
    XTraffic_generate_and_execute_Start(&fpga);

    uint32_t count = 0;
    while (1 != XTraffic_generate_and_execute_IsDone(&fpga)) {
		print(".");
		count += 1;
		if (count == 200 * 20) {
			count = 0;
			print("\r\n");
		}
    }
    xil_printf("EXECUTED FPGA!\n\r");
    xil_printf("-------\n\r");

    for(i = 0; i < NUM_ITEMS; i++) {

    	xil_printf("ints[%u] = %u\n\r", i, ints[i]);
    	assert(ints[i] == 2 * i);
    }
    xil_printf("FPGA PROGRAM IS CORRECT. NOW READING VALUES\n\r");

    for(i = 0; i < NUM_ITEMS; i++) {
    	xil_printf("\n\rREQUEST:\n\r");
    	Request req = request_unpack(memory + i * (REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE));
    	Response resp = response_unpack(memory + i * (REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE) + REQUEST_PACK_STRIDE);

    	print_request(req);
    	xil_printf("\n\rRESPONSE:\n\r");
    	print_response(resp);
    	xil_printf("\n\r----\n\r");

    }
    xil_printf("DONE.\n\r===\n\r");



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
    xil_printf("-------\n\r");
    cleanup_platform();
    return 0;
    */


}
