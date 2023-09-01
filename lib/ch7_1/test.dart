class SuperClass {
  String name;
  int age;
  SuperClass(this.name, this.age){}
}
class SubClass extends SuperClass {
  SubClass(super.name, super.age);
}

