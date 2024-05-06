import 'package:flutter/material.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AgrimedCircularIcon extends StatelessWidget {
  const AgrimedCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.size = AgrimedSize.lg,
    this.height,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : AgrimedHelperFunctions.isDarkMode(context)
                ? AgrimedColors.black.withOpacity(0.9)
                : AgrimedColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
