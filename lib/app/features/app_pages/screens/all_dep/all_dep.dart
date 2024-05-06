import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../reclamation/dep_card.dart';

class AllDep extends StatelessWidget {
  const AllDep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('DEP'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SectionHeading(
                title: 'Dep',
                showActionButton: false,
              ),
              const SizedBox(
                height: AgrimedSize.spaceBtwItems,
              ),

              /// dep
              AgrimedGridLayout(
                itemCount: 8,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => const DepCard(
                  showBorder: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
