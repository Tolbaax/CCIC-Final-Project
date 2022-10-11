import 'package:flutter/material.dart';
import 'package:social_app/shared/components/widgets/buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Center(
              child: LogoutButton(),
            ),
          ),
        ],
      ),
    );
  }
}
