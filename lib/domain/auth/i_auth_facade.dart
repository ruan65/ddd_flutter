import 'package:dartz/dartz.dart';
import 'package:ddd_flutter/domain/auth/auth_failure.dart';
import 'package:ddd_flutter/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

typedef Future<Either<AuthFailure, Unit>> AuthAction({
  @required EmailAddress emailAddress,
  @required Password password,
});

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
