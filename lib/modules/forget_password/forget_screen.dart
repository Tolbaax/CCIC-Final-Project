import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/components/widgets/textFormFiled.dart';
import 'package:social_app/shared/styles/images.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: 250.w,
              child: Lottie.asset(ImageAssets.forgetPassword),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 31.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text(
              'No worries, we\'ll send you reset instructions',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                right: 25.0,
                left: 25.0,
              ),
              child: DefaultTextFormFiled(
                label: 'Email',
                inputType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25.0,
                left: 25.0,
              ),
              child: InkWell(
                onTap: () {},
                child: const DefaultButton(title: 'Reset Password'),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8.0.w,
                  ),
                  const Text(
                    'Back To LogIn',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
