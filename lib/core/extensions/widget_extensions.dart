import 'package:flutter/material.dart';

import '../../configs/themes/app_text_styles.dart';
import '../../configs/themes/text_themes.dart';

extension BuildContextExtensions<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  // Size
  bool get isMobile => mediaQuery.size.width <= 500.0;

  bool get isTablet =>
      mediaQuery.size.width < 1024.0 && mediaQuery.size.width >= 650.0;

  bool get isSmallTablet =>
      mediaQuery.size.width < 650.0 && mediaQuery.size.width > 500.0;

  bool get isDesktop => mediaQuery.size.width >= 1024.0;

  bool get isSmall =>
      mediaQuery.size.width < 850.0 && mediaQuery.size.width >= 560.0;

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  Size get size => mediaQuery.size;

  Future<T?> showBottomSheet(
    Widget child, {
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      builder: (context) => Wrap(children: [child]),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        // backgroundColor: primary,
      ),
    );
  }
  //
  // Future<T?> showAlertDialog({
  //   String? title,
  //   String? content,
  //   String textAccept = 'OK',
  //   String textCancel = 'Cancel',
  //   VoidCallback? onAccept,
  //   VoidCallback? onCancel,
  // }) =>
  //     showDialog(
  //       context: this,
  //       builder: (context) => AlertDialog(
  //         title: Text(
  //           title ?? '',
  //           style: AppTextStyles.bold32,
  //         ),
  //         content: Text(
  //           content ?? '',
  //           style: this.bodyMedium,
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               if (onCancel != null) onCancel();
  //               navigator.pop();
  //             },
  //             child: Text(
  //               textCancel,
  //               style: bodyMedium?.copyWith(color: textColorGrey),
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               if (onAccept != null) onAccept();
  //               navigator.pop();
  //             },
  //             child: Text(
  //               textAccept,
  //               style: bodyMedium?.copyWith(color: primary),
  //             ),
  //           )
  //         ],
  //       ),
  //     );
}
