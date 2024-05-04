import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../../core/utils/constant.dart';
import '../models/access_user.dart';
import '../models/app_auth.dart';
import '../models/entities/user.dart';
import '../providers/external/api_provider.dart';
import '../providers/storage_provider.dart';

class AuthService {
  static bool isAuthenticated = false;
  static bool haveManyCompanies = false;
  static bool haveManyClasses = false;
  static int? selectedCompanyCode;
  static int? selectedClassCode;
  static String? language;
  static AccessUser? access;

  Future<bool> customerAuth({
    required AppAuth auth,
  }) async {
    final response = await ApiProvider().post(
      HttpParamsPostPut(
        endpoint: "/v1/auth/login",
        body: auth.toJson(),
      ),
    );
    return saveToken(response);
  }

  firstTime() async {
    StorageHelper storage = StorageHelper();

    bool? firstTime = await storage.fetchItem(key: "firstTime") ?? true;
    if (firstTime == null || firstTime) {
      firstTime = false;
      storage.saveItem(
        key: "firstTime",
        item: false,
      );
      return true;
    }
    return firstTime;
  }

  bool saveToken(response) {
    isAuthenticated = response != null && response["accessToken"] != null;

    if (isAuthenticated) {
      StorageHelper storage = StorageHelper();
      access = AccessUser.fromJson(response);
      storage.saveItem(
        key: storageAccessUserKey,
        item: access?.toJson(),
      );
    }
    return isAuthenticated;
  }

  Future<bool> refreshToken() async {
    final response = await ApiProvider().get(
      HttpParamsGetDelete(
        endpoint: "/v1/auth/refresh",
        authorization: AuthService.access?.refreshToken,
        isRefresh: true,
      ),
    );

    return saveToken(response);
  }

  logout() async {
    if (AuthService.isAuthenticated) {
      StorageHelper storage = StorageHelper();
      storage.removeItem(key: storageAccessUserKey);
      access = null;
      isAuthenticated = false;
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> isAppLoggedIn() async {
    StorageHelper storage = StorageHelper();
    access = AccessUser.fromJson(
      await storage.fetchItem(
        key: storageAccessUserKey,
      ),
    );
    isAuthenticated = access?.token != null;
  }

  Future<bool?> register({required User newUser}) async {
    final response = await ApiProvider().post(
        HttpParamsPostPut(endpoint: "/v1/user/create", body: newUser.toJson()));
    if (response != null) {
      return AuthService().saveToken(response);
    }
    return null;
  }
}
