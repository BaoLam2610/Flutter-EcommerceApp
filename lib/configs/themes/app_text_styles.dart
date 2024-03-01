import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static String fontFamily = FontFamily.muli;
  static Color defaultTextColor = AppColors.current.primaryText;

  /* Regular */
  static TextStyle regular12 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    color: defaultTextColor,
    height: 12 / 8,
  );

  static TextStyle regular14 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    color: defaultTextColor,
    height: 14 / 10,
  );

  static TextStyle regular16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    color: defaultTextColor,
    height: 16 / 12,
  );

  static TextStyle regular18 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    color: defaultTextColor,
    height: 18 / 14,
  );

  static TextStyle regular20 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    color: defaultTextColor,
    height: 20 / 16,
  );

  static TextStyle regular24 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    color: defaultTextColor,
    height: 24 / 20,
  );

  static TextStyle regular28 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.sp,
    color: defaultTextColor,
    height: 28 / 24,
  );

  static TextStyle regular32 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.sp,
    color: defaultTextColor,
    height: 32 / 28,
  );

  /* Bold */
  static TextStyle bold12 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 12.sp,
    color: defaultTextColor,
    height: 12 / 8,
  );

  static TextStyle bold14 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 14.sp,
    color: defaultTextColor,
    height: 14 / 10,
  );

  static TextStyle bold16 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 16.sp,
    color: defaultTextColor,
    height: 16 / 12,
  );

  static TextStyle bold18 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 18.sp,
    color: defaultTextColor,
    height: 18 / 14,
  );

  static TextStyle bold20 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 20.sp,
    color: defaultTextColor,
    height: 20 / 16,
  );

  static TextStyle bold24 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 24.sp,
    color: defaultTextColor,
    height: 24 / 20,
  );

  static TextStyle bold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 28.sp,
    color: defaultTextColor,
    height: 28 / 24,
  );

  static TextStyle bold32 = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
    fontSize: 32.sp,
    color: defaultTextColor,
    height: 32 / 28,
  );
}
