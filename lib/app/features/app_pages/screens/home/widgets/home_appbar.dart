import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products.cart/cart/cart_menu_icon.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/text.string.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AgrimedTextString.HomeAppBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AgrimedColors.white)),
        ],
      ),
      actions: [
        AgrimedCartCounterIcon(
          onPressed: () {},
          iconColor: AgrimedColors.white,
        )
      ],
    );
  }
}
