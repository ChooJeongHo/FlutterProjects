String _name = 'hello';

String get name {
  return _name.toUpperCase();
}
set name(value) {
  _name = value;
}
//........................
main() {
  name = "world";
  print('name = $name');
}