import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/text.string.dart';
import '../controllers/on_boarding_controller.dart';
import 'onboarding_dot_navigation.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page.dart';
import 'onboarding_skip.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            /// Horizontal Scrollable Pages
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: AgrimedImages.onBoardingImage1,
                  title: AgrimedTextString.OnBoardingTitle1,
                  subTitle: AgrimedTextString.OnBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: AgrimedImages.onBoardingImage2,
                  title: AgrimedTextString.OnBoardingTitle2,
                  subTitle: AgrimedTextString.OnBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: AgrimedImages.onBoardingImage3,
                  title: AgrimedTextString.OnBoardingTitle3,
                  subTitle: AgrimedTextString.OnBoardingSubTitle3,
                )
              ],
            ),

            /// Skip Button
            OnBoardingSkip(
              controller: controller,
            ),

            /// Dot Navigation SmoothPageIndicator
            OnBoardingDotNavigation(
              controller: controller,
            ),

            /// Circular Button
            OnBoardingNextButton(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
