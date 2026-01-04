import 'package:app/model/language.dart';
import 'package:flutter/material.dart';

class LanguageSelectorSheet extends StatelessWidget {
  final Function(Language) onSelected;

  const LanguageSelectorSheet({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {

    void onSelect(Language lang)
    {
      onSelected(lang);
      Navigator.pop(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Text('🇬🇧'),
          title: const Text('English'),
          onTap: () => onSelect(Language.en),
        ),
        ListTile(
          leading: const Text('🇰🇭'),
          title: const Text('ខ្មែរ'),
          onTap: () => onSelect(Language.kh),
        ),
        ListTile(
          leading: const Text('🇫🇷'),
          title: const Text('Français'),
          onTap: () => onSelect(Language.fr),
        ),
      ],
    );
  }
}
