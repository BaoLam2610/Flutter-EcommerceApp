import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import 'bloc/home_cubit.dart';
import 'widgets/banner_sliders.dart';
import 'widgets/menu_functions.dart';
import 'widgets/selling_products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshLoadMore(
      onLoadMore: () async {
        await postDelay(seconds: 3);
      },
      onRefresh: () async {
        await postDelay(seconds: 3);
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            _buildBannerSliders,
            SizedBox(height: 10.h),
            const MenuFunctions(),
            SizedBox(height: 10.h),
            const SellingProducts(),
          ],
        ),
      ),
    );
  }

  Widget get _buildBannerSliders => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BannerSliders(
            itemCount: 6,
            currentIndex: state.bannerCurrentIndex,
            onPageChanged:
                ReadContext(context).read<HomeCubit>().updateBannerCurrentIndex,
          );
        },
      );
}
