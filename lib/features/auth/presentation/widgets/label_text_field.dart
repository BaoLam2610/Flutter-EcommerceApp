import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/themes/themes.dart';
import '../../../../core/extensions/extensions.dart';

class LabelTextField extends StatelessWidget {
  final Function(String text)? onChanged;
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final String? errors;
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
    this.onTapOutSide,
  });

  InputBorder get inputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.current.secondary),
      );

  InputBorder get focusBorder => inputBorder.copyWith(
        borderSide: BorderSide(color: AppColors.current.primary),
      );

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
            suffixIcon: suffixIcon,
            focusedBorder: focusBorder,
            border: inputBorder,
          ),
        ),
        if (!errors.isNullOrEmpty) ...{
          SizedBox(height: 2.h),
          Text(
            errors!,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.current.critical,
            ),
          )
        }
      ],
    );
  }
}
