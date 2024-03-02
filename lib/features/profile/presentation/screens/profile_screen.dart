import 'package:flutter/material.dart';

import '../../../../core/widgets/screen/base_screen.dart';

class ProfileScreen extends BaseScreen {
  const ProfileScreen({super.key});

  @override
  BaseScreenState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseScreenState<ProfileScreen> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Profile Screen'),),
    );
  }
}
