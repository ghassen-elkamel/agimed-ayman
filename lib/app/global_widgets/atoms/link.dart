import 'package:flutter/material.dart';

import '../../core/theme/text.dart';
import '../../core/values/colors.dart';

class AtomLink extends StatelessWidget {
  const AtomLink({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.color,
  });

  final String text;
  final void Function()? onTap;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (icon != null)
              Icon(
                icon!,
                color: color ?? darkBlue,
              ),
            const SizedBox(width: 8),
            CustomText.l(
              text,
              color: color ?? darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
