main() {
  var list = List<int>.filled(3, 0, growable: true);
  list[0] = 10;
  list[1] = 20;
  list[2] = 30;
  list.add(40); // Error
  print(list);

  Map<String, String> map = {'one' : 'hello', 'two' : 'world'};
  print('${map['one']}, ${map['two']}');
}