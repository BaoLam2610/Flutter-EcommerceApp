import 'package:flutter/material.dart';

import '../../configs/themes/app_colors.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<T extends BaseScreen> extends State<BaseScreen> {

  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    AppColors.of(context);
    return buildScreen(context);
  }
}