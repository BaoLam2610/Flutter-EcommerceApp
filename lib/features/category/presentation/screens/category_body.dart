import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../../../core/widgets/loading/loading_view.dart';
import '../../../shared/shared.dart';
import 'bloc/category_cubit.dart';
import 'widgets/category_tile.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status is Loading) {
          return const LoadingView();
        }

        if (state.status is Error) {
          return ErrorView(
            onTapReload:
                ReadContext(context).read<CategoryCubit>().getCategories,
          );
        }

        if (state.status is Success) {
          return _buildSuccessArea(context);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildSuccessArea(BuildContext context) {
    return Container(
      color: AppColors.current.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: _buildCategoryColumn,
          ),
          Container(
            width: 1.w,
            height: context.height,
            color: AppColors.current.line,
          ),
          Expanded(
            flex: 3,
            child: _buildProductColumn,
          ),
        ],
      ),
    );
  }

  Widget get _buildCategoryColumn {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          previous.categories != current.categories,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.categories.length,
          itemBuilder: (context, index) => CategoryTile(
            category: state.categories[index],
          ),
        );
      },
    );
  }

  Widget get _buildProductColumn {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          previous.productStatus != current.productStatus,
      builder: (context, state) {
        if (state.productStatus is Loading) {
          return const LoadingView();
        }

        if (state.productStatus is Error) {
          return ErrorView(
            onTapReload: () => ReadContext(context)
                .read<CategoryCubit>()
                .onReloadProducts(isShowLoading: true),
          );
        }

        if (state.productStatus is Success) {
          if (state.products.isNotEmpty) {
            return _productsArea;
          }
          return EmptyView(
            onTapReload: () => ReadContext(context)
                .read<CategoryCubit>()
                .onReloadProducts(isShowLoading: true),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget get _productsArea {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          previous.canLoadMoreProducts != current.canLoadMoreProducts ||
          previous.products != current.products,
      builder: (context, state) {
        return RefreshLoadMore(
          onLoadMore: () async {
            await ReadContext(context)
                .read<CategoryCubit>()
                .onProductsLoadMore();
          },
          onRefresh: () async {
            await ReadContext(context).read<CategoryCubit>().onReloadProducts();
          },
          canLoadMore: state.canLoadMoreProducts,
          child: MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            itemCount: state.products.length,
            itemBuilder: (context, index) => ProductTile.grid(
              state.products[index],
              displayPriceDirection: DisplayPriceDirection.vertical,
              imageAspectRatio: 2.5,
            ),
          ),
        );
      },
    );
  }
}
