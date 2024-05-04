import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/constants/colors.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  OnBoardingDotNavigation({
    required this.controller,
    super.key,
  });

  OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? AgrimedColors.light : AgrimedColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
