import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class ReclamationMetaData extends StatelessWidget {
  const ReclamationMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AgrimedSize.defaultSpace,
          vertical: AgrimedSize.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Iconsax.code5, color: AgrimedColors.primary, size: 24),
              const SizedBox(width: AgrimedSize.spaceBtwItems / 2),
              Text('DEP INFO',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: AgrimedSize.spaceBtwItems * 8),
              Text('01/01/2024', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: AgrimedSize.spaceBtwItems),

          Row(
            children: [
              const SizedBox(width: AgrimedSize.spaceBtwItems / 2),
              Text('Status :',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: AgrimedSize.spaceBtwItems),
              Text('In Progress',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: AgrimedSize.spaceBtwItems / 1.5),
          // Reclamation status

          const ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.'
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast)'
            ' interfaces for iOS and Android apps with the unified codebase.',
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: Colors.greenAccent,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AgrimedColors.primary),
            lessStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AgrimedColors.primary),
          ),
        ],
      ),
    );
  }
}
