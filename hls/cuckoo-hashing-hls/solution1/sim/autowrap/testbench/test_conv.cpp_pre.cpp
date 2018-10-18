# 1 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/test/test_conv.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/test/test_conv.cpp"
# 1 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/test/../src/conv.h" 1
void axpy(int in[3], int a, int b, int out[3]);
# 2 "/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/test/test_conv.cpp" 2



int main() {
 int in[1][3] = {{1, 2, 3}};
 int a[1] = {1};
 int b[1] = {2};
 int gold[1][3];
 int out[1][3];




 for(int i = 0; i < 1; i++) {
  axpy(in[i], a[i], b[i], out[i]);
 }


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
