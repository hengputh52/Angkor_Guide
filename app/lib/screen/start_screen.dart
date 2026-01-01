import 'package:app/screen/signup_screen.dart';
import 'package:app/widget/animations/fade_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
      'assets/videos/angkor_wat_video_start.mp4',
    )
      ..setLooping(true)
      ..setVolume(0.0)
      ..initialize().then((_) {
        _videoController.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void onStart()
  {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const SignUpScreen())
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Video
          Positioned.fill(
            child: _videoController.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoController.value.size.width,
                      height: _videoController.value.size.height,
                      child: VideoPlayer(_videoController),
                    ),
                  )
                : Container(color: const Color.fromARGB(255, 189, 177, 177)),
          ),

          /// Top App Title
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundImage: AssetImage('assets/images/bayon_face.png'),
                  //child: Icon(Icons.temple_hindu, color: Colors.white),
                  
                ),
                
                SizedBox(width: 10),
                Text(
                  'Angkor Guide',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// Welcome Text Overlay
          Positioned(
            bottom: 150,
            
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              // decoration: BoxDecoration(
              //   color: Colors.black.withOpacity(0.5),
              //   borderRadius: BorderRadius.circular(12),
              // ),
              child: const Text(
                'Welcome to\nAngkor Wat',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ),

          /// Start Button
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 55,
              child: FadeSlideAnimation(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  //shadowColor: Colors.transparent,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(
                      color: Colors.white24,
                      width: 0.5
                    )
                  ),
                ),
                onPressed: onStart,
                child: const Text(
                  'Start Explore',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
