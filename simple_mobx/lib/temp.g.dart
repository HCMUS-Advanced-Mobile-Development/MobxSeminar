// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Temp on _Temp, Store {
  final _$xAtom = Atom(name: '_Temp.x');

  @override
  int get x {
    _$xAtom.reportRead();
    return super.x;
  }

  @override
  set x(int value) {
    _$xAtom.reportWrite(value, super.x, () {
      super.x = value;
    });
  }

  final _$yAtom = Atom(name: '_Temp.y');

  @override
  int get y {
    _$yAtom.reportRead();
    return super.y;
  }

  @override
  set y(int value) {
    _$yAtom.reportWrite(value, super.y, () {
      super.y = value;
    });
  }

  @override
  String toString() {
    return '''
x: ${x},
y: ${y}
    ''';
  }
}
