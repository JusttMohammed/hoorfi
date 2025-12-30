import 'package:flutter/foundation.dart';
import '../models/user_progress.dart';
import '../models/lesson.dart';
import '../services/progress_service.dart';
import '../services/data_service.dart';

/// Provider for managing user progress and lesson state
class ProgressProvider with ChangeNotifier {
  final ProgressService _progressService = ProgressService();
  
  UserProgress? _userProgress;
  List<Lesson> _lessons = [];
  bool _isLoading = true;

  UserProgress? get userProgress => _userProgress;
  List<Lesson> get lessons => _lessons;
  bool get isLoading => _isLoading;

  ProgressProvider() {
    _initialize();
  }

  /// Initialize provider by loading data
  Future<void> _initialize() async {
    _isLoading = true;
    notifyListeners();

    _userProgress = await _progressService.loadProgress();
    _lessons = DataService.generateLessons();

    _isLoading = false;
    notifyListeners();
  }

  /// Complete a lesson
  Future<void> completeLesson(String lessonId, int starsEarned) async {
    if (_userProgress == null) return;

    _userProgress!.completeLesson(lessonId, starsEarned);
    
    // Unlock next lesson
    final lesson = DataService.getLessonById(lessonId);
    if (lesson != null) {
      final nextLesson = DataService.getNextLesson(lesson.order);
      if (nextLesson != null) {
        _userProgress!.unlockLesson(nextLesson.id);
      }
    }

    // Check for badge achievements
    _checkBadgeAchievements();

    await _progressService.saveProgress(_userProgress!);
    notifyListeners();
  }

  /// Update lesson progress
  Future<void> updateLessonProgress(
    String lessonId,
    String activityId,
    bool completed,
  ) async {
    if (_userProgress == null) return;

    final lessonProgress = _userProgress!.lessonProgress[lessonId] ??
        LessonProgress(lessonId: lessonId);
    
    lessonProgress.activitiesCompleted[activityId] = completed;
    lessonProgress.attempts++;

    _userProgress!.lessonProgress[lessonId] = lessonProgress;

    await _progressService.saveProgress(_userProgress!);
    notifyListeners();
  }

  /// Add stars to user progress
  Future<void> addStars(int stars) async {
    if (_userProgress == null) return;

    _userProgress!.addStars(stars);
    await _progressService.updateActivity(_userProgress!);
    notifyListeners();
  }

  /// Check if lesson is unlocked
  bool isLessonUnlocked(String lessonId) {
    if (_userProgress == null) return false;
    return _userProgress!.isLessonUnlocked(lessonId);
  }

  /// Check if lesson is completed
  bool isLessonCompleted(String lessonId) {
    if (_userProgress == null) return false;
    return _userProgress!.isLessonCompleted(lessonId);
  }

  /// Get stars earned for a lesson
  int getStarsForLesson(String lessonId) {
    if (_userProgress == null) return 0;
    return _userProgress!.lessonProgress[lessonId]?.starsEarned ?? 0;
  }

  /// Check and award badges
  void _checkBadgeAchievements() {
    if (_userProgress == null) return;

    // First lesson badge
    if (_userProgress!.completedLessons.length == 1) {
      _userProgress!.addBadge(
        Badge(
          id: 'first_lesson',
          name: 'الدرس الأول',
          description: 'أكملت أول درس!',
          iconPath: 'assets/images/badges/first_lesson.png',
          type: BadgeType.firstLesson,
          earnedDate: DateTime.now(),
        ),
      );
    }

    // 3-day streak
    if (_userProgress!.currentStreak == 3) {
      _userProgress!.addBadge(
        Badge(
          id: 'three_streak',
          name: 'ثلاثة أيام',
          description: 'تعلمت لمدة ثلاثة أيام متتالية!',
          iconPath: 'assets/images/badges/three_streak.png',
          type: BadgeType.threeStreak,
          earnedDate: DateTime.now(),
        ),
      );
    }

    // 100 stars
    if (_userProgress!.totalStars >= 100) {
      _userProgress!.addBadge(
        Badge(
          id: 'hundred_stars',
          name: 'مائة نجمة',
          description: 'جمعت 100 نجمة!',
          iconPath: 'assets/images/badges/hundred_stars.png',
          type: BadgeType.hundredStars,
          earnedDate: DateTime.now(),
        ),
      );
    }

    // All letters completed
    if (_userProgress!.completedLessons.length >= 28) {
      _userProgress!.addBadge(
        Badge(
          id: 'all_letters',
          name: 'جميع الحروف',
          description: 'أكملت جميع الحروف العربية!',
          iconPath: 'assets/images/badges/all_letters.png',
          type: BadgeType.allLetters,
          earnedDate: DateTime.now(),
        ),
      );
    }
  }

  /// Reset progress (for testing)
  Future<void> resetProgress() async {
    await _progressService.clearProgress();
    await _initialize();
  }
}
