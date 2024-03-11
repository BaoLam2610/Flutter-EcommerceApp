import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../configs/themes/themes.dart';
import '../../../gen/locale_keys.g.dart';
import '../../extensions/widget_extensions.dart';

part 'action_button_type.dart';

class AppDialog {
  const AppDialog._();

  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = false,
    Color? barrierColor = Colors.black54,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: builder,
    );
  }

  static AlertDialog _baseAlertDialog({
    String? title,
    String? content,
    List<Widget>? actions,
  }) {
    return AlertDialog(
      title: Text(
        title ?? LocaleKeys.notification.tr(),
        style: AppTextStyles.bold24,
      ),
      content: Text(
        content ?? '',
        style: AppTextStyles.regular16,
      ),
      actions: actions,
    );
  }

  static Widget _actionButton(
    BuildContext context, {
    required ActionButtonType type,
    VoidCallback? onTap,
  }) =>
      TextButton(
        onPressed: () {
          if (onTap != null) onTap();
          context.navigator.pop();
        },
        child: Text(
          type.label,
          style: type.textStyle,
        ),
      );

  static Future<T?> showConfirmDialog<T>({
    required BuildContext context,
    String? title,
    String? content,
    VoidCallback? onAccept,
    VoidCallback? onCancel,
  }) =>
      showAppDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => _baseAlertDialog(
          title: title,
          content: content,
          actions: [
            _actionButton(
              context,
              type: ActionButtonType.cancel,
              onTap: onCancel,
            ),
            _actionButton(
              context,
              type: ActionButtonType.ok,
              onTap: onAccept,
            ),
          ],
        ),
      );

  static Future<T?> showOkDialog<T>({
    required BuildContext context,
    String? title,
    String? content,
    VoidCallback? onAccept,
  }) =>
      showAppDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _baseAlertDialog(
          title: title,
          content: content,
          actions: [
            _actionButton(
              context,
              type: ActionButtonType.ok,
              onTap: onAccept,
            ),
          ],
        ),
      );

  static Future<T?> showLogoutDialog<T>({
    required BuildContext context,
  }) =>
      showOkDialogCallBack(
        context: context,
        content: LocaleKeys.error_access_denied.tr(),
      );

  static Future<T?> showOkDialogCallBack<T>({
    required BuildContext context,
    String? title,
    String? content,
    T? result,
  }) =>
      showOkDialog(
        context: context,
        title: title,
        content: content,
        onAccept: () => context.navigator.maybePop(T),
      );
}
