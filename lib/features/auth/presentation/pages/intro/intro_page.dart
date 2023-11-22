import 'package:ecommerce_app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() => Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildPageItem();
              },
            ),
          ),
          Expanded(
            flex: 2,
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
                  _buildBottomButton()
                ],
              ),
            ),
          )
        ],
      );

  _buildPageItem() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'BL Market',
            style: context.textTheme.displayLarge?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          Text(
            'Welcome to BL Market, let\'s buy something',
            style: context.textTheme.bodyMedium,
          ),
          const Spacer(flex: 2),
          SizedBox(
            width: context.mediaQuery.size.width * 0.6,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                'assets/images/splash_1.png',
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
            color: currentIndex == index
                ? context.colorScheme.primary
                : context.colorScheme.surface,
            borderRadius: BorderRadius.circular(3)),
      );

  _buildBottomButton() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Continue',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              )),
        ),
      );
}
