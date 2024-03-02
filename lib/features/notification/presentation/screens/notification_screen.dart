import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../gen/gen.dart';

class NotificationScreen extends BaseScreen {
  const NotificationScreen({super.key});

  @override
  BaseScreenState<NotificationScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseScreenState<NotificationScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.notification.tr()),
      ),
    );
  }
}
