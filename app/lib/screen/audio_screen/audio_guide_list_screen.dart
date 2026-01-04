import 'package:app/model/point_of_interest.dart';
import 'package:app/model/language.dart';
import 'package:app/screen/audio_screen/audio_guide_player_screen.dart';
import 'package:app/services/json_loader.dart';
import 'package:app/services/language_provide.dart';
import 'package:app/services/language_service.dart';
import 'package:app/widget/audio_guide_item.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final spotListPath = 'assets/data/point_of_interest.json';

class AudioGuideListScreen extends StatefulWidget {
  const AudioGuideListScreen({super.key});

  @override
  State<AudioGuideListScreen> createState() => _AudioGuideListScreenState();
}

class _AudioGuideListScreenState extends State<AudioGuideListScreen> {
  List<PointOfInterest> spots = [];
  

  @override
  void initState() {
    super.initState();
    loadAudioSpots();
  }

  Future<void> loadAudioSpots() async {
    final jsonMap = await JsonLoader.load(spotListPath);
    final jsonList = jsonMap['pointsOfInterest'] as List<dynamic>;

    setState(() {
      spots = jsonList
          .map((e) => PointOfInterest.fromJson(e))
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.watch<LanguageProvider>().current;
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F5),
      drawer: DrawerBar(
        homeLabel: LanguageService().getHomeLabel(currentLanguage),
        audioLabel: LanguageService().getAudioGuideLabel(currentLanguage),
        mapLabel: LanguageService().getMapLabel(currentLanguage),
        favoriteLabel: LanguageService().getFavoriteLabel(currentLanguage),
        settingLabel: LanguageService().getSettingLabel(currentLanguage),
      ),
      appBar: AppBar(
        title: const Text('Angkor Guide'),
        actions: [
          LanguageSwitchButton(
            onLanguageChanged: (code) {
              final lang = Language.values.firstWhere(
                (e) => e.code == code, orElse: () => Language.en
              );
              context.read<LanguageProvider>().set(lang);
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              '${spots.length} destinations',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: spots.length,
                itemBuilder: (context, index) {
                  final poi = spots[index];
                  final guide =
                      poi.guides[currentLanguage] ??
                      poi.guides[Language.en];

                  if (guide == null) {
                    return const SizedBox.shrink();
                  }

                  return AudioGuideItem(
                    number: index + 1,
                    title: guide.title,
                    imagePath: poi.image,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AudioGuidePlayerScreen(
                            points: spots,
                            lanuage: currentLanguage,
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
      ),
    );
  }
}
