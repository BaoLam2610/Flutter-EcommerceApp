import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/configs.dart';
import '../../../gen/gen.dart';
import '../../core.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback? onTapReload;

  const ErrorView({super.key, this.onTapReload});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onTap: onTapReload,
        ),
      ],
    );
  }
}