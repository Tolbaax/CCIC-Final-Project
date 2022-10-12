import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/profile/cubit/states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

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
}
