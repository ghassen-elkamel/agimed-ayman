import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class AgrimedProfileTile extends StatelessWidget {
  const AgrimedProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AgrimedCircularImage(
        image: AgrimedImages.darkAppLogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'USER 1',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: AgrimedColors.white),
      ),
      subtitle: Text(
        'USER1@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AgrimedColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: AgrimedColors.white,
          )),
    );
  }
}
