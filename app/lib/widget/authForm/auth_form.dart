import 'package:app/widget/authForm/custom_text_field.dart';
import 'package:flutter/material.dart';


class AuthForm extends StatelessWidget {
  final bool isLogin;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String? Function(String?)? validateName;
  final String? Function(String?)? validateUsername;
  final String? Function(String?)? validatePassword;
  final String firstNameLabel;
  final String firstNameHint;
  final String lastNameLabel;
  final String lastNameHint;
  final String usernameLabel;
  final String usernameHint;
  final String passwordLabel;
  final String passwordHint;

  const AuthForm({
    super.key,
    required this.isLogin,
    required this.firstNameController,
    required this.lastNameController,
    required this.usernameController,
    required this.passwordController,
    required this.validateName,
    required this.validateUsername,
    required this.validatePassword,
    required this.firstNameLabel,
    required this.firstNameHint,
    required this.lastNameLabel,
    required this.lastNameHint,
    required this.usernameLabel,
    required this.usernameHint,
    required this.passwordLabel,
    required this.passwordHint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLogin) ...[
          CustomTextField(
            label: firstNameLabel,
            hintText: firstNameHint,
            controller: firstNameController,
            validator: validateName,
          ),
          CustomTextField(
            label: lastNameLabel,
            hintText: lastNameHint,
            controller: lastNameController,
            validator: validateName,
          ),
        ],
        CustomTextField(
          label: usernameLabel,
          hintText: usernameHint,
          controller: usernameController,
          validator: validateUsername,
        ),
        CustomTextField(
          label: passwordLabel,
          hintText: passwordHint,
          controller: passwordController,
          validator: validatePassword,
          obscureText: true,
        ),
      ],
    );
  }
}