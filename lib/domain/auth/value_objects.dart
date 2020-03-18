import 'package:dartz/dartz.dart';
import 'package:ddd_flutter/domain/core/failures.dart';
import 'package:ddd_flutter/domain/core/value_objects.dart';
import 'package:ddd_flutter/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String value) {
    assert(value != null);
    return EmailAddress._(validateEmailAddress(value));
  }

  EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String value) {
    assert(value != null);
    return Password._(validatePassword(value));
  }

  Password._(this.value);
}
