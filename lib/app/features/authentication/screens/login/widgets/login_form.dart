import 'package:agimed/app/data/models/app_auth.dart';
import 'package:agimed/app/data/services/auth_service.dart';
import 'package:agimed/app/features/authentication/screens/login/widgets/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text.string.dart';
import '../../../../../navigation_menu.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AgrimedSize.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AgrimedTextString.Email),
            ),
            const SizedBox(height: AgrimedSize.spaceBtwInputField),

            ///Password
            TextFormField(
              obscureText: true,
              controller: passwordController,
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
                    onPressed: () async {
                      AuthService authService = AuthService();
                      AppAuth auth = AppAuth(
                          email: emailController.text,
                          password: passwordController.text);
                      final response =
                          await authService.customerAuth(auth: auth);
                      if (response) {
                        Get.to(() => const NavigationMenu());
                      }
                    },
                    child: const Text(AgrimedTextString.SigneIn))),
            const SizedBox(height: AgrimedSize.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
