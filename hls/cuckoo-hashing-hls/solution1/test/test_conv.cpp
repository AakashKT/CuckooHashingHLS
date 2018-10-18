#include "../src/conv.h"

// https://www.xilinx.com/video/hardware/getting-started-vivado-high-level-synthesis.html

int main() {
	int in[1][3]  = {{1, 2, 3}};
	int a[1] = {1};
	int b[1] = {2};
	int gold[1][3];
	int out[1][3];



	// test FPGA
	for(int i = 0; i < 1; i++) {
		axpy(in[i], a[i], b[i], out[i]);
	}

	// generate gold
	for(int i = 0; i < 1; i++) {
		for(int j = 0; j < 3; j++) {
			gold[i][j] = a[i] * in[i][j] + b[i];
		}
	}

	for(int i = 0; i < 1; i++) {
		for(int j = 0; j < 3; j++) {
			if(gold[i][j] != out[i][j]) return 1;
		}
	}

	return 0;
}
