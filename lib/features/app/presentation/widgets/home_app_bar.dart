import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      collapsedHeight: 80,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(top: context.mediaQuery.viewPadding.top),
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: const SearchField(
            readOnly: true,
          ),
        ),
      ),
    );
  }
}
