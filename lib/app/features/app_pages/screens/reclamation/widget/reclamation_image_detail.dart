import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';

class ReclamationImageDetail extends StatelessWidget {
  const ReclamationImageDetail({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return AgrimedCurvedEdgeWidget(
      child: Container(
        color: dark ? AgrimedColors.dark : AgrimedColors.light,
        child: const Stack(
          children: [
            /// main Large image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(AgrimedSize.productImageRadius * 2),
                  child: Center(
                    child: Image(
                      image: AssetImage(AgrimedImages.prod),
                    ),
                  ),
                )),
            TAppBar(
              showBackArrow: true,
            )
          ],
        ),
      ),
    );
  }
}
