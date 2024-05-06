import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text.string.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AgrimedLoginHeader extends StatelessWidget {
  const AgrimedLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AgrimedHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? AgrimedImages.lightAppLogo : AgrimedImages.darkAppLogo),
        ),
        Text(AgrimedTextString.LoginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AgrimedSize.sm),
        Text(AgrimedTextString.LoginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
