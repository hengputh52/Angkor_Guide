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
        return 'Sign Up';
      case Language.kh:
        return 'ចុះឈ្មោះ';
      case Language.fr:
        return 'S\'inscrire';
    }
  }

  String getPasswordLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Password';
      case Language.kh:
        return 'ពាក្យសម្ងាត់';
      case Language.fr:
        return 'Mot de passe';
    }
  }

  String getHintPasswordLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Enter your Password';
      case Language.kh:
        return 'បញ្ចូលពាក្យសម្ងាត់របស់អ្នក';
      case Language.fr:
        return 'Entrez votre mot de passe';
    }
  }

  String getUserNameLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'User Name';
      case Language.kh:
        return 'ឈ្មោះអ្នកប្រើ';
      case Language.fr:
        return 'Nom d\'utilisateur';
    }
  }

  String getHintUserNameLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Enter your User Name';
      case Language.kh:
        return 'បញ្ចូលឈ្មោះអ្នកប្រើរបស់អ្នក';
      case Language.fr:
        return 'Entrez votre nom d\'utilisateur';
    }
  }

  String getLoginButtonLabel(Language language) {
    switch (language) {
      case Language.en:
        return 'Log in';
      case Language.kh:
        return 'ចូល';
      case Language.fr:
        return 'Se connecter';
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

  String getValidateNameMessage(Language language) {
    switch (language) {
      case Language.en:
        return "Name cannot be empty";
      case Language.kh:
        return "ឈ្មោះមិនអាចទទេបានទេ";
      case Language.fr:
        return "Le nom ne peut pas être vide";
    }
  }

  String getValidateUsernameMessage(Language language) {
    switch (language) {
      case Language.en:
        return "Username cannot be empty";
      case Language.kh:
        return "ឈ្មោះអ្នកប្រើមិនអាចទទេបានទេ";
      case Language.fr:
        return "Le nom d'utilisateur ne peut pas être vide";
    }
  }

  String getValidatePasswordMessage(Language language) {
    switch (language) {
      case Language.en:
        return "Password cannot be empty";
      case Language.kh:
        return "ពាក្យសម្ងាត់មិនអាចទទេបានទេ";
      case Language.fr:
        return "Le mot de passe ne peut pas être vide";
    }
  }

  String getValidatePasswordLengthMessage(Language language) {
    switch (language) {
      case Language.en:
        return "Password must be at least 4 characters";
      case Language.kh:
        return "ពាក្យសម្ងាត់ត្រូវតែមានយ៉ាងហោចណាស់ 4 តួអក្សរ";
      case Language.fr:
        return "Le mot de passe doit comporter au moins 4 caractères";
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

  String getInvalidUsernameOrPassword(Language language) {
    switch (language) {
      case Language.en:
        return "Invalid username or password";
      case Language.kh:
        return "ឈ្មោះអ្នកប្រើ ឬ ពាក្យសម្ងាត់មិនត្រឹមត្រូវ";
      case Language.fr:
        return "Nom d'utilisateur ou mot de passe invalide";
    }
  }

  String getDontHaveAccount(Language language) {
    switch (language) {
      case Language.en:
        return "Don't have an account? Sign up";
      case Language.kh:
        return "មិនទាន់មានគណនី? ចុះឈ្មោះ";
      case Language.fr:
        return "Vous n'avez pas de compte ? Inscrivez-vous";
    }
  }

  String getAlreadyHaveAccount(Language language) {
    switch (language) {
      case Language.en:
        return "Already have an account? Log in";
      case Language.kh:
        return "មានគណនីរួចហើយ? ចូល";
      case Language.fr:
        return "Vous avez déjà un compte ? Connectez-vous";
    }
  }

  String getSettingButtonLabel(Language language)
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

  String getUserProfileText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Your Profile';
      case Language.kh:
        return 'ប្រវត្តិរូបរបស់អ្នក';
      case Language.fr:
        return 'Votre profil';
    }
  }

String getUpdateProfileText(Language language) {
  switch (language) {
    case Language.en:
      return 'Update Profile';
    case Language.kh:
      return 'ធ្វើបច្ចុប្បន្នភាពប្រវត្តិរូប';
    case Language.fr:
      return 'Mettre à jour le profil';
  }
}

  String getSaveButtonLabel(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Save';
      case Language.kh:
        return 'រក្សាទុក';
      case Language.fr:
        return 'Enregistrer';
    }
  }

  String getDarkModelText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Dark Mode';
      case Language.kh:
        return 'របៀបងងឹត';
      case Language.fr:
        return 'Mode sombre';
    }
  }

  String changePasswordText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Change Password';
      case Language.kh:
        return 'ផ្លាស់ប្តូរពាក្យសម្ងាត់';
      case Language.fr:
        return 'Changer le mot de passe';
    }
  }

  String getLogout(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Log out';
      case Language.kh:
        return 'ចាកចេញ';
      case Language.fr:
        return 'Se déconnecter';
    }
  }

  String getShowModalText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Are you sure you want to log out?';
      case Language.kh:
        return 'តើអ្នកប្រាកដថាចង់ចាកចេញមែនទេ?';
      case Language.fr:
        return 'Êtes-vous sûr de vouloir vous déconnecter ?';
    }
  }

  String getYesText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Yes';
      case Language.kh:
        return 'បាទ/ចាស';
      case Language.fr:
        return 'Oui';
    }
  }

  String getNoText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'No';
      case Language.kh:
        return 'ទេ';
      case Language.fr:
        return 'Non';
    }
  }

  String getOldPasswordText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'Old Password';
      case Language.kh:
        return 'ពាក្យសម្ងាត់ចាស់';
      case Language.fr:
        return 'Ancien mot de passe';
    }
  }

  String getNewPasswordText(Language language)
  {
    switch(language)
    {
      case Language.en:
        return 'New Password';
      case Language.kh:
        return 'ពាក្យសម្ងាត់ថ្មី';
      case Language.fr:
        return 'Nouveau mot de passe';
    }
  }

  String getExploreNowLabel(Language language) {
  switch (language) {
    case Language.en:
      return 'Explore Now';
    case Language.kh:
      return 'ស្វែងយល់ឥឡូវនេះ';
    case Language.fr:
      return 'Explorer maintenant';
  }
}

  


}