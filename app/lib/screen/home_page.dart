import 'package:app/model/temple.dart';
import 'package:app/screen/audio_screen/audio_guide_screen.dart';
import 'package:app/services/json_loader.dart';
import 'package:app/widget/action_button.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:app/widget/explore_card.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';

final String templeFilePath = 'assets/data/temple_data.json';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Temple> temples = [];

    @override 
  void initState()
  {
    super.initState();
    loadTemples();
  }

  Future <void> loadTemples() async 
  {
    final json = await JsonLoader.load(templeFilePath);
    final templeList = json['temples'] as List;

    setState(() {
      temples = templeList.map((e) => Temple.fromJson(e)).toList();
    });
  }

  void onAudio()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AudioGuideScreen())
      );
  }

  void onClickTemple(Temple temple)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AudioGuideScreen())
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerBar(),
      appBar: AppBar(
        title: Text('Angkor Guide'),
        actions: [
          LanguageSwitchButton(onLanguageChanged: (lang) {}),
          const SizedBox(width: 20)
          ],
        ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const SizedBox(height: 20),

              // 🔹 Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Action Buttons
              Row(
                children: [
                  ActionChipButton(
                    icon: Icons.headphones,
                    label: 'Audio Guide',
                    onTap: onAudio,
                  ),
                  const SizedBox(width: 12),
                  ActionChipButton(
                    icon: Icons.map_outlined,
                    label: 'Map',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🔹 Explore Cards

              ...temples.map(
                (temple) => Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ExploreCard(
                    image: temple.image,
                    title: temple.name,
                    onTap: () => onClickTemple(temple),
                    ),
                )
              )
              

            ],
          ),
        ),
      ),
    );
  }
}
