import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_progress.dart';

/// Service for managing user progress storage
class ProgressService {
  static const String _progressKey = 'user_progress';
  static const String _userId = 'default_user';

  /// Save user progress to local storage
  Future<void> saveProgress(UserProgress progress) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = json.encode(progress.toJson());
      await prefs.setString(_progressKey, jsonString);
    } catch (e) {
      print('Error saving progress: $e');
    }
  }

  /// Load user progress from local storage
  Future<UserProgress> loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_progressKey);
      
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString);
        return UserProgress.fromJson(jsonMap);
      }
    } catch (e) {
      print('Error loading progress: $e');
    }
    
    // Return new progress if nothing saved or error
    return UserProgress(userId: _userId);
  }

  /// Clear all progress (for testing or reset)
  Future<void> clearProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_progressKey);
    } catch (e) {
      print('Error clearing progress: $e');
    }
  }

  /// Update last activity date and streak
  Future<void> updateActivity(UserProgress progress) async {
    progress.updateStreak();
    await saveProgress(progress);
  }

  /// Check if daily goal is met
  bool isDailyGoalMet(UserProgress progress) {
    return progress.todayStars >= progress.dailyGoal;
  }

  /// Reset daily stars (call this at midnight)
  Future<void> resetDailyStars(UserProgress progress) async {
    progress.todayStars = 0;
    await saveProgress(progress);
  }
}
