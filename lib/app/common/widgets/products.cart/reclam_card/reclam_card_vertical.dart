import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../features/app_pages/screens/reclamation/Reclamation_detail.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/dep_title_text_with_verified_icon.dart';
import '../../texts/reclm_title_text.dart';

class AgrimedCardVertical extends StatelessWidget {
  const AgrimedCardVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final dark = brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Get.to(() => const ReclamationDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AgrimedSize.productImageRadius),
          color: dark ? AgrimedColors.darkerGrey : AgrimedColors.white,
        ),
        child: Column(
          children: [
            AgrimedRoundedContainer(
              height: 195,
              padding: const EdgeInsets.all(AgrimedSize.sm),
              backgroundColor: dark ? AgrimedColors.black : AgrimedColors.light,
              child: const Stack(
                children: [
                  AgrimedRoundedImage(
                    imageUrl: AgrimedImages.prod,
                    applyImageRadius: true,
                  ),

                  /// add icon
                  /*Positioned(
                    top: 0,
                    right: 7,
                    child: AgrimedCircularIcon(
                      backgroundColor: dark ? AgrimedColors.black : AgrimedColors.light,
                      icon: Iconsax.add_circle5,
                      color: Colors.green,
                    ),
                  ),*/
                ],
              ),
            ),
            const SizedBox(
              height: AgrimedSize.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AgrimedSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AgrimedReclmTitleText(
                    title: 'DEP INFO',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: AgrimedSize.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DepTitleWithVerifiedIcon(title: 'IT'),
                      Container(
                        decoration: const BoxDecoration(
                          color: AgrimedColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AgrimedSize.cardRadiusMd),
                            bottomRight:
                                Radius.circular(AgrimedSize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: AgrimedSize.iconLg * 1.2,
                          height: AgrimedSize.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.code5,
                              color: AgrimedColors.white,
                              size: AgrimedSize.iconMd,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// l code l 9dim
/*
class AgrimedCardVertical extends StatelessWidget {
  const AgrimedCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final dark = brightness == Brightness.dark;
    /// container with side padding color edges radius and shadow
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AgrimedSize.productImageRadius),
          color: dark ? AgrimedColors.darkerGrey : AgrimedColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail , Wishlist
            AgrimedRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AgrimedSize.sm),
              backgroundColor: dark ? AgrimedColors.dark : AgrimedColors.light,
              child: const Stack(
                children: [
                  AgrimedRoundedImage(
                      imageUrl: AgrimedImages.prod, applyImageRadius: true),

                  /// Reclam icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AgrimedCircularIcon(
                      backgroundColor: dark ? AgrimedColors.dark : AgrimedColors.light,
                      icon: Iconsax.add_circle5,
                      color: Colors.green,
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: AgrimedSize.spaceBtwItems / 2,
            ),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: AgrimedSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AgrimedReclmTitleText(

                    title: '5555555',
                    smallSize: false,
                  ),
                  SizedBox(
                    height: AgrimedSize.spaceBtwItems / 2,
                  ),

                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Text('DEPARTMENT',
                //overflow: TextOverflow.ellipsis,
                // maxLines: 1,
                // style: Theme.of(context).textTheme.labelMedium,
                // ),
                Container(
                  decoration: const BoxDecoration(
                      color: AgrimedColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AgrimedSize.cardRadiusMd),
                        bottomRight:
                        Radius.circular(AgrimedSize.productImageRadius),
                      )),
                  child: const SizedBox(
                      width: AgrimedSize.iconLg * 1.2,
                      height: AgrimedSize.iconLg * 1.2,
                      child:  Center(
                        child: Icon(
                          Iconsax.code5,
                          color: AgrimedColors.white,
                          size: AgrimedSize.iconMd,
                        ),
                      )),
                ),
                const SizedBox(
                  width: AgrimedSize.xs,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
 */
