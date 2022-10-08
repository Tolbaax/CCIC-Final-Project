import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_app/modules/add_product/add_product_screen.dart';
import 'package:social_app/modules/home/home_screen.dart';
import 'package:social_app/modules/profile/profile_screen.dart';
import 'package:social_app/shared/components/widgets/navBarsItems.dart';
import 'package:social_app/shared/styles/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = PersistentTabController(initialIndex: 0);
    List<Widget> screens = [
      const HomeScreen(),
      const AddProductScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        screens: screens,
        items: navBarsItems(),
        resizeToAvoidBottomInset: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        backgroundColor: AppColors.black.withOpacity(0.8),
        margin: EdgeInsets.only(
            left: 20.sp, bottom: 10.sp, right: 20.sp, top: 10.sp),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 250),
        ),
      ),
    );
  }
}
