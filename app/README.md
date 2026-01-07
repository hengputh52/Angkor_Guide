# Angkor Guide App

Angkor Guide is a cross-platform Flutter application designed to provide an interactive tour guide experience for visitors to Angkor. The app offers audio guides, maps, favorite spots, multilingual support, and user customization features.

## Features

- **Audio Guides**: Listen to detailed audio guides for points of interest in multiple languages.
- **Interactive Map**: Explore Angkor with an integrated map showing temples and attractions.
- **Favorites**: Mark and manage your favorite locations for quick access.
- **User Profiles**: Save user preferences and history.
- **Multilingual Support**: Switch between languages (e.g., English, Khmer) for all content.
- **Settings**: Customize app theme and language.

## Project Structure

```
lib/
	main.dart                # App entry point, provider setup
	model/                   # Data models (audio guide, user, temple, etc.)
	screen/                  # UI screens (home, signup, audio, map, settings, etc.)
	services/                # Business logic and data services (favorites, language, JSON loading, etc.)
	widget/                  # Reusable UI components
assets/
	audios/                  # Audio files for guides
	data/                    # JSON data (points of interest, temples, users)
	images/                  # Images and logos
	videos/                  # Video resources
test/
	widget_test.dart         # Widget and unit tests
```

## How It Works

1. **Providers**: The app uses the Provider package for state management (language, favorites, theme, etc.).
2. **Data Loading**: JSON files in `assets/data/` are loaded for points of interest, temples, and users.
3. **Audio**: Audio guides are organized by language and location in `assets/audios/`.
4. **Screens**: Users navigate between home, map, audio, favorites, and settings screens.
5. **Customization**: Users can change language and theme from the settings screen.

## Getting Started

1. **Install Flutter**: [Flutter installation guide](https://docs.flutter.dev/get-started/install)
2. **Clone the repository**:
	 ```sh
	 git clone <repo-url>
	 cd Angkor_Guide/app
	 ```
3. **Install dependencies**:
	 ```sh
	 flutter pub get
	 ```
4. **Run the app**:
	 ```sh
	 flutter run
	 ```

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements and bug fixes.

## License

This project is licensed under the MIT License.

---
For more information, see the [Flutter documentation](https://docs.flutter.dev/).
