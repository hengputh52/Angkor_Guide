
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/point_of_interest.dart';
import '../../model/language.dart';
import '../../services/favorite_service.dart';
import '../../services/json_loader.dart';
import '../../services/language_provide.dart';
import '../../services/language_service.dart';
import '../../widget/audio_guide_item.dart';
import '../../widget/drawer_bar.dart';
import '../../widget/lanaguage/langauge_switch_button.dart';
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
      pois.sort((a, b) => a.order.compareTo(b.order));

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
    final language = context.watch<LanguageProvider>().current;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F5),
      drawer: DrawerBar(
        homeLabel: LanguageService().getHomeLabel(language),
        audioLabel: LanguageService().getAudioGuideLabel(language),
        mapLabel: LanguageService().getMapLabel(language),
        favoriteLabel: LanguageService().getFavoriteLabel(language),
        settingLabel: LanguageService().getSettingLabel(language),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(LanguageService().getFavoriteLabel(language)),
        actions: [
          LanguageSwitchButton(
            onLanguageChanged: (code) {
              final lang = Language.values.firstWhere(
                (e) => e.code == code,
                orElse: () => Language.en,
              );
              context.read<LanguageProvider>().set(lang);
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<FavoriteService>(
              builder: (context, favoriteService, child) {
                final favoritePois = _allPois
                    .where((poi) => favoriteService.isFavorite(poi.id))
                    .toList();

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        '${favoritePois.length} ${LanguageService().getDestinationLabel(language)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: favoritePois.isEmpty
                            ? _buildEmptyState(language)
                            : ListView.builder(
                                itemCount: favoritePois.length,
                                itemBuilder: (context, index) {
                                  final poi = favoritePois[index];
                                  final guide = poi.guides[language] ??
                                      poi.guides[Language.en];

                                  if (guide == null) {
                                    return const SizedBox.shrink();
                                  }

                                  return AudioGuideItem(
                                    poiId: poi.id,
                                    number: index + 1,
                                    title: guide.title,
                                    imagePath: poi.image,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => AudioGuidePlayerScreen(
                                            points: favoritePois,
                                            lanuage: language,
                                            startIndex: index,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState(Language language) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'No favorites yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
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
