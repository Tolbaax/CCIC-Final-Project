import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/post/cubit/states.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/network/remote/end_points.dart';

class PostHandlerCubit extends Cubit<PostHandlerStates> {
  PostHandlerCubit() : super(PostHandlerInitState());
  static PostHandlerCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  //TODO: SELECT POST IMAGE
  File? postImage;
  final picker = ImagePicker();
  Future getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    } else {
      if (kDebugMode) {
        print('No image selected');
        emit(PostImagePickedErrorState());
      }
    }
  }

  //TODO: UPLOAD PRODUCT
  DioHelper dio = DioHelper();
  List<String> imagesURL = [];

  Future<void> uploadProduct() async {
    if (formKey.currentState!.validate() && postImage != null) {
      emit(UploadPostLoadingState());
      var formData = FormData.fromMap({
        'title': titleController.text,
        'active': 1,
        'price': priceController.text,
        'image': await MultipartFile.fromFile(postImage!.path),
        'description': descController.text,
        'category_id': 4,
      });
      await dio.postData(path: PRODUCT, data: formData).then(
        (value) {
          emit(UploadPostSuccessState());
          titleController.clear();
          priceController.clear();
          descController.clear();
          dateController.clear();
          postImage = null;
        },
      ).catchError((error) {
        emit(UploadPostErrorState());
        log(error.toString());
      });
    }
    // if (postImage == null) {
    //   showToast(text: 'Select an image', state: ToastState.error);
    // }
  }
}
