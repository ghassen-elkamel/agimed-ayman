import '../../utils/constant.dart';

extension CurrencyFormat on double? {
  String get toCurrency {
    double amount = this ?? 0;

    String formattedAmount = amount.toStringAsFixed(currencyDecimals);
    if (amount >= 1000) {
      RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      formattedAmount =
          formattedAmount.replaceAllMapped(regex, (match) => '${match[1]},');
    }
    return "$currencyAbbreviation $formattedAmount";
  }
}
