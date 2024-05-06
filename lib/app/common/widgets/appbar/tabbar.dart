import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class ATabBar extends StatelessWidget implements PreferredSizeWidget {
  const ATabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    return Material(
      color: darkMode ? AgrimedColors.black : AgrimedColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AgrimedColors.primary,
        labelColor: darkMode ? AgrimedColors.white : AgrimedColors.black,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AgrimedDeviceUtils.getAppBarHeight());
}
