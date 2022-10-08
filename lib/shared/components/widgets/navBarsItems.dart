import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_app/shared/styles/colors.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.list_bullet_indent),
      title: ("Home"),
      activeColorPrimary: AppColors.diamond,
      inactiveColorPrimary: CupertinoColors.systemGrey5,
      activeColorSecondary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.add),
      title: ("Product"),
      activeColorPrimary: AppColors.diamond,
      inactiveColorPrimary: CupertinoColors.systemGrey5,
      activeColorSecondary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.perm_identity),
      title: ("Profile"),
      activeColorPrimary: AppColors.diamond,
      inactiveColorPrimary: CupertinoColors.systemGrey5,
      activeColorSecondary: Colors.white,
    ),
  ];
}
