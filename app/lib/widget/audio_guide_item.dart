import 'package:flutter/material.dart';

class AudioGuideItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final int number; // Add this

  const AudioGuideItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    required this.number, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12))
      ),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(imagePath, width: 60, fit: BoxFit.cover),
            ),
          ],
        ),
        title: Text(title),
        //subtitle: Text(type.toUpperCase()),
        trailing: const Icon(Icons.play_circle),
        onTap: onTap,
      ),
    );
  }
}

