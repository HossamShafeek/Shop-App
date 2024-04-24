import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class SendCodeLoadingState extends AuthenticationState {}

class SendCodeSuccessState extends AuthenticationState {
}

class SendCodeFailureState extends AuthenticationState {
  final String error;

  SendCodeFailureState(this.error);
}
class ChangeSelectedCountryState extends AuthenticationState {
}

class LoginLoadingState extends AuthenticationState {}

class LoginSuccessState extends AuthenticationState {
  final User user;

  LoginSuccessState(this.user);
}

class LoginFailureState extends AuthenticationState {
  final String error;

  LoginFailureState(this.error);
}

class ChangeResendTimeState extends AuthenticationState {
}

class ChangeResendTimeForLoginState extends AuthenticationState {
}

class SaveUserDataLoadingState extends AuthenticationState {}

class SaveUserDataSuccessState extends AuthenticationState {
}

class SaveUserDataFailureState extends AuthenticationState {
  final String error;

  SaveUserDataFailureState(this.error);
}