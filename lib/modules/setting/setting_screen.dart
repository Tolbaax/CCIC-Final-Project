import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/shared/components/widgets/ListTile.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';
import 'package:social_app/shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Account',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const AccountListTile(),
            SizedBox(
              height: 10.h,
            ),
            const Divider(color: AppColors.greyMedium),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const DefaultListTile(
              title: 'Notification',
              icon: Icons.notifications_active,
            ),
            const DefaultListTile(
              title: 'Language',
              icon: Icons.language,
            ),
            const DefaultListTile(
              title: 'Privacy',
              icon: Icons.privacy_tip_outlined,
            ),
            const DefaultListTile(
              title: 'Help Center',
              icon: Icons.help_outline,
            ),
            const DefaultListTile(
              title: 'About Us',
              icon: Icons.webhook,
            ),
            const Divider(color: AppColors.greyMedium),
            SizedBox(
              height: 5.h,
            ),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
