import 'package:flutter/material.dart';

class AudioGuideScreen extends StatelessWidget {
  const AudioGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/audio_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Dark Gradient Overlay (for text)
          // Positioned.fill(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.black38,
          //           Colors.transparent,
          //           Colors.black87,
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // 🔹 Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, color: Colors.white),
                      const Spacer(),
                      const Text(
                        'Audio Guide',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const Spacer(),

                // 🔹 Description Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child:  Text(
                    'Angkor Wat is a Hindu-Buddhist complex in Cambodia. '
                    'Located on a site measuring 162.6 hectares within the ancient '
                    'Khmer capital city of Angkor, it was originally constructed '
                    'in 1150 CE as a Hindu temple dedicated to the deity Vishnu.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                      
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Start Listening Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: navigate to audio player
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Start Listening Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Page Indicator Dots
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     _Dot(isActive: true),
                //     _Dot(),
                //     _Dot(),
                //   ],
                // ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
