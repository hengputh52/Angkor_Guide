import 'package:app/model/point_of_interest.dart';
import 'package:app/screen/audio_screen/audio_guide_player_screen.dart';
import 'package:app/services/json_loader.dart';
import 'package:app/widget/audio_guide_item.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';

final spotListPath = 'data/point_of_interest.json';

class AudioGuideListScreen extends StatefulWidget {
  const AudioGuideListScreen({super.key});

  @override
  State<AudioGuideListScreen> createState() => _AudioGuideListScreenState();
}

class _AudioGuideListScreenState extends State<AudioGuideListScreen> {

  List<PointOfInterest> spots = [];
  //bool isLoading = true;

  @override  
  void initState()
  {
    super.initState();
    loadAuidoSpots();
  }
 Future<void> loadAuidoSpots() async
 {
  final jsonMap = await JsonLoader.load(spotListPath);
  final jsonList = jsonMap['pointsOfInterest'] as List<dynamic>;

  setState(() {
    spots = jsonList.map((e) => PointOfInterest.fromJson(e)).toList();
    //isLoading = false;
  });
 }




  @override
  Widget build(BuildContext context) {

    // if(isLoading)
    // {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F5),
      drawer: DrawerBar(),
      appBar: AppBar(
        title: Text('Angkor Guide'),
        actions: [
          LanguageSwitchButton(onLanguageChanged: (lang) {}),
          const SizedBox(width: 20)
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              '10 destination',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
                  child: ListView.builder(
                  itemCount: spots.length,
                  itemBuilder: (context, index) {
                    final audioList = spots[index];

                    return AudioGuideItem(
                      number: index + 1,
                      poi: audioList,
                      currentLang: 'en',
                      onTap: (){
                        Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AudioGuidePlayerScreen(
                    title: audioList.name['en']!,
                    audioPath: audioList.audio['en']!,
                    imageUrl: audioList.image,
                    description:
                        "Historical description loaded per destination",
                  ),
                ),
              );
                      },
                      
                    );
                  },
                  
                )
              
            ),
          ],
        ),
      ),
    );
  }
}
