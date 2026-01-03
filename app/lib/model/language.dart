enum Language { en, km, fr }

extension LanguageExt on Language {
  String get code => name;
}
