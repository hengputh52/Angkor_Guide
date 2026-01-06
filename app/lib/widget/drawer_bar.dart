import 'package:app/screen/audio_screen/audio_guide_screen.dart';
import 'package:app/screen/favorite_screen/favorite_screen.dart';
import 'package:app/screen/home_page.dart';
import 'package:app/screen/map_screen/map_screen.dart';
import 'package:app/widget/animations/flow_page_animation.dart';
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
        FlowPageRoute(page:  const HomeScreen())
      );
    }

    void onAudio()
    {
      Navigator.push(
        context,
        FlowPageRoute(page:  const AudioGuideScreen())
      );
    }

    void onMapPressed(){
        Navigator.push(
          context,
           FlowPageRoute(page:  const MapScreen())
      ); 
    }
    void onFavorite(){
      Navigator.pop(context);
      Navigator.push(
        context,
        FlowPageRoute(page:  const FavoriteScreen())
        );
    }
    return Drawer(
      shadowColor: Colors.white,
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/drawer_background.png', 
              fit: BoxFit.cover,
            ),
          ),
          // Drawer content
          ListView(
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
                onTap: onMapPressed,
              ),
              _IconFeature(
                icon: Icons.favorite,
                title: favoriteLabel, 
                onTap: onFavorite,
              ),
              _IconFeature(
                icon: Icons.settings,
                title: settingLabel, 
                onTap: (){}
              ),
            ],
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
        child: TextButton.icon(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
              ),
              foregroundColor: Colors.white
            ),
          icon: Icon(icon, color: Colors.white),
          label: Text(title, style: TextStyle(color: Colors.white)),
          onPressed: onTap,
          
          ),
      );
    
  }
}