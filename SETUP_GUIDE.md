# Setup and Development Guide for Hoorfi

This guide provides detailed instructions for setting up and running the Hoorfi Arabic learning app.

## Table of Contents
1. [Quick Start](#quick-start)
2. [Detailed Setup](#detailed-setup)
3. [Asset Requirements](#asset-requirements)
4. [Development Workflow](#development-workflow)
5. [Troubleshooting](#troubleshooting)

## Quick Start

For developers who want to run the app immediately (with placeholder assets):

```bash
# 1. Install dependencies
flutter pub get

# 2. Run the app (will work without real assets)
flutter run
```

**Note**: The app will run but some features (audio, custom fonts, images) will use placeholders until you add the actual assets.

## Detailed Setup

### 1. Environment Setup

Ensure you have the following installed:

```bash
# Check Flutter version
flutter --version
# Should be 3.9.2 or higher

# Check connected devices
flutter devices
```

### 2. Project Dependencies

All dependencies are already configured in `pubspec.yaml`. Install them:

```bash
flutter pub get
```

Key dependencies:
- `provider`: State management
- `audioplayers`: Audio playback
- `shared_preferences`: Local storage
- `lottie`: Animations
- `confetti`: Celebration effects

### 3. IDE Setup

#### VS Code
Install these extensions:
- Flutter
- Dart
- Flutter Widget Snippets (optional)

#### Android Studio
- Flutter plugin
- Dart plugin

## Asset Requirements

### Fonts (Required for proper Arabic display)

1. **Download Cairo Font**
   - Go to [Google Fonts - Cairo](https://fonts.google.com/specimen/Cairo)
   - Download the font family
   
2. **Add to project**
   ```
   assets/fonts/
   ├── Cairo-Regular.ttf
   ├── Cairo-SemiBold.ttf
   └── Cairo-Bold.ttf
   ```

3. **Verify in pubspec.yaml**
   ```yaml
   fonts:
     - family: Cairo
       fonts:
         - asset: assets/fonts/Cairo-Regular.ttf
         - asset: assets/fonts/Cairo-SemiBold.ttf
           weight: 600
         - asset: assets/fonts/Cairo-Bold.ttf
           weight: 700
   ```

### Audio Files (Required for full functionality)

Create the following audio files:

#### Letter Pronunciations (28 files)
```
assets/audio/letters/
├── alif.mp3      (ا)
├── ba.mp3        (ب)
├── ta.mp3        (ت)
├── tha.mp3       (ث)
├── jeem.mp3      (ج)
├── ha.mp3        (ح)
├── kha.mp3       (خ)
├── dal.mp3       (د)
├── thal.mp3      (ذ)
├── ra.mp3        (ر)
├── zay.mp3       (ز)
├── seen.mp3      (س)
├── sheen.mp3     (ش)
├── sad.mp3       (ص)
├── dad.mp3       (ض)
├── ta2.mp3       (ط)
├── za.mp3        (ظ)
├── ayn.mp3       (ع)
├── ghayn.mp3     (غ)
├── fa.mp3        (ف)
├── qaf.mp3       (ق)
├── kaf.mp3       (ك)
├── lam.mp3       (ل)
├── meem.mp3      (م)
├── noon.mp3      (ن)
├── ha2.mp3       (ه)
├── waw.mp3       (و)
└── ya.mp3        (ي)
```

#### UI Sounds
```
assets/audio/sounds/
├── correct.mp3      (Success sound)
├── incorrect.mp3    (Try again sound)
├── celebration.mp3  (Level complete)
├── button_tap.mp3   (Button press)
└── star_collect.mp3 (Star earned)
```

#### Encouragement Clips (Optional)
```
assets/audio/encouragement/
├── great_job.mp3
├── try_again.mp3
├── excellent.mp3
└── keep_going.mp3
```

**Audio Specifications:**
- Format: MP3
- Quality: 128kbps or higher
- Duration: 1-3 seconds for letters, 0.5-1 second for UI sounds
- Native Arabic speaker with clear pronunciation

### Image Assets (Required for mascot and UI)

#### Mascot Images
```
assets/images/mascot/
├── mascot_happy.png
├── mascot_excited.png
├── mascot_encouraging.png
├── mascot_celebrating.png
└── mascot_neutral.png
```

**Mascot Design Guidelines:**
- Unique character (not copyrighted)
- Child-friendly and non-threatening
- Clear expressions
- PNG with transparency
- Size: 512x512px at 2x resolution

#### Letter Illustrations (Optional but recommended)
```
assets/images/letters/
├── alif.png
├── ba.png
└── ... (one for each letter)
```

#### UI Icons
```
assets/images/icons/
├── star.png
├── coin.png
├── badge.png
├── lock.png
└── unlock.png
```

### Lottie Animations (Optional enhancements)

```
assets/animations/
├── confetti.json
├── star_sparkle.json
├── mascot_jump.json
├── correct_checkmark.json
└── gentle_wrong.json
```

Get free Lottie files from [LottieFiles](https://lottiefiles.com/)

## Development Workflow

### Running the App

```bash
# Run on connected device
flutter run

# Run in debug mode with hot reload
flutter run --debug

# Run in release mode (faster)
flutter run --release

# Run on specific device
flutter run -d chrome  # Web
flutter run -d emulator-5554  # Android
flutter run -d iPhone-14  # iOS Simulator
```

### Hot Reload

While the app is running:
- Press `r` to hot reload (fast, preserves state)
- Press `R` to hot restart (slower, resets state)
- Press `q` to quit

### Debugging

```bash
# Enable debug mode
flutter run --debug

# View logs
flutter logs

# Run with verbose output
flutter run -v
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run with coverage
flutter test --coverage
```

### Building for Production

#### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Google Play)
flutter build appbundle --release
```

#### iOS
```bash
# Build for iOS
flutter build ios --release

# Create IPA
flutter build ipa --release
```

## Code Structure Best Practices

### Adding New Features

1. **New Screen**
   - Create file in `lib/screens/`
   - Follow existing naming convention
   - Implement with Directionality for RTL support

2. **New Widget**
   - Create file in `lib/widgets/`
   - Make it reusable
   - Include proper documentation

3. **New Model**
   - Create file in `lib/models/`
   - Include toJson/fromJson methods
   - Add documentation

### State Management

The app uses Provider pattern:

```dart
// Access provider
context.read<ProgressProvider>()

// Listen to changes
context.watch<ProgressProvider>()

// Consumer widget
Consumer<ProgressProvider>(
  builder: (context, provider, child) {
    return YourWidget();
  },
)
```

### Adding New Arabic Letters

Edit `lib/services/data_service.dart`:

```dart
ArabicLetter(
  id: 'kha',
  name: 'خاء',
  character: 'خ',
  isolatedForm: 'خ',
  initialForm: 'خـ',
  medialForm: 'ـخـ',
  finalForm: 'ـخ',
  englishName: 'Kha',
  order: 7,
  audioPath: 'audio/letters/kha.mp3',
  exampleWords: ['خروف', 'خبز', 'خيار'],
  imagePath: 'assets/images/letters/kha.png',
),
```

## Troubleshooting

### Common Issues

#### 1. Assets not found
**Problem**: "Unable to load asset"

**Solution**:
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

#### 2. RTL not working
**Problem**: Text appears left-to-right

**Solution**: Ensure Directionality widget is used:
```dart
Directionality(
  textDirection: TextDirection.rtl,
  child: YourWidget(),
)
```

#### 3. Audio not playing
**Problem**: No sound when tapping audio buttons

**Solution**:
- Check audio files are in correct location
- Verify file paths in code
- Test on physical device (emulators may have audio issues)
- Check device volume

#### 4. Font not rendering
**Problem**: Arabic text shows boxes or wrong font

**Solution**:
- Verify font files are in `assets/fonts/`
- Check `pubspec.yaml` font configuration
- Run `flutter clean && flutter pub get`
- Restart app

#### 5. Build errors
**Problem**: Compilation errors

**Solution**:
```bash
# Update Flutter
flutter upgrade

# Clean project
flutter clean

# Get dependencies
flutter pub get

# Analyze code
flutter analyze

# Fix formatting
flutter format lib/
```

### Performance Issues

If the app is slow:

1. **Use release mode**:
   ```bash
   flutter run --release
   ```

2. **Profile the app**:
   ```bash
   flutter run --profile
   ```

3. **Check for excessive rebuilds**:
   - Use `const` constructors where possible
   - Optimize Provider usage

### Getting Help

1. Check Flutter documentation: [flutter.dev/docs](https://flutter.dev/docs)
2. Search existing issues
3. Ask on Flutter Discord or Stack Overflow
4. Review code comments in the project

## Next Steps

After setup:

1. ✅ Add all required assets (fonts, audio, images)
2. ✅ Test on physical devices (iOS and Android)
3. ✅ Complete the remaining 23 letter definitions
4. ✅ Record all audio pronunciations
5. ✅ Design and add mascot character
6. ✅ Test with children in target age group
7. ✅ Implement analytics (optional)
8. ✅ Add crash reporting (optional)
9. ✅ Prepare for app store submission

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design for Flutter](https://flutter.dev/docs/development/ui/widgets/material)
- [Arabic Typography Guidelines](https://fonts.google.com/knowledge/glossary/arabic)

---

**Happy Coding! 🚀**

محظوظ البرمجة! 💻
