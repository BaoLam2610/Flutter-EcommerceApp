import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'features/app/presentation/app.dart';
import 'configs/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  runApp(const BLMarketApp());
}
