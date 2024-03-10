import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../bloc/home_cubit.dart';

class BannerSliders extends StatelessWidget {
  const BannerSliders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.events != current.events ||
          previous.bannerCurrentIndex != current.bannerCurrentIndex,
      builder: (context, state) {
        return Column(
          children: [
            /* Slider view */
            CarouselSlider.builder(
              itemCount: state.events.length,
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
                onPageChanged: (index, reason) => ReadContext(context)
                    .read<HomeCubit>()
                    .updateBannerCurrentIndex(index),
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIndex) {
                return MaterialEffect(
                  onTap: () {},
                  child: NetworkImageView(
                    imageUrl: state.events[index].bannerUrl,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                  ),
                );
              },
            ),
            SizedBox(height: 4.h),
            /* Dot indicator */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                state.events.length,
                (index) => _buildDotIndicator(
                  index: index,
                  selectedIndex:
                      ReadContext(context).read<HomeCubit>().bannerCurrentIndex,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDotIndicator({required int index, required int selectedIndex}) {
    return AnimatedContainer(
      duration: AppDurations.delayPagerIndicator,
      margin: EdgeInsets.only(right: 6.w),
      height: 6.h,
      width: selectedIndex == index ? 20.w : 6.w,
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? AppColors.current.primary
            : AppColors.current.primarySup,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
