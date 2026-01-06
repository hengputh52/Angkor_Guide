import 'package:app/model/language.dart';
import 'package:app/model/user.dart';


class LanguageService {
  String _currentLanague = 'en';
  String get currentLanague => _currentLanague;

  void changeLanague(String code)
  {
    _currentLanague = code;
  }

  String getWelcomeText(Language language, User? user) {
    switch (language) {
      case Language.en:
        return 'Welcome, ${user?.firstName ?? ''} ${user?.lastName ?? ''}';
      case Language.kh:
        return 'ស្វាគមន៍, ${user?.firstName ?? ''} ${user?.lastName ?? ''}';
      case Language.fr:
        return 'Bienvenue, ${user?.firstName ?? ''} ${user?.lastName ?? ''}';
    }
  }

  String getAudioGuideLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Audio Guide';
      case Language.kh:
        return 'មគ្គុទេសក៍សំឡេង';
      case Language.fr:
        return 'Guide Audio';
    }
  }

  String getHomeLabel(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Home';
      case Language.kh:
        return 'ទំព័រដើម';
      case Language.fr:
        return 'Accueil';
    }
  }


  String getMapLabel(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Map';
      case Language.kh:
        return 'ផែនទី';
      case Language.fr:
        return 'Carte';
    }
  }

  String getFavoriteLabel(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Favorite';
      case Language.kh:
        return 'ចំណង់ចំណូលចិត្ត';
      case Language.fr:
        return 'Favoris';
    }
  }

  String getSettingLabel(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Setting';
      case Language.kh:
        return 'ការកំណត់';
      case Language.fr:
        return 'Paramètres';
    }
  }

  String getAuidoScreenDescription(Language language) {
    switch (language) {
      case Language.en:
        return 'Angkor Wat is a Hindu-Buddhist complex in Cambodia. '
            'Located on a site measuring 162.6 hectares within the ancient '
            'Khmer capital city of Angkor, it was originally constructed '
            'in 1150 CE as a Hindu temple dedicated to the deity Vishnu.';
      case Language.kh:
        return 'អង្គរវត្តគឺជាសំណង់សាសនាធំជាងគេនៅលើពិភពលោក។ '
            'វាត្រូវបានស្ថិតនៅលើដីទំហំ ១៦២.៦ ហិកតា ក្នុងទីក្រុងបុរាណអង្គរ '
            'និងត្រូវបានសាងសង់ឡើងក្នុងឆ្នាំ ១១៥០ គ.ស. ជាវិហារសាសនាហិណ្ឌូ '
            'ដែលឧទ្ទិសដល់ព្រះវិស្ណុ។';
      case Language.fr:
        return 'Angkor Wat est un complexe hindou-bouddhiste au Cambodge. '
            'Situé sur un site de 162,6 hectares dans l\'ancienne capitale khmère d\'Angkor, '
            'il a été construit en 1150 comme temple hindou dédié à Vishnu.';
    }
  }

  String getStartListeninglabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Start Listening Now';
      case Language.kh:
        return 'ចាប់ផ្តើមស្តាប់ឥឡូវនេះ';
      case Language.fr:
        return 'Commencer à écouter maintenant';
    }
  }

  String getFirstNameLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'First Name';
      case Language.kh:
        return 'នាមខ្លួន';
      case Language.fr:
        return 'Prénom';
    }
  }

  String getLastNameLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Last Name';
      case Language.kh:
        return 'នាមត្រកូល';
      case Language.fr:
        return 'Nom de famille';
    }
  }

  String getContinueButtonLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Continue';
      case Language.kh:
        return 'បន្ត';
      case Language.fr:
        return 'Continuer';
    }
  }

  String getHintTextFirstName(Language language) {
    switch (language) {
      case Language.en:
        return 'Enter your First Name';
      case Language.kh:
        return 'បញ្ចូលនាមខ្លួនរបស់អ្នក';
      case Language.fr:
        return 'Entrez votre prénom';
    }
  }

  String getHintTextLastName(Language language) {
    switch (language) {
      case Language.en:
        return 'Enter your Last Name';
      case Language.kh:
        return 'បញ្ចូលនាមត្រកូលរបស់អ្នក';
      case Language.fr:
        return 'Entrez votre nom de famille';
    }
  }

  String getValidateMessage(Language language) {
    switch (language) {
      case Language.en:
        return 'Name cannot be empty';
      case Language.kh:
        return 'ឈ្មោះមិនអាចទទេបានទេ';
      case Language.fr:
        return 'Le nom ne peut pas être vide';
    }
  }

  String getMapDescription(Language language) {
    switch (language) {
      case Language.en:
        return 'Angkor Wat is designed to represent the Hindu universe. The temple is built in a balanced, symmetrical layout, with structures arranged from the outer area toward the central towers. '
            'This map shows how visitors move from the outer world toward the spiritual center of the temple.';
      case Language.kh:
        return 'ប្រាសាទអង្គរវត្តត្រូវបានរចនាឡើងដើម្បីតំណាងឱ្យពិភពលោកសាសនាហិណ្ឌូ។ ប្រាសាទនេះមានប្លង់សមស្រប និងសមមូល ដោយសំណង់ត្រូវបានរៀបចំចេញពីតំបន់ខាងក្រៅទៅកាន់ប៉មកណ្តាល។ '
            'ផែនទីនេះបង្ហាញពីវិធីដែលភ្ញៀវទេសចរធ្វើដំណើរចេញពីពិភពក្រៅទៅកាន់មជ្ឈមណ្ឌលសាសនានៃប្រាសាទ។';
      case Language.fr:
        return 'Angkor Wat est conçu pour représenter l\'univers hindou. Le temple est construit selon un plan équilibré et symétrique, avec des structures disposées de la périphérie vers les tours centrales. '
            'Cette carte montre comment les visiteurs se déplacent du monde extérieur vers le centre spirituel du temple.';
    }
  }

  String getDestinationLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Destination';
      case Language.kh:
        return 'គោលដៅ';
      case Language.fr:
        return 'Destination';
    }
  }

  
}