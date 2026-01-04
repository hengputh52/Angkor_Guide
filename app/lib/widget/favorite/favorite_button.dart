import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/favorite_service.dart';

class FavoriteButton extends StatelessWidget {
  final String poiId;
  final double size;

  const FavoriteButton({
    super.key,
    required this.poiId,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteService>(
      builder: (context, favoriteService, child) {
        final isFavorite = favoriteService.isFavorite(poiId);

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.black,
            size: size,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            favoriteService.toggleFavorite(poiId);
          },
        );
      },
    );
  }
}