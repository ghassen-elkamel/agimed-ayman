import 'package:flutter/material.dart';

import '../../core/utils/constants/sizes.dart';
import '../../core/utils/constants/text.string.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: 100,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              /// Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              /// button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(AgrimedTextString.Done))),
            ],
          ),
        ),
      ),
    );
  }
}
