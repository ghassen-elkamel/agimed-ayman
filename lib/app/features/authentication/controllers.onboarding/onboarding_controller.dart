import 'package:agimed/app/data/services/auth_service.dart';
import 'package:agimed/app/features/app_pages/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  bool firstTime = true;

  @override
  Future<void> onInit() async {
    print("******************");
    firstTime = await AuthService().firstTime();

    if (firstTime != true) {
      if (AuthService.isAuthenticated) {
        Get.to(() => const HomeScreen());
      } else {
        Get.to(() => const LoginScreen());
      }
      super.onInit();
    }
  }

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
