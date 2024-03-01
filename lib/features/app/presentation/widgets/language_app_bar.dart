import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/di/injection_container.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../gen/assets.gen.dart';
import '../bloc/global_app_cubit.dart';

class LanguageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? textStyle;
  final double? height;
  final Color? colorBgr;
  final bool isShowBack;
  final VoidCallback? onTapBack;

  final GlobalAppCubit _globalAppCubit = inject.get<GlobalAppCubit>();

  LanguageAppBar({
    super.key,
    required this.title,
    this.textStyle,
    this.height,
    this.colorBgr,
    this.isShowBack = false,
    this.onTapBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? (56.h));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalAppCubit, GlobalAppState>(
      bloc: _globalAppCubit,
      buildWhen: (previous, current) =>
          previous.currentLocale != current.currentLocale,
      builder: (context, state) {
        return CustomAppBar(
          title: title,
          textStyle: textStyle,
          colorBgr: colorBgr,
          isShowBack: isShowBack,
          onTapBack: onTapBack,
          height: height,
          actionButton: InkWell(
            onTap: _globalAppCubit.onChangeLocale,
            child: _globalAppCubit.isViLocale
                ? Assets.icons.flagVn.svg(
                    width: 24.r,
                    height: 24.r,
                  )
                : Assets.icons.flagEn.svg(
                    width: 24.r,
                    height: 24.r,
                  ),
          ),
        );
      },
    );
  }
}
