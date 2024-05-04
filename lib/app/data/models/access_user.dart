import '../../data/enums/role.dart';

class AccessUser {
  AccessUser({
    this.token,
    this.refreshToken,
    this.userCode,
    this.role,
    this.companyCode,
    this.passwordUpdatedAt,
    required this.havePasswordUpdatedAt,
  });

  AccessUser clone({
    DateTime? newPasswordUpdatedAt,
  }) {
    return AccessUser(
        role: role,
        refreshToken: refreshToken,
        token: token,
        userCode: userCode,
        companyCode: companyCode,
        passwordUpdatedAt: newPasswordUpdatedAt,
        havePasswordUpdatedAt: true);
  }

  final String? token;
  final String? refreshToken;
  final int? userCode;
  final Role? role;
  final int? companyCode;
  final DateTime? passwordUpdatedAt;
  final bool havePasswordUpdatedAt;

  factory AccessUser.fromJson(Map<String, dynamic>? json) {
    Role? safeRole;
    try {
      if (json != null) {
        safeRole = Role.values.byName(json["role"]["designation"]);
      }
    } catch (_) {}
    return AccessUser(
        token: json?["accessToken"],
        refreshToken: json?["refreshToken"],
        userCode: json?["userCode"],
        companyCode: json?["companyCode"],
        role: safeRole,
        passwordUpdatedAt:
            DateTime.tryParse(json?["passwordUpdatedAt"].toString() ?? ""),
        havePasswordUpdatedAt: json?.containsKey("passwordUpdatedAt") ?? false);
  }

  Map<String, dynamic> toJson() => {
        if (token != null) "accessToken": token,
        if (refreshToken != null) "refreshToken": refreshToken,
        if (userCode != null) "userCode": userCode,
        if (role != null) "role": {"designation": role?.name},
        if (companyCode != null) "companyCode": companyCode,
        if (passwordUpdatedAt != null)
          "passwordUpdatedAt": passwordUpdatedAt?.toIso8601String(),
      };
}
