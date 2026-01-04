import 'package:app/model/language.dart';
import 'package:app/model/temple.dart';
import 'package:app/model/user.dart';
import 'package:app/screen/audio_screen/audio_guide_screen.dart';
import 'package:app/screen/map_screen/map_screen.dart';
import 'package:app/services/json_loader.dart';
import 'package:app/services/language_provide.dart';
import 'package:app/services/language_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/widget/action_button.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:app/widget/explore_card.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final String templeFilePath = 'assets/data/temple_data.json';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Temple> temples = [];
  

  User? currentUser;

    @override 
  void initState()
  {
    super.initState();
    loadTemples();
    loadUser();
  }

  Future <void> loadTemples() async 
  {
    final json = await JsonLoader.load(templeFilePath);
    final templeList = json['temples'] as List;

    setState(() {
      temples = templeList.map((e) => Temple.fromJson(e)).toList();
    });
  }

  Future <void> loadUser() async
  {
    final user = await UserService.getUser();
    setState(() {
      currentUser = user;
    });
  }

  void onAudio()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AudioGuideScreen())
      );
  }


  void onMapPressed(){
    Navigator.push(
      context,
       MaterialPageRoute(builder: (context) => const MapScreen()),
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
    final language = context.watch<LanguageProvider>().current;
    
 
    return Scaffold(
      drawer: DrawerBar(
        homeLabel: LanguageService().getHomeLabel(language),
        audioLabel: LanguageService().getAudioGuideLabel(language),
        mapLabel: LanguageService().getMapLabel(language),
        favoriteLabel: LanguageService().getFavoriteLabel(language),
        settingLabel: LanguageService().getSettingLabel(language)
        ),
      appBar: AppBar(
        title: Text(LanguageService().getWelcomeText(language, currentUser)),
        
        actions: [
          LanguageSwitchButton(onLanguageChanged: (code) {
            final lang = Language.values.firstWhere(
              (e) => e.code == code, orElse: () => Language.en 
            );
            context.read<LanguageProvider>().set(lang);
          }
          ),
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
                    label: LanguageService().getAudioGuideLabel(language),
                    onTap: onAudio,
                  ),
                  const SizedBox(width: 12),
                  ActionChipButton(
                    icon: Icons.map_outlined,
                    label: LanguageService().getMapLabel(language),
                    onTap: onMapPressed,
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
                    title: temple.getName(language),
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
