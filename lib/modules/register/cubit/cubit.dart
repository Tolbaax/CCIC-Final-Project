import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/login.dart';
import 'package:social_app/modules/register/cubit/states.dart';
import 'package:social_app/shared/components/widgets/toastMessage.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/network/remote/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //TODO: SELECT PROFILE IMAGE
  File? profileImage;
  final picker = ImagePicker();
  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path).absolute;
      emit(ProfileImagePickedSuccess());
    } else {
      if (kDebugMode) {
        print('No image selected');
        emit(ProfileImagePickedError());
      }
    }
  }

  // TODO: CREATE USER
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late LoginModel loginModel;
  DioHelper dio = DioHelper();
  userRegister() async {
    if (formKey.currentState!.validate() && profileImage != null) {
      emit(RegisterLoadingState());
      var formData = FormData.fromMap({
        'name': name.text,
        'email': email.text,
        'phone': phone.text,
        'password': password.text,
        'image': await MultipartFile.fromFile(profileImage!.path),
      });
      await dio.postData(path: REGISTER, data: formData).then(
        (value) {
          loginModel = LoginModel.fromJson(value.data);
          emit(RegisterSuccessState(loginModel: loginModel));
        },
      ).catchError((error) {
        emit(RegisterErrorState(error.toString()));
        log(error.toString());
      });
    }
    if (profileImage == null) {
      showToast(text: 'Select An Image', state: ToastState.error);
    }
  }

  //TODO: CHANGE VISIBILITY
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibility());
  }
}
