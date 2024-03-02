import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'configs/configs.dart';
import 'features/app/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  runApp(const BLMarketApp());
}
