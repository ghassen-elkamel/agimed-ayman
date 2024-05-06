import 'package:agimed/app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:agimed/app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/spacing_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AgrimedSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo , title , subTitle
              AgrimedLoginHeader(),

              /// Form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
