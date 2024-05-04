import '../../enums/role.dart';

List<User> usersFromJson(dynamic str) =>
    List<User>.from(str["items"].map((x) => User.fromJson(x)));

class User {
  User(
      {this.id,
      this.fullName,
      required this.phoneNumber,
      this.phoneCountryCode,
      this.email,
      this.role,
      this.deviceId,
      this.createdAt,
      this.password});

  final int? id;
  final String? deviceId;
  final String? fullName;
  final String? password;

  final String phoneNumber;
  final String? phoneCountryCode;
  final String? email;
  final Role? role;
  final DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json, [String? languageCode]) {
    return User(
      id: json["id"],
      fullName: json["fullName"],
      deviceId: json['deviceId'],
      phoneNumber: json["phoneNumber"],
      phoneCountryCode: json["phoneCountryCode"],
      email: json["email"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        if (fullName != null) "fullName": fullName,
        if (password != null) "password": password,
        if (email != null) "email": email,
        if (deviceId != null) "deviceId": deviceId,
        "phoneNumber": phoneNumber,
        if (phoneCountryCode != null) "phoneCountryCode": phoneCountryCode,
        if (role != null) "role": role?.name,
      };
}
