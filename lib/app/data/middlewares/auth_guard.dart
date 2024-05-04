import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../services/auth_service.dart';

class AuthGuard extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (AuthService.isAuthenticated) {
      return route == "/" ? const RouteSettings(name: Routes.HOME) : null;
    }
    return const RouteSettings(name: Routes.LOGIN);
  }
}
