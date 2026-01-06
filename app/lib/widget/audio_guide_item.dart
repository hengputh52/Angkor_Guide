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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.black12,
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                imagePath,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 45,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
          ],
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bookmark Button (Yellow when favorited)
            FavoriteButton(poiId: poiId, size: 22),
            const SizedBox(width: 4),
            // Play Button
            IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.play_circle,
                size: 28,
                color: isDark ? Colors.white : Colors.black,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}