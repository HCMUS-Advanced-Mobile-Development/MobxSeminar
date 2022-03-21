import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:simple_mobx/temp.dart';

part 'counter_gen.g.dart';

class Counter2 = CounterBase with _$Counter2;

abstract class CounterBase with Store {
  late ReactionDisposer disposer;

  // @observable
  // var temp = Temp();

  void runReactionDisposer() {
    disposer = reaction(
      (_) => value,
      (value) {
        // increment();
        log('value: ${value}'); },
        // delay: 200
    );
  }

  void disposeReactionDisposer() {
    disposer();
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}