import 'package:get/get.dart';

import '../../../core/extensions/string/language.dart';
import '../../../core/values/languages/base_language.dart';
import '../../../core/values/languages/image_language.dart';
import '../../../core/values/languages/translations/fr.dart';
import '../../../data/models/item_select.dart';
import 'translations/ar.dart';
import 'translations/en.dart';

class Language extends Translations {
  final BaseLanguage fr = FrLanguage();
  final BaseLanguage ar = ArLanguage();
  final BaseLanguage en = EnLanguage();
  static final List<ImageLanguage> list = [
    ImageLanguage(code: "fr", name: "french".tr),
    ImageLanguage(code: "ar", name: "arabic".tr),
    ImageLanguage(code: "en", name: "english".tr),
  ];

  static String? getImage(String code) {
    return list.firstWhereOrNull((element) => element.code == code)?.name;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'fr': fr.toJson(),
        'ar': ar.toJson(),
        'en': en.toJson(),
      };

  static ImageLanguage? getElementByCode(
    String code,
  ) {
    ImageLanguage? item =
        list.firstWhereOrNull((element) => element.code == code);
    return item;
  }

  static ItemSelect? getElementForSelect(String? code) {
    if (code == null) {
      return null;
    }

    ImageLanguage? item = getElementByCode(code.languageCode);
    if (item != null) {
      return ItemSelect(
        value: item,
        label: item.name,
      );
    }
    return null;
  }
}
