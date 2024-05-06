import 'package:flutter/material.dart';

import '../../../core/utils/constants/sizes.dart';

class AgrimedGridLayout extends StatelessWidget {
  const AgrimedGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 280,
      required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AgrimedSize.gradViewSpacing,
        crossAxisSpacing: AgrimedSize.gradViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
