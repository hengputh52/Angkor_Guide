import 'package:app/services/language_provide.dart';
import 'package:app/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/map/temple_map_viewer.dart';
import 'package:provider/provider.dart';

String imagePath = 'assets/images/Map_angkor_wat.png';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final language = context.watch<LanguageProvider>().current;

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
          'Map',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description Text
            TempleMapViewer(
              imagePath: imagePath,
            ),
            
            const SizedBox(height: 34),
            
            Text(LanguageService().getMapDescription(language), 
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            
            
            
          ],
        ),
      ),
    );
  }
}