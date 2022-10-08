import 'package:social_app/models/login.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  late final LoginModel loginModel;
  RegisterSuccessState({required this.loginModel});
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class ChangeVisibility extends RegisterStates {}

class ProfileImagePickedSuccess extends RegisterStates {}

class ProfileImagePickedError extends RegisterStates {}

class Test extends RegisterStates {}
