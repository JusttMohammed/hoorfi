import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hoorfi/screens/lesson_path_screen.dart';
import 'package:hoorfi/screens/letter_lesson_screen.dart';
import 'package:hoorfi/screens/reward_screen.dart';
import 'package:hoorfi/screens/signup_screen.dart';
import 'package:hoorfi/screens/tracing_activity_screen.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/Settings.dart';


void main() {
  runApp(const ArabicLearningApp());
}

class ArabicLearningApp extends StatelessWidget {
  const ArabicLearningApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alef Ba - Arabic Learning',
      theme: ThemeData. dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF112117),
        primaryColor: const Color(0xFF36e27b),
        colorScheme: const ColorScheme. dark(
          primary: Color(0xFF36e27b),
          secondary: Color(0xFF4aa9ff),
          surface: Color(0xFF1c2e24),
        ),
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme. apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
      ),
      // Add a light theme for the sign-up screen
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':  (context) => const HomePage(),
        '/learning-path': (context) => const LearningPathScreen(),
        '/lesson': (context) => const LessonScreen(),
        '/reward': (context) => const RewardScreen(),
        '/tracing': (context) => const TracingScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
