import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/modules/home/cubit/cubit.dart';
import 'package:social_app/modules/home/cubit/states.dart';
import 'package:social_app/shared/components/widgets/cards.dart';
import 'package:social_app/shared/components/widgets/carousel_slider.dart';
import 'package:social_app/shared/components/widgets/textFormFiled.dart';
import 'package:social_app/shared/styles/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProductCubit.get(context).productModel!.data!.records;
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 15.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextFormFiled(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                      hintText: 'Search',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const CarouseBuilder(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text('Products:',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    cubit!.isNotEmpty
                        ? SizedBox(
                            height: 325.h,
                            width: double.infinity,
                            child: AnimationLimiter(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: cubit.length,
                                itemBuilder: (context, index) {
                                  return ProductCard(index: index);
                                },
                              ),
                            ),
                          )
                        : Center(
                            child: Lottie.asset(ImageAssets.empty),
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
