extension LanguageNullable on String? {
  String get languageCode {
    if (this?.isEmpty ?? true) {
      return "fr";
    }
    return this!.split("_").first;
  }
}
