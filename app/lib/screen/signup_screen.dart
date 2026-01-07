import 'package:app/model/language.dart';
import 'package:app/model/user.dart';
import 'package:app/screen/home_page.dart';
import 'package:app/services/language_provide.dart';
import 'package:app/services/language_service.dart';
import 'package:app/widget/animations/flow_page_animation.dart';
import 'package:app/widget/authForm/auth_form.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:app/services/user_service.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLogin = false;
  String? _loginError;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? validateName(String? value) {
    final language = context.read<LanguageProvider>().current;
    if (value == null || value.isEmpty) {
      return LanguageService().getValidateNameMessage(language);
    }
    return null;
  }

  String? validateUsername(String? value) {
    final language = context.read<LanguageProvider>().current;
    if (value == null || value.isEmpty) {
      return LanguageService().getValidateUsernameMessage(language);
    }
    return null;
  }

  String? validatePassword(String? value) {
    final language = context.read<LanguageProvider>().current;
    if (value == null || value.isEmpty) {
      return LanguageService().getValidatePasswordMessage(language);
    }
    if (value.length < 4) {
      return LanguageService().getValidatePasswordLengthMessage(language);
    }
    return null;
  }

  void onContinue() async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      if (_isLogin) {
        // Login logic
        final success = await UserService.login(
          _usernameController.text.trim(),
          _passwordController.text.trim(),
        );
        if (success) {
          Navigator.pushReplacement(
            context,
            FlowPageRoute(page: const HomeScreen()),
          );
        } else {
          setState(() {
            _loginError = LanguageService().getInvalidUsernameOrPassword(
              context.read<LanguageProvider>().current,
            );
          });
        }
      } else {
        // Sign up logic
        final user = User(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          username: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        );
        await UserService.saveUser(user);
        Navigator.pushReplacement(
          context,
          FlowPageRoute(page: const HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageProvider>().current;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background illustration image
          Positioned.fill(
            child: Image.asset(
              'assets/images/angkor_thom.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/images/bayon_face.png'),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Angkor Guide',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      LanguageSwitchButton(
                        onLanguageChanged: (code) {
                          final lang = Language.values.firstWhere(
                            (e) => e.code == code, orElse: () => Language.en,
                          );
                          context.read<LanguageProvider>().set(lang);
                        },
                      )
                    ],
                  ),
                ),
                // Form Section + Continue Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Toggle login/signup
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                           
                          ],
                        ),
                        if (_loginError != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              _loginError!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        // Use AuthForm here!
                        AuthForm(
                          isLogin: _isLogin,
                          firstNameController: _firstNameController,
                          lastNameController: _lastNameController,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          validateName: validateName,
                          validateUsername: validateUsername,
                          validatePassword: validatePassword,
                          firstNameLabel: LanguageService().getFirstNameLabel(language),
                          firstNameHint: LanguageService().getHintTextFirstName(language),
                          lastNameLabel: LanguageService().getLastNameLabel(language),
                          lastNameHint: LanguageService().getHintTextLastName(language),
                          usernameLabel: LanguageService().getUserNameLabel(language),
                          usernameHint: LanguageService().getHintUserNameLabel(language),
                          passwordLabel: LanguageService().getPasswordLabel(language),
                          passwordHint: LanguageService().getHintPasswordLabel(language),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            onPressed: onContinue,
                            child: Text(
                              _isLogin
                                ? LanguageService().getLoginButtonLabel(language)
                                : LanguageService().getContinueButtonLabel(language),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                         TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                  _loginError = null;
                                });
                              },
                              child: Text(
                                _isLogin
                                  ? LanguageService().getDontHaveAccount(language)
                                  : LanguageService().getAlreadyHaveAccount(language),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
