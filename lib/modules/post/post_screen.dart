import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/modules/post/cubit/cubit.dart';
import 'package:social_app/modules/post/cubit/states.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/components/widgets/textCategory.dart';
import 'package:social_app/shared/components/widgets/toastMessage.dart';
import 'package:social_app/shared/resources/input_validator.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/images.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    return BlocProvider(
      create: (BuildContext context) => PostHandlerCubit(),
      child: BlocConsumer<PostHandlerCubit, PostHandlerStates>(
        listener: (context, state) {
          if (state is UploadPostSuccessState) {
            showToast(
                text: 'Product Uploaded Successfully',
                state: ToastState.success);
          }
        },
        builder: (context, state) {
          final cubit = PostHandlerCubit.get(context);
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Create Product'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCategory(
                          controller: cubit.titleController,
                          validator: titleValidator,
                          title: 'Product Name',
                          hintText: 'Corner Chair',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: TextCategory(
                                controller: cubit.priceController,
                                validator: salaryValidator,
                                inputType: TextInputType.number,
                                title: 'Salary',
                                hintText: '2800',
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: TextCategory(
                                controller: cubit.dateController,
                                title: 'Date',
                                inputType: TextInputType.none,
                                hintText: DateFormat.yMMMd().format(dateTime),
                                onTab: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2030))
                                      .then((value) {
                                    cubit.dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextCategory(
                          controller: cubit.descController,
                          validator: descValidator,
                          title: 'Description',
                          inputType: TextInputType.multiline,
                          maxLength: 150,
                          hintText: 'Enter Your Description',
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: AppColors.greyMedium,
                          child: GestureDetector(
                            onTap: () {
                              cubit.getPostImage();
                            },
                            child: Container(
                              height: 160,
                              width: 220.w,
                              color: AppColors.greyLight.withOpacity(0.5),
                              child: cubit.postImage != null
                                  ? Image.file(
                                      cubit.postImage!,
                                      fit: BoxFit.cover,
                                    )
                                  : Lottie.asset(ImageAssets.profileImage),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        state is! UploadPostLoadingState
                            ? SizedBox(
                                width: 250.w,
                                child: DefaultButton(
                                  onTap: () {
                                    cubit.uploadProduct();
                                  },
                                  title: 'Add Product',
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.darkCerulean,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
