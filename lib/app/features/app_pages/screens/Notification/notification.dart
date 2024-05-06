import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/reclam_card/reclam_card_vertical.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../home/home.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final dark = brightness == Brightness.dark;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Notification',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          AgrimedCircularIcon(
            backgroundColor: dark ? AgrimedColors.black : AgrimedColors.white,
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              AgrimedGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const AgrimedCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
