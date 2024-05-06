import 'package:agimed/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class AgrimedHeaderContainer extends StatelessWidget {
  const AgrimedHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AgrimedCurvedEdgeWidget(
      child: Container(
        color: AgrimedColors.primary,
        padding: const EdgeInsets.all(0),

        ///
        child: Stack(
          children: [
            child,
            Positioned(
                top: -150,
                right: -250,
                child: AgrimedRoundedContainer(
                  backgroundColor: AgrimedColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: AgrimedCircularContainer(
                  backgroundColor: AgrimedColors.textWhite.withOpacity(0.1),
                )),
          ],
        ),
      ),
    );
  }
}
