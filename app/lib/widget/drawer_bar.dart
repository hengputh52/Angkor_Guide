import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        
        children: [
          const SizedBox(height: 50),
          _IconFeature(
            icon: Icons.home,
            title: 'Home', 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.headphones,
            title: 'Audio', 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.map,
            title: 'Map', 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.favorite,
            title: 'Favuorite', 
            onTap: (){}
          ),

          _IconFeature(
            icon: Icons.settings,
            title: 'Setting', 
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
    
    return Container(
      //color: Colors.black,
      child: SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
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
      )
    );
  }
}