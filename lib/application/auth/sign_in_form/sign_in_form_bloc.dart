import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_flutter/application/auth/sign_in_form/sign_in_form_event.dart';
import 'package:ddd_flutter/application/auth/sign_in_form/sign_in_form_state.dart';
import 'package:ddd_flutter/domain/auth/auth_failure.dart';
import 'package:ddd_flutter/domain/auth/i_auth_facade.dart';
import 'package:ddd_flutter/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _iAuthFacade;

  SignInFormBloc(this._iAuthFacade);

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    yield* event.map(
      emailChanged: (ev) async* {
        yield state.copyWith(
            emailAddress: EmailAddress(ev.email),
            authFailureOrSuccessOption: none());
      },
      passwordChanged: (ev) async* {
        yield state.copyWith(
            password: Password(ev.password),
            authFailureOrSuccessOption: none());
      },
      registerWithEmailPressed: (ev) async* {
        yield* _callAuthFacadeWithCreds(
            _iAuthFacade.registerWithEmailAndPassword);
      },
      signInWithEmailPressed: (ev) async* {
        yield* _callAuthFacadeWithCreds(
            _iAuthFacade.signInWithEmailAndPassword);
      },
      signInWithGooglePressed: (ev) async* {
        yield state.copyWith(
          isSubmitted: true,
          authFailureOrSuccessOption: none(),
        );

        final failureOrSuccess = await _iAuthFacade.signInWithGoogle();
        yield state.copyWith(
            isSubmitted: false,
            authFailureOrSuccessOption: some(failureOrSuccess));
      },
    );
  }

  Stream<SignInFormState> _callAuthFacadeWithCreds(
      AuthAction authAction) async* {
    Either<AuthFailure, Unit> failureOrSuccess;
    if (state.emailAddress.isValid() && state.password.isValid()) {
      yield state.copyWith(
          isSubmitted: true, authFailureOrSuccessOption: none());

      failureOrSuccess = await authAction(
          emailAddress: state.emailAddress, password: state.password);
    }
    yield state.copyWith(
      isSubmitted: false,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
      showErrorMessages: true,
    );
  }
}
