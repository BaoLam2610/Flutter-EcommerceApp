import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/configs.dart';
import '../../../../../core/core.dart';
import '../../../domain/entities/event_entity.dart';
import '../bloc/home_cubit.dart';

class BannerSliders extends StatelessWidget {
  const BannerSliders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.events != current.events ||
          previous.bannerCurrentIndex != current.bannerCurrentIndex,
      builder: (context, state) {
        if (state.status is Success) {
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
                    child: _buildImage(state.events[index]),
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
                    selectedIndex: ReadContext(context)
                        .read<HomeCubit>()
                        .bannerCurrentIndex,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
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

  _buildImage(EventEntity event) {
    return CachedNetworkImage(
      imageUrl: event.bannerUrl,
      imageBuilder: (context, imageProvider) {
        return _layoutImage(
          context,
          decorationImage: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return _layoutImage(
          context,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorWidget: (context, url, error) {
        return _layoutImage(
          context,
          child: const Icon(Icons.error),
        );
      },
    );
  }

  _layoutImage(
    BuildContext context, {
    Widget? child,
    DecorationImage? decorationImage,
  }) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        image: decorationImage,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: child,
    );
  }
}
