import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_app/shared/styles/colors.dart';

class CarouseBuilder extends StatefulWidget {
  const CarouseBuilder({Key? key}) : super(key: key);

  @override
  State<CarouseBuilder> createState() => _CarouseBuilderState();
}

class _CarouseBuilderState extends State<CarouseBuilder> {
  dynamic activeIndex = 0;
  final List<String> imgList = [
    'https://i.pinimg.com/736x/ea/ad/d2/eaadd25afc2289535a13cd1355519ffd.jpg',
    'https://i.pinimg.com/564x/b5/15/a3/b515a3842d4ba9bd036bf7e5acb06480.jpg',
    'https://i.pinimg.com/564x/3d/ec/81/3dec81e1f82ab9577ef4dbc6b0367a1c.jpg',
    'https://i.pinimg.com/564x/55/38/e1/5538e1eb5677e390848ea610839a6dab.jpg',
    'https://i.pinimg.com/564x/df/dd/9c/dfdd9cb159e860687a8841f7930f224f.jpg',
  ];
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
