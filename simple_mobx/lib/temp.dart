import 'package:mobx/mobx.dart';

part 'temp.g.dart';

class Temp = _Temp with _$Temp;

abstract class _Temp with Store {
  @observable
  int x = 0;

  @observable
  int y = 0;
}