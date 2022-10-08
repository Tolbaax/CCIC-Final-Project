import 'package:social_app/models/login.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  late final LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ChangeVisibility extends LoginStates {}
