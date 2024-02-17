part of 'app_dialog.dart';

enum ActionButtonType {
  ok,
  cancel;
}

extension ActionButtonTypeExtension on ActionButtonType {
  String get label {
    switch (this) {
      case ActionButtonType.ok:
        return LocaleKeys.ok.tr();
      case ActionButtonType.cancel:
        return LocaleKeys.cancel.tr();
      default:
        return LocaleKeys.ok.tr();
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case ActionButtonType.ok:
        return AppTextStyles.regular18.copyWith(
          color: AppColors.current.primary,
        );
      case ActionButtonType.cancel:
        return AppTextStyles.regular18.copyWith(
          color: AppColors.current.secondaryText,
        );
      default:
        return AppTextStyles.regular18.copyWith(
          color: AppColors.current.primary,
        );
    }
  }
}
