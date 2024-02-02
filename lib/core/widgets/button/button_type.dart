import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/themes.dart';

enum ButtonType {
  solid,
  outlined,
  primary,
  secondary,
}

extension ButtonTypeExtension on ButtonType {
  Color get colorButton {
    switch (this) {
      case ButtonType.solid:
      case ButtonType.primary:
        return AppColors.current.primary;
      case ButtonType.secondary:
      default:
        return AppColors.current.surface;
    }
  }

  Color get colorText {
    switch (this) {
      case ButtonType.solid:
      case ButtonType.primary:
        return Colors.white;
      default:
        return AppColors.current.primaryText;
    }
  }

  Border? get borderButton {
    switch (this) {
      case ButtonType.outlined:
        return Border.all(
          width: 1.r,
          color: AppColors.current.primary,
        );
      default:
        return null;
    }
  }
}
