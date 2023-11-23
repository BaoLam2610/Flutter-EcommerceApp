import 'package:flutter/material.dart';

import 'configs/themes/app_themes.dart';
import 'features/auth/presentation/pages/intro/intro_page.dart';
import 'features/auth/presentation/pages/login/login_page.dart';
import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const IntroPage(),
    );
  }
}
