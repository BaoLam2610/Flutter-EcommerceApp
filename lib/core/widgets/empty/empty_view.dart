import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/configs.dart';
import '../../../gen/gen.dart';
import '../../core.dart';

class EmptyView extends StatelessWidget {
  final VoidCallback? onTapReload;

  const EmptyView({super.key, this.onTapReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.empty.image(
          ),
          Text(
            LocaleKeys.empty_data.tr(),
            style: AppTextStyles.regular18,
          ),
          SizedBox(height: 8.h),
          AppButton.secondary(
            width: 80.w,
            text: LocaleKeys.reload_again.tr(),
            onTap: onTapReload,
          ),
        ],
      ),
    );
  }
}
