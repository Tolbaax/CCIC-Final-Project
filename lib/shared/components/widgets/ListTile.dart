import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/profile/profile_screen.dart';
import 'package:social_app/shared/components/widgets/navigation.dart';
import 'package:social_app/shared/styles/colors.dart';

class DefaultListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const DefaultListTile({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 15.sp),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.black.withOpacity(0.8),
            radius: 22.sp,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.darkCerulean,
          )
        ],
      ),
    );
  }
}

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, const ProfileScreen());
      },
      child: Row(
        children: [
          OpenContainer(
            closedElevation: 0,
            closedShape: const CircleBorder(),
            transitionDuration: const Duration(milliseconds: 600),
            openBuilder: (context, _) => const ProfileScreen(),
            closedBuilder: (context, openContainer) => Container(
              height: 67.h,
              width: 72.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1571015638658830337/_KYbpzBz_400x400.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
                border: Border.all(
                  color: AppColors.black.withOpacity(0.9),
                  width: 2.5.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Tolba',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'tolbaax@gmail.com',
                style: TextStyle(
                  color: AppColors.greyMedium,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.darkCerulean,
          )
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final Widget leadingText;
  const ProfileListTile({
    Key? key,
    required this.title,
    required this.leadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.sp),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 15.sp,
            ),
          ),
          const Spacer(),
          leadingText,
        ],
      ),
    );
  }
}
