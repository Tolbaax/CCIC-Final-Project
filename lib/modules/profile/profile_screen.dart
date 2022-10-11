import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          const Icon(
            Icons.settings,
            color: AppColors.black,
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Stack(
            children: [
              Container(
                height: 100.h,
                width: 140.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.darkCerulean.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                    'https://pbs.twimg.com/profile_images/1571015638658830337/_KYbpzBz_400x400.jpg'),
              ),
            ],
          ),
          const Spacer(),
          const LogoutButton(),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
