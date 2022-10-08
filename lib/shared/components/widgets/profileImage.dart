import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/register/cubit/cubit.dart';
import 'package:social_app/shared/styles/colors.dart';

class BuildProfileImage extends StatelessWidget {
  const BuildProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const BuildImage(),
          Positioned(
            bottom: 0.0,
            right: 33.w,
            child: buildCameraIcon(context),
          ),
        ],
      ),
    );
  }

  Widget buildCameraIcon(context) {
    return IconButton(
      onPressed: () {
        RegisterCubit.get(context).getProfileImage();
      },
      icon: CircleAvatar(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5.0,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.greyDark,
              size: 2.4.h,
            ),
          ),
        ),
      ),
      splashRadius: 20,
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var profileImage = RegisterCubit.get(context).profileImage;
    final image = const NetworkImage('imagePath');

    return Center(
      child: ClipOval(
        child: Material(
          child: Container(
            height: 100.h,
            width: 100.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (profileImage != null)
                  Image.file(
                    profileImage,
                    fit: BoxFit.contain,
                  ),
                const Icon(Icons.camera_alt_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
