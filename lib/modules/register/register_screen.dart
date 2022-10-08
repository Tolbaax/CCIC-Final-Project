import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/modules/register/cubit/cubit.dart';
import 'package:social_app/modules/register/cubit/states.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/components/widgets/logo.dart';
import 'package:social_app/shared/components/widgets/navigation.dart';
import 'package:social_app/shared/components/widgets/textFormFiled.dart';
import 'package:social_app/shared/components/widgets/toastMessage.dart';
import 'package:social_app/shared/network/lcoal/cache_helper.dart';
import 'package:social_app/shared/resources/input_validator.dart';
import 'package:social_app/shared/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              if (state.loginModel.status!) {
                CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data!.userDetails!.rememberToken,
                ).then((value) {
                  token = state.loginModel.data!.userDetails!.rememberToken;
                  showToast(
                      text: 'Registered Successfully',
                      state: ToastState.success);
                  navigateAndFinish(context, const LoginScreen());
                });
              } else {
                showToast(text: state.loginModel.msg!, state: ToastState.error);
              }
            }
          },
          builder: (context, state) {
            final cubit = RegisterCubit.get(context);
            return Scaffold(
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: AppColors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        const LogoContainer(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180.0,
                    bottom: 0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: SingleChildScrollView(
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cubit.getProfileImage();
                                  },
                                  child: Container(
                                    height: 100.h,
                                    width: 100.w,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: AppColors.darkCerulean
                                          .withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        if (cubit.profileImage != null)
                                          Image.file(
                                            cubit.profileImage!,
                                            fit: BoxFit.contain,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                DefaultTextFormFiled(
                                  controller: cubit.name,
                                  label: 'Name',
                                  hintText: 'Enter your Name',
                                  inputType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validator: nameValidator,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                DefaultTextFormFiled(
                                  controller: cubit.email,
                                  label: 'Email',
                                  hintText: 'Enter your Email',
                                  inputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: emailValidator,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                DefaultTextFormFiled(
                                  controller: cubit.phone,
                                  label: 'Phone',
                                  hintText: 'Enter your Phone',
                                  inputType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  validator: phoneValidator,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                DefaultTextFormFiled(
                                  controller: cubit.password,
                                  label: 'Password',
                                  hintText: 'Enter your Password',
                                  secure: cubit.isPassword,
                                  inputType: TextInputType.visiblePassword,
                                  suffix: cubit.suffix,
                                  suffixTab: () {
                                    cubit.changeVisibility();
                                  },
                                  validator: passwordValidator,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                state is! RegisterLoadingState
                                    ? DefaultButton(
                                        onTap: () {
                                          cubit.userRegister();
                                        },
                                        title: 'Register',
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.darkCerulean,
                                        ),
                                      ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
