import 'package:flutter/material.dart';
import 'package:background/background.dart';

class VideoScreen extends StatelessWidget{
  const VideoScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Background(
      path: 'assets/videos/start_video.mp4', // Your video asset path
      child: Stack(
        children: [
          Text('hi')
        ],
      )
    ),
  );
}
}