import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';
import '../../../gen/assets.gen.dart';
import '../../extensions/extensions.dart';

class LabelTextField extends StatelessWidget {
  final Function(String text)? onChanged;
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? errors;
  final bool? obscureText;
  final void Function(PointerDownEvent)? onTapOutSide;

  const LabelTextField({
    super.key,
    this.label,
    this.hint,
    this.suffixIcon,
    this.inputType,
    this.controller,
    this.onChanged,
    this.errors,
    this.obscureText,
    this.onTapOutSide,
  });

  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.current.secondary),
      );

  InputBorder get focusBorder => inputBorder.copyWith(
        borderSide: BorderSide(color: AppColors.current.primary),
      );

  double get paddingHorizontalSuffixIcon => 10.w;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!label.isNullOrEmpty) ...{
          Text(
            label!,
            style: AppTextStyles.bold16,
          ),
          SizedBox(
            height: 4.h,
          )
        },
        TextFormField(
          obscureText: obscureText ?? false,
          onTapOutside: onTapOutSide ?? (_) => FocusScope.of(context).unfocus(),
          onChanged: onChanged,
          controller: controller,
          maxLines: 1,
          keyboardType: inputType,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 14.h,
            ),
            hintText: hint,
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontalSuffixIcon,
              ),
              child: suffixIcon,
            ),
            suffixIconConstraints: BoxConstraints(
              maxWidth: 24.r + (paddingHorizontalSuffixIcon * 2),
              maxHeight: 24.h,
            ),
            focusedBorder: focusBorder,
            border: inputBorder,
          ),
        ),
        if (!errors.isNullOrEmpty) ...{
          SizedBox(height: 4.h),
          _buildErrorArea,
        }
      ],
    );
  }

  Widget get _buildErrorArea {
    return Row(
      children: [
        SizedBox(width: 2.w),
        Assets.icons.solidCircleError.svg(
          colorFilter: ColorFilter.mode(
            AppColors.current.critical,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          errors!,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.current.critical,
          ),
        )
      ],
    );
  }
}
