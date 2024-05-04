import 'package:get/get.dart';

import '../../core/utils/constant.dart';
import '../../data/models/file_info.dart';
import '../providers/storage_provider.dart';
import '../../data/services/auth_service.dart';
import '../../routes/app_pages.dart';
import '../models/entities/user.dart';
import '../models/response/code_verification.dart';
import '../providers/external/api_provider.dart';

class UserService {
  Future<User?> register({
    required User user,
    bool withLoadingAlert = true,
  }) async {
    var response = await ApiProvider().post(
      HttpParamsPostPut(
          endpoint: "/v1/users",
          body: user.toJson(),
          withLoadingAlert: withLoadingAlert),
    );
    if (response != null) {
      return User.fromJson(response, Get.locale?.languageCode);
    }
    return null;
  }

  Future<ResponseCodeVerification?> checkCode({
    required String code,
    required int userId,
    bool withLoadingAlert = true,
  }) async {
    var response = await ApiProvider().post(
      HttpParamsPostPut(
          endpoint: "/v1/users/checkCode",
          body: {
            "code": code,
            "userId": userId,
          },
          withLoadingAlert: withLoadingAlert),
    );
    if (response != null) {
      ResponseCodeVerification responseCodeVerification =
          ResponseCodeVerification.fromJson(response);
      AuthService authService = AuthService();
      authService.saveToken(responseCodeVerification.auth);
      return responseCodeVerification;
    }
    return null;
  }

  Future<User?> findMe() async {
    var response = await ApiProvider().get(
      HttpParamsGetDelete(
        endpoint: "/v1/users/me",
        withLoadingAlert: false,
      ),
    );

    if (response != null) {
      return User.fromJson(response, Get.locale?.languageCode);
    }
    return null;
  }

  Future<User?> updateUser({
    required User user,
  }) async {
    var response = await ApiProvider().patch(
      HttpParamsPostPut(
        endpoint: "/v1/users",
        body: user.toJson(),
      ),
    );

    if (response != null) {
      return User.fromJson(response, Get.locale?.languageCode);
    }
    return null;
  }

  Future<void> uploadProfilePicture(
      {required FileInfo file, bool withLoadingAlert = true}) async {
    await ApiProvider().post(
      HttpParamsPostPut(
          isFormData: true,
          endpoint: "/v1/users/profile/photo",
          body: {},
          files: [file],
          withLoadingAlert: withLoadingAlert),
    );
  }

  Future<User?> updateOnline({bool withLoadingAlert = true}) async {
    var response = await ApiProvider().patch(
      HttpParamsPostPut(
          endpoint: "/v1/users/online",
          body: {},
          withLoadingAlert: withLoadingAlert),
    );
    if (response != null) {
      return User.fromJson(response, Get.locale?.languageCode);
    }
    return null;
  }

  Future<List<User>> findParentsWithAccounts() async {
    var response = await ApiProvider().get(
      HttpParamsGetDelete(
        endpoint: "/v1/users/with-account",
        withLoadingAlert: false,
      ),
    );
    if (response?.containsKey("items") ?? false) {
      return usersFromJson(response!["items"]);
    }
    return [];
  }

  Future<String?> sendMessagesToParent({
    required String title,
    required String description,
    required String type,
    required List<int?> parentsCode,
  }) async {
    var response = await ApiProvider().post(
      HttpParamsPostPut(
        endpoint: "/v1/parent",
        body: {
          'title': title,
          'description': description,
          'type': type,
          'parentsCode': parentsCode,
        },
      ),
    );
    if ((response?.containsKey("isAdded") ?? false) &&
        response?['isAdded'] == true) {
      Get.offAllNamed(Routes.HOME);
    }
    return null;
  }

  Future<bool> deleteUser() async {
    var response = await ApiProvider().delete(
      HttpParamsGetDelete(
        endpoint: "/v1/users",
      ),
    );
    return (response?.containsKey('affected') ?? false) &&
        response["affected"] > 0;
  }

  Future<bool> changePassword({
    required String password,
    required String newPassword,
  }) async {
    var response = await ApiProvider().patch(
      HttpParamsPostPut(
        endpoint: "/v1/users/change-password",
        body: {
          "password": password,
          "newPassword": newPassword,
        },
      ),
    );
    bool isUpdated = (response?.containsKey('isUpdated') ?? false);
    if (isUpdated) {
      AuthService.access = AuthService.access?.clone(
        newPasswordUpdatedAt: DateTime.now(),
      );

      StorageHelper storage = StorageHelper();

      storage.saveItem(
        key: storageAccessUserKey,
        item: AuthService.access?.toJson(),
      );
    }

    return isUpdated;
  }

  Future<User?> findUserByPhoneNumber(
      {required String phoneNumber, required String phonePrefix}) async {
    var response = await ApiProvider().post(
      HttpParamsPostPut(
        endpoint: "/v1/users/phone-number",
        body: {},
        queryParam: {
          "phonePrefix": '+$phonePrefix',
          "phoneNumber": phoneNumber,
        },
      ),
    );

    if (response != null) {
      return User.fromJson(response, Get.locale?.languageCode);
    }
    return null;
  }

  Future<bool> forgetPassword({
    required int? userCode,
    required String newPassword,
    required String checkCode,
    required String fcmToken,
  }) async {
    var response = await ApiProvider().patch(
      HttpParamsPostPut(
        endpoint: "/v1/users/forget-password/$userCode",
        body: {},
        queryParam: {
          "newPassword": newPassword,
          "checkCode": checkCode,
          "fcmToken": fcmToken,
        },
      ),
    );
    if (response != null) {
      AuthService authService = AuthService();
      return authService.saveToken(response);
    } else {
      return false;
    }
  }
}
