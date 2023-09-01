void some1(int data1, {required String? data2, bool data3 = false}){}

main() {
  some1(10, data3: true, data2: 'hello');
}