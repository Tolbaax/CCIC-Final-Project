import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/profile/cubit/cubit.dart';
import 'package:social_app/modules/profile/cubit/states.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/components/widgets/ListTile.dart';
import 'package:social_app/shared/components/widgets/profileImage.dart';
import 'package:social_app/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Profile'),
            ),
            body: Center(
              child: Column(
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
                        child: cubit.profileImage == null
                            ? Image.network(
                                'https://pbs.twimg.com/profile_images/1571015638658830337/_KYbpzBz_400x400.jpg',
                              )
                            : Image.file(
                                cubit.profileImage!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 8.h,
                        right: 2.w,
                        child: BuildCameraIcon(
                          onPressed: () {
                            cubit.getProfileImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Mohamed Tolba',
                    style: TextStyle(
                      fontSize: 19.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const BuildEditButton(),
                  SizedBox(
                    height: 25.h,
                  ),
                  ProfileListTile(
                    title: 'Name',
                    leadingText: Text(
                      'Mohamed Tolba',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: AppColors.greyRegular,
                    endIndent: 25.w,
                    indent: 25.w,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ProfileListTile(
                    title: 'Email',
                    leadingText: Text(
                      'tolbaax@gmail.com',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: AppColors.greyRegular,
                    endIndent: 25.w,
                    indent: 25.w,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ProfileListTile(
                    title: 'Phone',
                    leadingText: Text(
                      '01273545783',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    color: AppColors.greyRegular,
                    endIndent: 25.w,
                    indent: 25.w,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const ProfileListTile(
                    title: 'Products',
                    leadingText: BuildEditButton(),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 80.h,
                    width: 275.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: imgList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: CircleAvatar(
                            backgroundColor:
                                AppColors.greyMedium.withOpacity(0.5),
                            radius: 40.r,
                            backgroundImage: NetworkImage(imgList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
