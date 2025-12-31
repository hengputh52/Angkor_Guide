import 'package:flutter/material.dart';

class LanguageSelectorSheet extends StatelessWidget {
  final Function(String) onSelected;

  const LanguageSelectorSheet({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Text('🇬🇧'),
          title: const Text('English'),
          onTap: () {
            onSelected('en');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Text('🇰🇭'),
          title: const Text('ខ្មែរ'),
          onTap: () {
            onSelected('km');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
