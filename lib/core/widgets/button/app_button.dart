import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';
import '../widgets.dart';

part 'button_type.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;
  final ButtonType? type;
  final String text;
  final TextStyle? textStyle;
  final Color? colorButton;
  final Color? colorBorder;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.type,
    this.textStyle,
    this.colorButton,
    this.colorBorder,
    this.padding,
    this.width,
    this.height,
  });

  final double _buttonElevation = 2.0;

  factory AppButton.primary({
    Key? key,
    required String text,
    GestureTapCallback? onTap,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
  }) {
    return AppButton(
      key: key,
      text: text,
      type: ButtonType.primary,
      onTap: onTap,
      textStyle: textStyle,
      padding: padding,
      width: width,
      height: height,
    );
  }

  factory AppButton.secondary({
    Key? key,
    required String text,
    GestureTapCallback? onTap,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
  }) {
    return AppButton(
      key: key,
      text: text,
      type: ButtonType.secondary,
      onTap: onTap,
      textStyle: textStyle,
      padding: padding,
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _button;
  }

  Widget get _button => MaterialEffect(
        color: _colorButton,
        onTap: onTap,
        elevation: _buttonElevation,
        borderRadius: _buttonBorderRadius,
        child: Container(
          width: width,
          height: height,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: _borderButton,
          ),
          child: _buildText,
        ),
      );

  Color? get _colorButton => colorButton ?? type?.colorButton;

  Border? get _borderButton => colorBorder != null
      ? Border.all(width: 1.r, color: colorBorder!)
      : type?.borderButton;

  BorderRadius get _buttonBorderRadius => BorderRadius.circular(10.r);

  Widget get _buildText => Center(
        child: Text(
          text,
          style: textStyle ??
              AppTextStyles.bold16.copyWith(
                color: type?.colorText ?? AppColors.current.primaryText,
              ),
        ),
      );
}
