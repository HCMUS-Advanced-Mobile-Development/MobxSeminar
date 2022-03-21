import 'package:mobx/mobx.dart';

class Counter {
  late Action increment;

  Counter(){
    increment = Action(_increment);
  }

  final _value = Observable(0);

  int get value => _value.value;
  set value(int newValue) => _value.value = newValue;

  void increment2() {
    _value.value++;
  }

  void _increment() {
    _value.value++;
  }
}