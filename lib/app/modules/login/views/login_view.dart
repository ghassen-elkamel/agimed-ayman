import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'login_form.dart';
import 'login_header.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// logo , title , subTitle
              SizedBox(height: 100),
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
