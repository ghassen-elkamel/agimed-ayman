import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/enums.dart';
import '../../../core/utils/constants/sizes.dart';
import 'agrimed_title_text.dart';

class DepTitleWithVerifiedIcon extends StatelessWidget {
  const DepTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AgrimedColors.primary,
    this.textAlign = TextAlign.center,
    this.depTextSize = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes depTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: AgrimedDepTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            depTextSize: depTextSize,
          ),
        ),
        const SizedBox(width: AgrimedSize.xs),
        const Icon(Iconsax.verify5,
            color: AgrimedColors.primary, size: AgrimedSize.iconXs),
      ],
    );
  }
}
