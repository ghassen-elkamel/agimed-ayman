import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal_1,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AgrimedSize.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: AgrimedDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(AgrimedSize.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? darkMode
                      ? AgrimedColors.dark
                      : AgrimedColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AgrimedSize.cardRadiusLg),
              border:
                  showBorder ? Border.all(color: AgrimedColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: AgrimedColors.darkerGrey),
              const SizedBox(width: AgrimedSize.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
