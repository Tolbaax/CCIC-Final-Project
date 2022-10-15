import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/login.dart';
import 'package:social_app/modules/login/cubit/states.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);

  // TODO: USER LOGIN
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  // TODO: CHANGE VISIBILITY
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibility());
  }

  //TODO: USER LOGIN
  LoginModel? loginModel;
  DioHelper dio = DioHelper();
  void userLogin() {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var formData = FormData.fromMap({
        'email': emailController.text,
        'password': passwordController.text,
      });
      dio.postData(path: LOGIN, data: formData).then((value) {
        loginModel = LoginModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel: loginModel!));
      }).catchError(
        (error) {
          emit(LoginErrorState(error.toString()));
          log(error.toString());
        },
      );
    }
  }
}
