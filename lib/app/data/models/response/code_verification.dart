class ResponseCodeVerification {
  final bool isValidate;
  final bool isProvider;
  final Map<String, dynamic>? auth;

  ResponseCodeVerification(
      {this.isValidate = false, this.isProvider = false, this.auth});

  factory ResponseCodeVerification.fromJson(Map<String, dynamic> json) =>
      ResponseCodeVerification(
        isValidate: json["isValidate"],
        isProvider: json["isProvider"],
        auth: json["auth"],
      );
}
