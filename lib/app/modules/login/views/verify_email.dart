import 'package:agimed/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text.string.dart';
import '../../success_screen/success_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAllNamed(Routes.LOGIN),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give default equal space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(AgrimedImages.email),
                width: Get.width * 0.6,
              ),
              const SizedBox(height: 30),

              /// Title & SubTitle
              Text(
                AgrimedTextString.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              /// Email
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: AgrimedTextString.Email),
              ),
              const SizedBox(height: AgrimedSize.spaceBtwInputField),
              Text(
                AgrimedTextString.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(
                            () => SuccessScreen(
                              image: AgrimedImages.receivedEmail,
                              title: AgrimedTextString.requestForPassword,
                              subTitle: AgrimedTextString.request,
                              onPressed: () => Get.toNamed(Routes.LOGIN),
                            ),
                          ),
                      child: const Text(AgrimedTextString.Continue))),
              const SizedBox(height: AgrimedSize.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
