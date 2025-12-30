import 'package:flutter/material.dart';

/// App-wide color constants with child-friendly palette
class AppColors {
  // Primary colors - warm and inviting
  static const Color primary = Color(0xFF6B4CE6); // Purple
  static const Color primaryLight = Color(0xFF9B7EF0);
  static const Color primaryDark = Color(0xFF4A2DB3);
  
  // Secondary colors
  static const Color secondary = Color(0xFFFF6B9D); // Pink
  static const Color secondaryLight = Color(0xFFFF9DBB);
  static const Color secondaryDark = Color(0xFFE6457A);
  
  // Accent colors
  static const Color accent = Color(0xFFFFC107); // Golden/Yellow
  static const Color accentOrange = Color(0xFFFF9800);
  static const Color accentGreen = Color(0xFF4CAF50);
  static const Color accentBlue = Color(0xFF2196F3);
  
  // Background colors
  static const Color background = Color(0xFFF8F9FF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF5F6FA);
  
  // Text colors
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Color(0xFF95A5A6);
  
  // Status colors
  static const Color success = Color(0xFF00B894);
  static const Color error = Color(0xFFFF7675);
  static const Color warning = Color(0xFFFDCB6E);
  static const Color info = Color(0xFF74B9FF);
  
  // Star colors
  static const Color starGold = Color(0xFFFFD700);
  static const Color starSilver = Color(0xFFC0C0C0);
  
  // Lock/Unlock
  static const Color locked = Color(0xFFBDC3C7);
  static const Color unlocked = Color(0xFF00B894);
  
  // Shadow
  static const Color shadow = Color(0x1A000000);
}

/// Typography constants
class AppTextStyles {
  // Extra large - for main headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.4,
  );
  
  // Large - for section titles
  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.3,
  );
  
  // Medium - for card titles
  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Cairo',
    height: 1.3,
  );
  
  // Large letters for learning
  static const TextStyle letterDisplay = TextStyle(
    fontSize: 120,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.0,
  );
  
  // Medium letters
  static const TextStyle letterMedium = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.0,
  );
  
  // Small letters
  static const TextStyle letterSmall = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.0,
  );
  
  // Body text
  static const TextStyle body = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: 'Cairo',
    height: 1.5,
  );
  
  // Instructions text
  static const TextStyle instructions = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Cairo',
    height: 1.4,
  );
  
  // Button text
  static const TextStyle button = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    height: 1.2,
  );
  
  // Small text
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Cairo',
    height: 1.3,
  );
}

/// Spacing and sizing constants
class AppSizes {
  // Padding
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;
  
  // Border radius
  static const double radiusS = 8.0;
  static const double radiusM = 16.0;
  static const double radiusL = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusFull = 9999.0;
  
  // Button sizes
  static const double buttonHeight = 60.0;
  static const double buttonHeightSmall = 48.0;
  static const double buttonHeightLarge = 72.0;
  
  // Icon sizes
  static const double iconS = 24.0;
  static const double iconM = 32.0;
  static const double iconL = 48.0;
  static const double iconXL = 64.0;
  
  // Card sizes
  static const double lessonCardWidth = 140.0;
  static const double lessonCardHeight = 160.0;
  
  // Mascot sizes
  static const double mascotSmall = 80.0;
  static const double mascotMedium = 120.0;
  static const double mascotLarge = 200.0;
  
  // Touch target minimum size
  static const double minTouchTarget = 44.0;
}

/// Animation duration constants
class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration celebration = Duration(milliseconds: 1500);
}

/// Arabic text constants
class AppStrings {
  // Home Screen
  static const String appName = 'حروفي';
  static const String welcomeMessage = 'مرحباً بك!';
  static const String startLearning = 'ابدأ التعلم';
  static const String continueButton = 'تابع';
  
  // Lesson Path
  static const String lessonPath = 'مسار التعلم';
  static const String locked = 'مقفل';
  static const String completed = 'مكتمل';
  static const String start = 'ابدأ';
  
  // Activities
  static const String listen = 'استمع';
  static const String repeat = 'كرر';
  static const String trace = 'تتبع';
  static const String tap = 'اضغط';
  static const String next = 'التالي';
  static const String tryAgain = 'حاول مرة أخرى';
  
  // Feedback
  static const String excellent = 'ممتاز!';
  static const String greatJob = 'عمل رائع!';
  static const String keepGoing = 'استمر!';
  static const String almostThere = 'قريب جداً!';
  static const String tryAgainMessage = 'لا بأس، حاول مرة أخرى';
  
  // Rewards
  static const String starsEarned = 'نجوم مكتسبة';
  static const String coinsEarned = 'عملات مكتسبة';
  static const String newBadge = 'شارة جديدة!';
  static const String celebration = 'مبروك!';
  
  // Progress
  static const String streak = 'سلسلة';
  static const String days = 'أيام';
  static const String dailyGoal = 'الهدف اليومي';
  static const String totalStars = 'مجموع النجوم';
}
