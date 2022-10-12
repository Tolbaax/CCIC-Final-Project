import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/styles/colors.dart';

class CarouseBuilder extends StatefulWidget {
  const CarouseBuilder({Key? key}) : super(key: key);

  @override
  State<CarouseBuilder> createState() => _CarouseBuilderState();
}

class _CarouseBuilderState extends State<CarouseBuilder> {
  dynamic activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: NetworkImage(item),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              height: 145.h,
              autoPlay: true,
              viewportFraction: 0.5,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: ((index, reason) {
                setState(() {
                  activeIndex = index;
                });
              })),
        ),
        SizedBox(
          height: 15.h,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imgList.length,
          effect: WormEffect(
            dotHeight: 9.h,
            dotWidth: 10.w,
            dotColor: AppColors.greyRegular,
            activeDotColor: AppColors.darkCerulean,
          ),
        )
      ],
    );
  }
}
