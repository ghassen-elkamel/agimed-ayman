import 'package:agimed/app/modules/on_boarding/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class OnBoardingSkip extends StatelessWidget {
  OnBoardingSkip({
    required this.controller,
    super.key,
  });

  OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () => Get.offAllNamed(Routes.LOGIN),
          child: Text('Skip'.tr)),
    );
  }
}
