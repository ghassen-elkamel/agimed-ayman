import 'package:agrimed/common/widgets/success_screen/success_screen.dart';
import 'package:agrimed/features/authentication/screens/login/login.dart';
import 'package:agrimed/utils/constants/image_strings.dart';
import 'package:agrimed/utils/constants/sizes.dart';
import 'package:agrimed/utils/constants/text.string.dart';
import 'package:agrimed/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give default equal space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(AgrimedImages.email),
                width: AgrimedHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

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
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                        image: AgrimedImages.receivedEmail,
                        title: AgrimedTextString.requestForPassword,
                        subTitle: AgrimedTextString.request,
                        onPressed: () => Get.to(() => const LoginScreen()) ,
                          ),),
                      child: const Text(AgrimedTextString.Continue))),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

            ],
          ),
        ),
      ),
    );
  }
}
