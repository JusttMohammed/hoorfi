# حروفي (Hoorfi) - Arabic Letters Learning App

<div dir="rtl">

## نظرة عامة

**حروفي** هو تطبيق تعليمي تفاعلي مصمم لتعليم الأطفال الذين تتراوح أعمارهم بين 4-7 سنوات الحروف العربية من ألف إلى ياء. التطبيق مستوحى من منهج التعلم المُلَعَّب الخاص بـ Duolingo، مع تصميم فريد وودود للأطفال.

</div>

## Features / الميزات

### Core Features
- ✅ **Gamified Learning Path**: Progressive lessons for all 28 Arabic letters
- ✅ **Interactive Lessons**: Recognition, pronunciation, and tracing activities
- ✅ **Child-Friendly Design**: Large buttons, colorful UI, and engaging animations
- ✅ **Mascot Character**: Expressive mascot with encouraging messages
- ✅ **RTL Support**: Full Right-to-Left language support
- ✅ **Audio-First Learning**: Pronunciation support for all letters
- ✅ **Progress Tracking**: Stars, coins, badges, and daily goals
- ✅ **Reward System**: Celebration animations and achievements
- ✅ **Streak System**: Daily learning streaks to encourage consistency
- ✅ **Local Storage**: Progress persists between sessions

### Screen Overview

1. **Home Screen (الشاشة الرئيسية)**
   - Welcome message with mascot
   - Daily goal progress
   - Stats display (stars, streak, completed lessons)
   - Start/Continue learning button

2. **Lesson Path Screen (مسار الدروس)**
   - Map-like progression of all 28 letters
   - Locked/unlocked lesson indicators
   - Visual path connecting lessons
   - Mascot guidance

3. **Letter Lesson Screen (شاشة الدرس)**
   - Recognition activities
   - Pronunciation with audio
   - Interactive exercises
   - Progress indicator

4. **Tracing Activity Screen (شاشة التتبع)**
   - Gesture-based letter tracing
   - Visual guide for letter formation
   - Real-time feedback
   - Encouragement from mascot

5. **Reward Screen (شاشة المكافأة)**
   - Celebration animations with confetti
   - Stars and coins earned
   - Badge achievements
   - Progress summary

## Project Structure

```
lib/
├── main.dart                 # App entry point with providers
├── models/                   # Data models
│   ├── arabic_letter.dart    # Letter model with all forms
│   ├── lesson.dart           # Lesson and activity models
│   └── user_progress.dart    # Progress tracking models
├── providers/                # State management
│   ├── progress_provider.dart # Progress state
│   └── audio_provider.dart    # Audio state
├── screens/                  # App screens
│   ├── home_screen.dart
│   ├── lesson_path_screen.dart
│   ├── letter_lesson_screen.dart
│   ├── tracing_activity_screen.dart
│   └── reward_screen.dart
├── services/                 # Business logic
│   ├── audio_service.dart    # Audio playback
│   ├── progress_service.dart # Progress persistence
│   └── data_service.dart     # Data management
├── widgets/                  # Reusable components
│   ├── child_button.dart     # Large, animated buttons
│   ├── mascot_widget.dart    # Animated mascot
│   ├── star_rating.dart      # Star display
│   ├── lesson_card.dart      # Lesson card component
│   └── progress_widgets.dart # Progress indicators
└── utils/
    └── constants.dart        # Colors, text styles, sizes

assets/
├── images/                   # Images and illustrations
│   ├── mascot/              # Mascot expressions
│   ├── letters/             # Letter illustrations
│   └── icons/               # UI icons
├── audio/                    # Audio files
│   ├── letters/             # Letter pronunciations
│   ├── sounds/              # UI feedback sounds
│   └── encouragement/       # Mascot voice
├── animations/              # Lottie animations
└── fonts/                   # Arabic fonts (Cairo)
```

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK (3.9.2 or higher)
- An IDE (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd hoorfi
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add Arabic Fonts**
   - Download Cairo font family from [Google Fonts](https://fonts.google.com/specimen/Cairo)
   - Place font files in `assets/fonts/`:
     - Cairo-Regular.ttf
     - Cairo-SemiBold.ttf
     - Cairo-Bold.ttf

4. **Add Audio Assets** (See `assets/audio/README.md`)
   - Letter pronunciations (28 files)
   - UI feedback sounds
   - Encouragement audio clips

5. **Add Image Assets** (See `assets/images/README.md`)
   - Mascot character expressions
   - Letter illustrations
   - UI icons

### Running the App

```bash
# Development mode
flutter run

# Release mode
flutter run --release

# Run on specific device
flutter run -d <device-id>
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/widget_test.dart
```

## Design Philosophy

### Child-Friendly UX
- **Large Touch Targets**: Minimum 44x44 points for easy tapping
- **Clear Visual Hierarchy**: Important elements stand out
- **Immediate Feedback**: Visual and audio responses to all interactions
- **Gentle Error Handling**: Encouraging messages, never harsh corrections
- **Progress Visibility**: Children can see their achievements

### Color Palette
- Primary: Purple (#6B4CE6) - Friendly and engaging
- Secondary: Pink (#FF6B9D) - Warm and inviting
- Accent: Gold (#FFC107) - For rewards and achievements
- Success: Green (#00B894) - For correct answers
- Warning: Yellow (#FDCB6E) - For gentle corrections

### Typography
- **Font**: Cairo - Excellent Arabic support
- **Large Sizes**: Easy to read for young learners
- **Clear Diacritics**: Proper rendering of Arabic markings

## Key Dependencies

```yaml
provider: ^6.1.1              # State management
audioplayers: ^6.5.1          # Audio playback
shared_preferences: ^2.5.4    # Local storage
flutter_svg: ^2.2.3           # SVG support
lottie: ^3.3.2                # Animations
confetti: ^0.7.0              # Celebration effects
```

## Architecture

### State Management
- **Provider Pattern**: Simple and efficient state management
- **ProgressProvider**: Manages user progress, lessons, and achievements
- **AudioProvider**: Handles audio playback and settings

### Data Flow
1. User interacts with UI
2. UI calls Provider methods
3. Provider updates state and calls Services
4. Services handle business logic and persistence
5. UI rebuilds with new state

### Persistence
- **SharedPreferences**: Stores user progress locally
- **JSON Serialization**: Easy data conversion
- **Automatic Saving**: Progress saved after each lesson

## Customization

### Adding New Letters
Edit `lib/services/data_service.dart`:
```dart
ArabicLetter(
  id: 'letter_id',
  name: 'اسم الحرف',
  character: 'ح',
  // ... other properties
)
```

### Changing Colors
Edit `lib/utils/constants.dart`:
```dart
class AppColors {
  static const Color primary = Color(0xFF6B4CE6);
  // ... other colors
}
```

### Adding Badges
Edit `lib/providers/progress_provider.dart`:
```dart
void _checkBadgeAchievements() {
  // Add new badge conditions
}
```

## TODO / Next Steps

### Required Assets
- [ ] Download and add Cairo font files
- [ ] Record or source Arabic letter pronunciations (28 files)
- [ ] Create or source mascot character images
- [ ] Add UI feedback sounds
- [ ] Create letter illustrations

### Enhancements
- [ ] Add mini-games for each letter
- [ ] Implement parent dashboard
- [ ] Add letter matching games
- [ ] Create word formation lessons
- [ ] Add voice recording for pronunciation practice
- [ ] Implement offline mode
- [ ] Add sharing achievements feature
- [ ] Create lesson difficulty levels

### Production Readiness
- [ ] Add proper error logging (replace print statements)
- [ ] Implement analytics
- [ ] Add crash reporting
- [ ] Create onboarding flow
- [ ] Add privacy policy and terms
- [ ] Optimize performance
- [ ] Add accessibility features
- [ ] Internationalization (if needed for interface)

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

[Add your license here]

## Credits

- **Design Inspiration**: Duolingo's gamified learning approach
- **Arabic Font**: Cairo by Mohamed Gaber
- **Icon Library**: Material Icons

## Contact

[Add contact information]

---

<div dir="rtl">

## ملاحظات مهمة

### للمطورين
- تأكد من إضافة جميع الأصول المطلوبة قبل التشغيل
- استخدم خطوط عربية واضحة للأطفال
- اختبر على أجهزة حقيقية للتأكد من الأداء
- راعِ حجم ملفات الصوت لتحسين الأداء

### للمصممين
- حافظ على التصميم البسيط والودود
- استخدم ألوان مبهجة وغير مزعجة
- تأكد من وضوح الحروف العربية
- اجعل التعبيرات الحركية ناعمة ومشجعة

</div>

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
