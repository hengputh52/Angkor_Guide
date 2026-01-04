import 'package:app/screen/audio_screen/audio_guide_screen.dart';
import 'package:app/screen/home_page.dart';
import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key, required this.homeLabel, required this.audioLabel, required this.mapLabel, required this.favoriteLabel, required this.settingLabel});
  final String homeLabel;
  final String audioLabel;
  final String mapLabel;
  final String favoriteLabel;
  final String settingLabel;

  @override
  Widget build(BuildContext context) {

    void onHome()
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    }

    void onAudio()
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AudioGuideScreen())
      );
    }
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        
        children: [
          const SizedBox(height: 50),
          _IconFeature(
            icon: Icons.home,
            title: homeLabel, 
            onTap: onHome
          ),

          _IconFeature(
            icon: Icons.headphones,
            title: audioLabel, 
            onTap: onAudio
          ),

          _IconFeature(
            icon: Icons.map,
            title: mapLabel, 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.favorite,
            title: favoriteLabel, 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.settings,
            title: settingLabel, 
            onTap: (){}
          ),

        ],
      ),
    );
  }
}



class _IconFeature extends StatelessWidget{
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _IconFeature({required this.icon, required this.title, required this.onTap});
  

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            )
            ),
          icon: Icon(icon, color: Colors.black),
          label: Text(title, style: TextStyle(color: Colors.black)),
          onPressed: onTap,
          
          ),
      );
    
  }
}