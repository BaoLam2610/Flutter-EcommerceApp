import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../../gen/gen.dart';
import 'bloc/home_cubit.dart';
import 'widgets/banner_sliders.dart';
import 'widgets/menu_functions.dart';
import 'widgets/selling_products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status is Success) {
          return _buildSuccessArea(context);
        }
        if (state.status is Loading) {
          return _buildLoadingArea;
        }
        if (state.status is Error) {
          return _buildErrorArea(context);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildErrorArea(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.error_system.tr(),
            style: AppTextStyles.regular18,
          ),
          SizedBox(height: 8.h),
          AppButton.primary(
            width: 80.w,
            text: LocaleKeys.reload_again.tr(),
            onTap: () {
              ReadContext(context).read<HomeCubit>().getHomeData();
            },
          ),
        ],
      );

  Widget get _buildLoadingArea =>
      const Center(child: CircularProgressIndicator());

  Widget _buildSuccessArea(BuildContext context) => RefreshLoadMore(
        onLoadMore: () async {
          await postDelay(seconds: 3);
        },
        onRefresh: () async {
          await ReadContext(context).read<HomeCubit>().getHomeData(isRefresh: true);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const BannerSliders(),
              SizedBox(height: 10.h),
              const MenuFunctions(),
              SizedBox(height: 10.h),
              const SellingProducts(),
            ],
          ),
        ),
      );
}
