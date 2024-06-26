import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl_standalone.dart';

import '../../data/providers/storage_provider.dart';
import '../extensions/string/language.dart';
import 'constant.dart';

class LanguageHelper {
  static bool isLTR = true;
  static String? language;

  static Future<String> getLanguage() async {
    StorageHelper storage = StorageHelper();
    String? locale = await storage.fetchItem(key: storageLocaleKey);
    if (locale == null) {
      locale = await findSystemLocale();
      await storage.saveItem(key: storageLocaleKey, item: locale);
    }
    language = locale;
    return locale;
  }

  static Future<void> setLanguage(String newLanguage) async {
    StorageHelper storage = StorageHelper();
    await storage.saveItem(key: storageLocaleKey, item: newLanguage);
    setLTR(language: newLanguage);
    Get.updateLocale(Locale(newLanguage.languageCode));
    language = newLanguage;
  }

  static void setLTR({String? language}) async {
    language ??= await getLanguage();

    isLTR = !language.contains("ar");
  }
}
