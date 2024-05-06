import 'package:agimed/app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:agimed/app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:agimed/app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:agimed/app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/text.string.dart';
import '../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
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
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
