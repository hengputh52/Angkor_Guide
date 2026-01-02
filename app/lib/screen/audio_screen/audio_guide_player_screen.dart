import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioGuidePlayerScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String audioPath;

  const AudioGuidePlayerScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.audioPath,
  });

  @override
  State<AudioGuidePlayerScreen> createState() =>
      _AudioGuidePlayerScreenState();
}

class _AudioGuidePlayerScreenState extends State<AudioGuidePlayerScreen> {
  final AudioPlayer _player = AudioPlayer();

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    await _player.setAsset(widget.audioPath);

    _duration = _player.duration ?? Duration.zero;

    _player.positionStream.listen((pos) {
      setState(() => _position = pos);
    });

    _player.playerStateStream.listen((state) {
      setState(() => isPlaying = state.playing);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(d.inMinutes)}:${two(d.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(color: Colors.white),
        title: const Text("Audio Guide"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imageUrl,
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            // Progress Bar
            Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds
                  .clamp(0, _duration.inSeconds)
                  .toDouble(),
              onChanged: (value) {
                _player.seek(Duration(seconds: value.toInt()));
              },
              activeColor: Colors.orange,
              inactiveColor: Colors.white24,
            ),

            // Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_format(_position),
                    style: const TextStyle(color: Colors.white70)),
                Text(_format(_duration),
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),

            const SizedBox(height: 20),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  color: Colors.white,
                  iconSize: 32,
                  onPressed: () {
                    _player.seek(
                      _position - const Duration(seconds: 10),
                    );
                  },
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 36,
                    ),
                    onPressed: () {
                      isPlaying ? _player.pause() : _player.play();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  color: Colors.white,
                  iconSize: 32,
                  onPressed: () {
                    _player.seek(
                      _position + const Duration(seconds: 10),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Description
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
