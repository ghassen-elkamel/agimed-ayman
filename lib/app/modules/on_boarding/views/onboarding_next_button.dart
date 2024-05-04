import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  OnBoardingNextButton({
    required this.controller,
    super.key,
  });

  OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () => controller.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? AgrimedColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
