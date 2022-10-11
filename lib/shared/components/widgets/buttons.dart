import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  const DefaultButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0.sp,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              content: Text(
                'Are you sure want to exit?',
                style: TextStyle(color: Colors.grey.shade400),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    signOut(context);
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              backgroundColor: AppColors.black.withOpacity(0.9),
            );
          },
        );
      },
      child: Row(
        children: const [
          Icon(
            Icons.logout,
            color: AppColors.black,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Log Out',
            style: TextStyle(color: AppColors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
