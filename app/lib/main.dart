import 'package:app/screen/start_screen.dart';
import 'package:app/services/language_provide.dart';
import 'package:app/services/favorite_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize LanguageProvider
  final languageProvider = LanguageProvider();
  await languageProvider.load();

  // Initialize FavoriteService
  final favoriteService = FavoriteService();
  await favoriteService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: languageProvider),
        ChangeNotifierProvider.value(value: favoriteService),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Angkor Tour',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.light,
            background: Colors.white,
            surface: Colors.white,
          ),
        ),
        home: const StartScreen(),
      ),
    );
  }
}


