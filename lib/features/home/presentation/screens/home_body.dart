import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../../core/widgets/loading/loading_view.dart';
import 'bloc/home_cubit.dart';
import 'widgets/banner_sliders.dart';
import 'widgets/menu_functions.dart';
import 'widgets/selling_products.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        state.listenerUnauthorized(context);
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status is Success) {
          return _buildSuccessArea(context);
        }
        if (state.status is Loading) {
          return const LoadingView();
        }
        if (state.status is Error) {
          return ErrorView(
            onTapReload: () =>
                ReadContext(context).read<HomeCubit>().getHomeData(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSuccessArea(BuildContext context) =>
      BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            previous.canLoadMoreSellingProducts !=
            current.canLoadMoreSellingProducts,
        builder: (context, state) {
          return RefreshLoadMore(
            onLoadMore: () async {
              await ReadContext(context)
                  .read<HomeCubit>()
                  .onSellingProductsLoadMore();
            },
            onRefresh: () async {
              await ReadContext(context).read<HomeCubit>().onReloadHomeData();
            },
            canLoadMore: state.canLoadMoreSellingProducts,
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
        },
      );
}
