class LanguageService {
  String _currentLanague = 'en';
  String get currentLanague => _currentLanague;

  void changeLanague(String code)
  {
    _currentLanague = code;
  }

  String getText(Map<String, String> localizedText)
  {
    return localizedText[_currentLanague] ?? localizedText['en'] ?? '';
  }
}