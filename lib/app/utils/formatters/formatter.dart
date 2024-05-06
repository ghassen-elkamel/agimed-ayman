import 'package:intl/intl.dart';

class AgrimedFormatter{
  static String formatDate(DateTime? date){
    date??=DateTime.now();
    return DateFormat('dd-mmm-yyyy').format(date); // date format
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'tnd-TN', symbol: 'TND').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    // Assuming a 8-digit Tunisian phone number format : 12 345 678
    if (phoneNumber.length == 8){
      return "${phoneNumber.substring(0, 2)} ${phoneNumber.substring(2, 5)} ${phoneNumber.substring(5)}";
    }
    return phoneNumber;
  }

}