import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconsax/iconsax.dart';

import 'core/utils/constants/colors.dart';
import 'features/app_pages/screens/Notification/notification.dart';
import 'features/app_pages/screens/home/home.dart';
import 'features/app_pages/screens/reclamation/reclamation.dart';
import 'features/personalization/screens/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    final iconColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? AgrimedColors.black : Colors.white,
          indicatorColor: darkMode
              ? AgrimedColors.white.withOpacity(0.1)
              : AgrimedColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: iconColor),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(Iconsax.warning_2, color: iconColor),
                label: 'Reclamation'),
            NavigationDestination(
                icon: Icon(Iconsax.notification, color: iconColor),
                label: 'Notification'),
            NavigationDestination(
                icon: Icon(Iconsax.profile_circle, color: iconColor),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ReclamationScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];
}
/*
import 'package:agrimed/features/app_pages/screens/home/home.dart';
import 'package:agrimed/features/app_pages/screens/profile/profile.dart';
import 'package:agrimed/features/app_pages/screens/reclamation/reclamation.dart';
import 'package:agrimed/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final brightness = MediaQuery.of(context).platformBrightness;
    final iconColor = brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: brightness == Brightness.dark ? AgrimedColors.black : AgrimedColors.white,
          indicatorColor: brightness == Brightness.dark ? AgrimedColors.white.withOpacity(0.1) : AgrimedColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: iconColor),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.warning_2, color: iconColor),
              label: 'Reclamation',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.notification, color: iconColor),
              label: 'Notification',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.profile_circle, color: iconColor),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs ;

  final screens = [const HomeScreen(), const ReclamationScreen(), Container(color: Colors.cyanAccent), const ProfileScreen()];
}

 */
