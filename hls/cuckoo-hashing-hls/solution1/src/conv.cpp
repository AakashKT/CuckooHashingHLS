void axpy(int in[3], int a, int b, int out[3]) {
	int x,y;
	for(int i = 0; i < 3; i++) {
		x = in[i];
		y = a*x + b;
		out[i] = y;
	}
}
