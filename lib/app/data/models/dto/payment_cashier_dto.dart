List<PaymentCashier> paymentCashierFromJson(dynamic str) =>
    List<PaymentCashier>.from(str.map((x) => PaymentCashier.fromJson(x)));

class PaymentCashier {
  String cashierName;
  int sessionNumber;
  double? totalAmount;

  PaymentCashier({
    required this.cashierName,
    required this.sessionNumber,
    required this.totalAmount,
  });

  factory PaymentCashier.fromJson(Map<String, dynamic> json) {
    return PaymentCashier(
      cashierName: json["cashierName"],
      sessionNumber: json["nbreSession"],
      totalAmount: double.parse(json["totalAmount"].toString()),
    );
  }
}
