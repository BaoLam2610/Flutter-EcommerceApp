import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AppLoading {
  const AppLoading._();

  static void showLoading() {
    BotToast.closeAllLoading();
    BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void hideLoading() {
    BotToast.closeAllLoading();
  }
}
