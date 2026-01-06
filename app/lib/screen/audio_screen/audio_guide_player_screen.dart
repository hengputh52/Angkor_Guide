import 'package:app/model/audio_guide.dart';
import 'package:app/model/language.dart';
import 'package:app/model/point_of_interest.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioGuidePlayerScreen extends StatefulWidget {
  final List<PointOfInterest> points;
  final Language lanuage;
  final int startIndex;

  const AudioGuidePlayerScreen({
    super.key,
    required this.points,
    required this.lanuage,
    required this.startIndex,
  });

  @override
  State<AudioGuidePlayerScreen> createState() =>
      _AudioGuidePlayerScreenState();
}

class _AudioGuidePlayerScreenState extends State<AudioGuidePlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  late int currentIndex;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.startIndex;
    _initAudio();
  }

  AudioGuide get currentGuide {
    final poi = widget.points[currentIndex];
    return poi.guides[widget.lanuage] ?? poi.guides[Language.en]!;
  }

  Future<void> _initAudio() async {
    await _player.setAsset(currentGuide.audioPath);

    _duration = _player.duration ?? Duration.zero;

    _player.positionStream.listen((pos) {
      setState(() => _position = pos);
    });

    _player.playerStateStream.listen((state) {
      setState(() => isPlaying = state.playing);
    });
  }

  void _next() {
    if (currentIndex < widget.points.length - 1) {
      setState(() {
        currentIndex++;
        _initAudio();
        _player.play();
      });
    }
  }

  void _previous() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _initAudio();
        _player.play();
      });
    }
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
    final poi = widget.points[currentIndex];
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        title: Text(
          "Now Playing",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Album Art or POI Image
              Container(
                width: 330,
                height: 320,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black26 : Colors.black12,
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    poi.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.music_note, size: 80, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Title and Subtitle
              Text(
                currentGuide.title,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                poi.type.name.toUpperCase(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              // Slider
              Slider(
                min: 0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
                onChanged: (v) => _player.seek(Duration(seconds: v.toInt())),
                activeColor: Colors.green,
                inactiveColor: isDark ? Colors.grey[700] : Colors.grey[300],
              ),
              // Time Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _format(_position),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    _format(_duration),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, size: 36),
                    color: isDark ? Colors.white : Colors.black,
                    onPressed: _previous,
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 36,
                      ),
                      onPressed: () {
                        isPlaying ? _player.pause() : _player.play();
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.skip_next, size: 36),
                    color: isDark ? Colors.white : Colors.black,
                    onPressed: _next,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Description/lyrics area
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    currentGuide.title,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 16,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}