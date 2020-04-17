import 'package:ddd_flutter/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() => Error.safeToString(
      'Encountered Unexpected Value Error at an unrecoverable point. Terminating.'
      '\nFailure was: $valueFailure');
}
