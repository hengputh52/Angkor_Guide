import 'package:app/services/language_provide.dart';
import 'package:app/widget/lanaguage/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LanguageSwitchButton extends StatelessWidget {
  final Function(String) onLanguageChanged;

  const LanguageSwitchButton({super.key, required this.onLanguageChanged});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => LanguageSelectorSheet(
            onSelected: (lang)
            {
              context.read<LanguageProvider>().set(lang);
            },
          ),
        );
      },
    );
  }
}


