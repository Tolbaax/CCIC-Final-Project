import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/modules/register/cubit/cubit.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/images.dart';

class BuildProfileImage extends StatelessWidget {
  final dynamic profileImage;
  const BuildProfileImage({Key? key, required this.profileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          BuildImage(
            profileImage: profileImage,
          ),
          Positioned(
            bottom: 8.h,
            right: 2.w,
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
                blurRadius: 5.0.r,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 80.r,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.darkCerulean,
              size: 15.h,
            ),
          ),
        ),
      ),
      splashRadius: 20,
    );
  }
}

class BuildImage extends StatelessWidget {
  final dynamic profileImage;
  const BuildImage({Key? key, required this.profileImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 140.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.darkCerulean.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: profileImage != null
          ? Image.file(
              profileImage!,
              fit: BoxFit.cover,
            )
          : Lottie.asset(ImageAssets.profileImage),
    );
  }
}
