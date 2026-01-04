enum Language { en, kh, fr }

extension LanguageExt on Language {
  String get code => name;
}
