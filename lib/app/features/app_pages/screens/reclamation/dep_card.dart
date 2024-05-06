import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/dep_title_text_with_verified_icon.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/enums.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';

class DepCard extends StatelessWidget {
  const DepCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AgrimedRoundedContainer(
        padding: const EdgeInsets.all(AgrimedSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// icon
            Flexible(
              child: AgrimedCircularImage(
                isNetworkImage: false,
                image: AgrimedImages.product,
                backgroundColor: Colors.transparent,
                overlayColor:
                    darkMode ? AgrimedColors.white : AgrimedColors.black,
              ),
            ),
            const SizedBox(height: AgrimedSize.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DepTitleWithVerifiedIcon(
                    title: 'PROD',
                    depTextSize: TextSizes.large,
                  ),
                  Text(
                    '15 Claim',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
