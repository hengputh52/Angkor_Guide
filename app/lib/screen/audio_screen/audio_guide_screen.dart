import 'package:app/screen/audio_screen/audio_guide_list_screen.dart';
import 'package:app/widget/drawer_bar.dart';
import 'package:flutter/material.dart';

class AudioGuideScreen extends StatelessWidget {
  const AudioGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void onStart()
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AudioGuideListScreen())
        );
    }
    return Scaffold(
      drawer: DrawerBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Audio Guide',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [

          // 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/audio_background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),

                // 🔹 Description Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
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
                      onPressed: onStart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
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

                // 🔹 Page Indicator Dots (optional)
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
