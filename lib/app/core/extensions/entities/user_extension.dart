import '../../../data/models/entities/user.dart';
import '../string/capitalize_first_letter.dart';

extension FullName on User? {
  String get fullName =>
      this == null ? "" : this!.fullName.safeCapitalizeFirstLetter;
}

/*extension FullPhone on User? {
  String get fullPhoneNumber =>
      this?.phonePrefix == null || this?.authPhoneNumber == null
          ? ""
          : "${this!.phonePrefix} ${this!.authPhoneNumber}";
}*/
