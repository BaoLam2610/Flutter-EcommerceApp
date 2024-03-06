import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshLoadMore extends StatefulWidget {
  /// Create load more layout.
  /// Note: [child] parameter must a ListView.
  const RefreshLoadMore({
    required this.child,
    super.key,
    this.onRefresh,
    this.onLoadMore,
    this.canLoadMore = true,
  });

  /// Must be a ListView.
  final Widget child;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onLoadMore;
  final bool canLoadMore;

  @override
  State<RefreshLoadMore> createState() => _RefreshLoadMoreState();
}

class _RefreshLoadMoreState extends State<RefreshLoadMore> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_enableSmartRefresher) {
      return widget.child;
    }
    return SmartRefresher(
      controller: _refreshController,
      header: _enableRefresh
          ? CustomHeader(
              refreshStyle: RefreshStyle.Behind,
              builder: (context, mode) {
                return _loadingRefresh(
                  mode == RefreshStatus.canRefresh ||
                      mode == RefreshStatus.refreshing,
                );
              },
            )
          : null,
      footer: _enableLoadMore
          ? CustomFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              builder: (context, mode) {
                return _loadingLoadMore(
                  mode == LoadStatus.loading,
                );
              },
            )
          : null,
      onRefresh: _onRefresh,
      onLoading: _onLoadMore,
      enablePullDown: _enableRefresh,
      enablePullUp: widget.canLoadMore,
      child: widget.child,
    );
  }

  Widget _loadingRefresh(bool isShow) {
    return Visibility(
      visible: isShow,
      child: _buildLoadingView,
    );
  }

  Widget _loadingLoadMore(bool isShow) {
    return Visibility(
      visible: isShow,
      child: _buildLoadingView,
    );
  }

  Widget get _buildLoadingView => Center(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: SizedBox(
            height: _loadingIconSize,
            width: _loadingIconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.r,
            ),
          ),
        ),
      );

  double get _loadingIconSize => 24.r;

  bool get _enableRefresh => widget.onRefresh != null;

  bool get _enableLoadMore => widget.onLoadMore != null && widget.canLoadMore;

  bool get _enableSmartRefresher => _enableRefresh || _enableLoadMore;

  Future<void> _onRefresh() async {
    await widget.onRefresh?.call();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoadMore() async {
    await widget.onLoadMore?.call();
    _refreshController.loadComplete();
  }
}
