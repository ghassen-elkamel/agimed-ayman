import 'package:agimed/app/global_widgets/atoms/text_field.dart';
import 'package:agimed/app/modules/login/views/verify_email.dart';
import 'package:agimed/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text.string.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AgrimedSize.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            const AtomTextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AgrimedTextString.Email),
            ),
            const SizedBox(height: AgrimedSize.spaceBtwInputField),

            ///Password
            AtomTextField(
              isObscureText: true,
            ),
            const SizedBox(height: AgrimedSize.spaceBtwInputField / 2),

            /// Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(AgrimedTextString.RememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const VerifyEmailScreen()),
                  child: const Text(AgrimedTextString.ForgetPassword),
                ),
              ],
            ),

            const SizedBox(height: AgrimedSize.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.HOME),
                    child: const Text(AgrimedTextString.SigneIn))),
            const SizedBox(height: AgrimedSize.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
