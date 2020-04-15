import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_event.freezed.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String email) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String password) = PasswordChanged;
  const factory SignInFormEvent.registerWithEmailPressed() = RegisterWithEmailPressed;
  const factory SignInFormEvent.signInWithEmailPressed() = SignInWithEmailPressed;
  const factory SignInFormEvent.signInWithGooglePressed() = SignInWithGooglePressed;
}
