import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/layout/layout_screen.dart';
import 'package:social_app/modules/forget_password/forget_screen.dart';
import 'package:social_app/modules/login/cubit/cubit.dart';
import 'package:social_app/modules/login/cubit/states.dart';
import 'package:social_app/modules/register/register_screen.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/components/widgets/logo.dart';
import 'package:social_app/shared/components/widgets/navigation.dart';
import 'package:social_app/shared/components/widgets/textFormFiled.dart';
import 'package:social_app/shared/components/widgets/toastMessage.dart';
import 'package:social_app/shared/network/lcoal/cache_helper.dart';
import 'package:social_app/shared/resources/input_validator.dart';
import 'package:social_app/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.userDetails!.rememberToken,
              ).then((value) {
                token = state.loginModel.data!.userDetails!.rememberToken;
                showToast(
                    text: 'Login Successfully', state: ToastState.success);
                navigateAndFinish(context, const LayoutScreen());
              });
            } else {
              showToast(text: state.loginModel.msg!, state: ToastState.error);
            }
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.get(context);
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
                                'Login',
                                style: TextStyle(
                                  fontSize: 45.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              DefaultTextFormFiled(
                                controller: cubit.emailController,
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
                                controller: cubit.passwordController,
                                label: 'Password',
                                hintText: 'Enter your Password',
                                secure: cubit.isPassword,
                                inputType: TextInputType.visiblePassword,
                                validator: passwordValidator,
                                suffix: cubit.suffix,
                                suffixTab: () {
                                  cubit.changeVisibility();
                                },
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    navigateTo(context, const ForgotScreen());
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: AppColors.darkCerulean),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              state is! LoginLoadingState
                                  ? DefaultButton(
                                      onTap: () {
                                        cubit.userLogin();
                                      },
                                      title: 'Login',
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.darkCerulean,
                                      ),
                                    ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have any account? ',
                                    style: TextStyle(
                                      fontSize: 15.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(
                                          context, const RegisterScreen());
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.only(left: 0)),
                                    ),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkCerulean,
                                      ),
                                    ),
                                  ),
                                ],
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
    );
  }
}
