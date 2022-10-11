import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.list_bullet_indent),
      title: ("Home"),
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
      activeColorPrimary: CupertinoColors.systemTeal,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: ("Post"),
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
      activeColorPrimary: CupertinoColors.systemTeal,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.perm_identity),
      title: ("Profile"),
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
      activeColorPrimary: CupertinoColors.systemTeal,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.white,
    ),
  ];
}
