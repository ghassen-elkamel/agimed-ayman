import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/reclam_card/reclam_card_vertical.dart';
import '../../../../core/utils/constants/sizes.dart';

class AllReclamation extends StatelessWidget {
  const AllReclamation({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final dark = brightness == Brightness.dark;

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reclamation'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              /// Dropdown
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: [
                  'waiting',
                  'In Progress',
                  'Completed',
                ]
                    .map((option) =>
                        DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
              ),
              const SizedBox(
                height: AgrimedSize.spaceBtwSections,
              ),

              /// claims
              AgrimedGridLayout(
                  itemCount: 2,
                  itemBuilder: (_, index) => const AgrimedCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
