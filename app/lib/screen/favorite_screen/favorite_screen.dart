import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:provider/provider.dart';
import '../../model/point_of_interest.dart';
import '../../model/language.dart';
import '../../services/favorite_service.dart';
import '../../services/json_loader.dart';
import '../../widget/favorite/favorite_button.dart';
import '../audio_screen/audio_guide_player_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<PointOfInterest> _allPois = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPois();
  }

  Future<void> _loadPois() async {
    try {
      final data = await JsonLoader.load('assets/data/point_of_interest.json');
      final List<dynamic> poiList = data['pointsOfInterest'];
      final pois = poiList.map((json) => PointOfInterest.fromJson(json)).toList();

      if (mounted) {
        setState(() {
          _allPois = pois;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading POIs: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Audio Guide',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<FavoriteService>(
              builder: (context, favoriteService, child) {
                final favoritePois = _allPois
                    .where((poi) => favoriteService.isFavorite(poi.id))
                    .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Text(
                        'Favorite List',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        '${favoritePois.length} destination${favoritePois.length != 1 ? 's' : ''}',
                        style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                      ),
                    ),
                    Divider(color: Colors.grey.shade300, height: 1),
                    Expanded(
                      child: favoritePois.isEmpty
                          ? _buildEmptyState()
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: favoritePois.length,
                              itemBuilder: (context, index) {
                                return _buildFavoriteItem(favoritePois[index], index + 1);
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildFavoriteItem(PointOfInterest poi, int number) {
    // Get title from English (default)
    final title = poi.guides['en']?.title ?? 'Unknown';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              poi.image,
              width: 70,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 70,
                height: 50,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Title
          Expanded(
            child: Text(
              '$number. $title',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Bookmark Button
          FavoriteButton(poiId: poi.id, size: 22),
          const SizedBox(width: 8),

          // Play Button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AudioGuidePlayerScreen(
                  
                  points: [_allPois.firstWhere((p) => p.id == poi.id)],
                  lanuage: Language.en,
                  startIndex: _allPois.indexOf(poi),
                  ),
              ),
            ),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: const Icon(Icons.play_arrow, size: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the bookmark icon to add favorites',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}