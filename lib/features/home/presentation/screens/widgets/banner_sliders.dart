import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';

class BannerSliders extends StatelessWidget {
  final int itemCount;

  final int currentIndex;

  final Function(int index)? onPageChanged;

  const BannerSliders({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* Slider view */
        CarouselSlider.builder(
          itemCount: itemCount,
          options: CarouselOptions(
            height: 150.h,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) => onPageChanged?.call(index),
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: context.width,
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.current.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
            );
          },
        ),
        SizedBox(height: 4.h),
        /* Dot indicator */
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            itemCount,
            (index) => _buildDotIndicator(index: index),
          ),
        ),
      ],
    );
  }

  Widget _buildDotIndicator({required int index}) {
    return AnimatedContainer(
      duration: AppDurations.delayPagerIndicator,
      margin: EdgeInsets.only(right: 6.w),
      height: 6.h,
      width: currentIndex == index ? 20.w : 6.w,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? AppColors.current.primary
            : AppColors.current.primarySup,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
