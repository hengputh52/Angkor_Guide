import 'package:app/screen/audio_screen/audio_guide_screen.dart';
import 'package:app/widget/action_button.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:app/widget/explore_card.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  
  @override
  Widget build(BuildContext context) {


    void onAudio()
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AudioGuideScreen())
      );
  }
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

              // const SizedBox(height: 10),

              // // 🔹 Top App Bar
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         const Icon(Icons.menu),
              //         const SizedBox(width: 12),
              //     // CircleAvatar(
              //     //   backgroundImage:
              //     //       AssetImage('assets/images/angkor_logo.png'),
              //     // ),
              //       const SizedBox(width: 10),
              //       const Text(
              //       'Angkor Guide',
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //       ],
              //     ),
                  
              //     LanguageSwitchButton(onLanguageChanged: (lang)
              //     {

              //     })
              //   ],
              // ),

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
              ExploreCard(
                image: 'assets/images/monk_angkor_wat.png',
                title: 'Angkor Wat',
              ),

              const SizedBox(height: 20),

              ExploreCard(
                image: 'assets/images/back_angkor_wat.png',
                title: 'Angkor Wat',
              ),

              const SizedBox(height: 20),

              ExploreCard(
                image: 'assets/images/sculpture.png',
                title: 'Angkor Wat Sculpture'),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
