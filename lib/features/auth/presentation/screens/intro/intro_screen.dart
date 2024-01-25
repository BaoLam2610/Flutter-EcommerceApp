import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../configs/themes/button_themes.dart';
import '../../../../../configs/themes/dimens.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/extensions/widget_extensions.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../login/login_screen.dart';

class IntroScreen extends StatefulWidget {
  static const String route = '/intro_screen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  final introList = [
    {
      'text': LocaleKeys.intro_1.tr(),
      'image': splash_1,
    },
    {
      'text': LocaleKeys.intro_2.tr(),
      'image': splash_2,
    },
    {
      'text': LocaleKeys.intro_3.tr(),
      'image': splash_3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                text_app_name,
                style: context.headlineLarge?.copyWith(
                  color: context.primary,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: PageView.builder(
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
              itemCount: introList.length,
              itemBuilder: (context, index) {
                final intro = introList[index];
                return _buildPageItem(intro);
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => _buildDotIndicator(index: index),
                    ),
                  ),
                  const Spacer(),
                  _buildBottomButton(),
                  const Spacer(),
                ],
              ),
            ),
          )
        ],
      );

  _buildPageItem(Map<String, dynamic> intro) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              intro['text'].toString(),
              style: context.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 2),
          SizedBox(
            width: context.width * 0.6,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                intro['image'].toString(),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      );

  _buildDotIndicator({required int index}) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: currentIndex == index ? 20 : 6,
        decoration: BoxDecoration(
            color: currentIndex == index ? context.primary : context.surface,
            borderRadius: BorderRadius.circular(3)),
      );

  _buildBottomButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: buttonHeightLarge,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: _onButtonPressed,
              style: primarySmallRoundedButtonTheme,
              child: Text(
                text_continue,
                style: context.buttonTextTheme,
              )),
        ),
      );

  void _onButtonPressed() {
    context.navigator.pushReplacementNamed(LoginScreen.route);
  }
}
