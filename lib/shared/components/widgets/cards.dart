import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:social_app/modules/home/cubit/cubit.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/styles/colors.dart';

class ProductCard extends StatelessWidget {
  final dynamic index;
  const ProductCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.get(context).productModel!.data!.records;
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 5.sp),
      child: AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 700),
          child: SlideAnimation(
            verticalOffset: 75.0,
            child: FadeInAnimation(
              child: SizedBox(
                height: 100.h,
                child: Card(
                  color: AppColors.greyLight,
                  shadowColor: AppColors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit![index].title.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.sp),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          cubit[index].description.toString(),
                          style: const TextStyle(color: AppColors.greyDark),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.price_check,
                                  size: 18.w,
                                  color: AppColors.steelBlue,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                    cubit[index]
                                        .price
                                        .toString()
                                        .replaceAll(regex, ''),
                                    maxLines: 1),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              cubit[index]
                                  .createdAt!
                                  .substring(0, 10)
                                  .toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
