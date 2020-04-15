import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'failures.dart';

@immutable
abstract class ValueObject<T> {
  ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'ValueObject{$value}';
  }
}
