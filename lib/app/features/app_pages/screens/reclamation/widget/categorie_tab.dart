import 'package:flutter/material.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products.cart/reclam_card/reclam_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../core/utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              SectionHeading(title: 'RELATED', onPressed: () {}),
              const SizedBox(
                height: AgrimedSize.spaceBtwItems,
              ),
              AgrimedGridLayout(
                  itemCount: 5,
                  itemBuilder: (_, index) => const AgrimedCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
