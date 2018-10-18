# 1 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/src/conv.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/src/conv.cpp"
void axpy(int in[3], int a, int b, int out[3]) {
 int x,y;
 for(int i = 0; i < 3; i++) {
  x = in[i];
  y = a*x + b;
  out[i] = y;
 }
}
