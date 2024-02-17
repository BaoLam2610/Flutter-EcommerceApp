import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';

class LabelCheckbox extends StatefulWidget {
  final String label;
  final bool isChecked;
  final void Function(bool isChecked)? onChanged;

  const LabelCheckbox({
    super.key,
    required this.label,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  State<LabelCheckbox> createState() => _LabelCheckboxState();
}

class _LabelCheckboxState extends State<LabelCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.r,
          height: 24.r,
          child: Checkbox(
            value: widget.isChecked,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            side: BorderSide(
              color: AppColors.current.secondaryText,
            ),
            onChanged: (isChecked) {
              widget.onChanged?.call(isChecked ?? false);
            },
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          widget.label,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.current.secondaryText,
          ),
        ),
      ],
    );
  }
}
