

import 'package:flutter/material.dart';
import 'favorite/favorite_button.dart';

class AudioGuideItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String poiId;
  final VoidCallback onTap;
  final int number;

  const AudioGuideItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.poiId,
    required this.onTap,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bookmark Button
            FavoriteButton(poiId: poiId, size: 22),
            const SizedBox(width: 4),
            // Play Button
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.play_circle, size: 28),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}