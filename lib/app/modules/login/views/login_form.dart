import 'package:agrimed/features/authentication/screens/login/widgets/verify_email.dart';
import 'package:agrimed/navigation_menu.dart';
import 'package:agrimed/utils/constants/sizes.dart';
import 'package:agrimed/utils/constants/text.string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AgrimedSize.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AgrimedTextString.Email),
            ),
            const SizedBox(height: AgrimedSize.spaceBtwInputField),

            ///Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: AgrimedTextString.Password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
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
                    onPressed: () => Get.to(() => const NavigationMenu()),
                    child: const Text(AgrimedTextString.SigneIn))),
            const SizedBox(height: AgrimedSize.spaceBtwSections),

          ],
        ),
      ),
    );
  }
}

