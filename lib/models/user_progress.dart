/// Represents user's progress in the app
class UserProgress {
  final String userId;
  int totalStars;
  int totalCoins;
  List<String> completedLessons;
  List<String> unlockedLessons;
  Map<String, LessonProgress> lessonProgress;
  List<Badge> earnedBadges;
  int currentStreak;
  int longestStreak;
  DateTime? lastActivityDate;
  int dailyGoal; // Stars to earn per day
  int todayStars; // Stars earned today

  UserProgress({
    required this.userId,
    this.totalStars = 0,
    this.totalCoins = 0,
    List<String>? completedLessons,
    List<String>? unlockedLessons,
    Map<String, LessonProgress>? lessonProgress,
    List<Badge>? earnedBadges,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastActivityDate,
    this.dailyGoal = 10,
    this.todayStars = 0,
  })  : completedLessons = completedLessons ?? [],
        unlockedLessons = unlockedLessons ?? ['lesson_1'], // First lesson unlocked
        lessonProgress = lessonProgress ?? {},
        earnedBadges = earnedBadges ?? [];

  void addStars(int stars) {
    totalStars += stars;
    todayStars += stars;
    totalCoins += stars * 10; // 10 coins per star
  }

  void completeLesson(String lessonId, int starsEarned) {
    if (!completedLessons.contains(lessonId)) {
      completedLessons.add(lessonId);
    }
    addStars(starsEarned);
    updateStreak();
  }

  void unlockLesson(String lessonId) {
    if (!unlockedLessons.contains(lessonId)) {
      unlockedLessons.add(lessonId);
    }
  }

  void updateStreak() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    if (lastActivityDate == null) {
      currentStreak = 1;
      lastActivityDate = today;
    } else {
      final lastDate = DateTime(
        lastActivityDate!.year,
        lastActivityDate!.month,
        lastActivityDate!.day,
      );
      
      final difference = today.difference(lastDate).inDays;
      
      if (difference == 0) {
        // Same day, no change
      } else if (difference == 1) {
        // Consecutive day
        currentStreak++;
        lastActivityDate = today;
      } else {
        // Streak broken
        currentStreak = 1;
        lastActivityDate = today;
      }
      
      if (currentStreak > longestStreak) {
        longestStreak = currentStreak;
      }
    }
  }

  void addBadge(Badge badge) {
    if (!earnedBadges.any((b) => b.id == badge.id)) {
      earnedBadges.add(badge);
    }
  }

  bool isLessonUnlocked(String lessonId) {
    return unlockedLessons.contains(lessonId);
  }

  bool isLessonCompleted(String lessonId) {
    return completedLessons.contains(lessonId);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'totalStars': totalStars,
      'totalCoins': totalCoins,
      'completedLessons': completedLessons,
      'unlockedLessons': unlockedLessons,
      'lessonProgress': lessonProgress.map((k, v) => MapEntry(k, v.toJson())),
      'earnedBadges': earnedBadges.map((b) => b.toJson()).toList(),
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastActivityDate': lastActivityDate?.toIso8601String(),
      'dailyGoal': dailyGoal,
      'todayStars': todayStars,
    };
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      userId: json['userId'],
      totalStars: json['totalStars'] ?? 0,
      totalCoins: json['totalCoins'] ?? 0,
      completedLessons: List<String>.from(json['completedLessons'] ?? []),
      unlockedLessons: List<String>.from(json['unlockedLessons'] ?? ['lesson_1']),
      lessonProgress: (json['lessonProgress'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, LessonProgress.fromJson(v)),
          ) ??
          {},
      earnedBadges: (json['earnedBadges'] as List?)
              ?.map((b) => Badge.fromJson(b))
              .toList() ??
          [],
      currentStreak: json['currentStreak'] ?? 0,
      longestStreak: json['longestStreak'] ?? 0,
      lastActivityDate: json['lastActivityDate'] != null
          ? DateTime.parse(json['lastActivityDate'])
          : null,
      dailyGoal: json['dailyGoal'] ?? 10,
      todayStars: json['todayStars'] ?? 0,
    );
  }
}

/// Progress for a specific lesson
class LessonProgress {
  final String lessonId;
  int starsEarned;
  int attempts;
  bool completed;
  DateTime? completedDate;
  Map<String, bool> activitiesCompleted;

  LessonProgress({
    required this.lessonId,
    this.starsEarned = 0,
    this.attempts = 0,
    this.completed = false,
    this.completedDate,
    Map<String, bool>? activitiesCompleted,
  }) : activitiesCompleted = activitiesCompleted ?? {};

  Map<String, dynamic> toJson() {
    return {
      'lessonId': lessonId,
      'starsEarned': starsEarned,
      'attempts': attempts,
      'completed': completed,
      'completedDate': completedDate?.toIso8601String(),
      'activitiesCompleted': activitiesCompleted,
    };
  }

  factory LessonProgress.fromJson(Map<String, dynamic> json) {
    return LessonProgress(
      lessonId: json['lessonId'],
      starsEarned: json['starsEarned'] ?? 0,
      attempts: json['attempts'] ?? 0,
      completed: json['completed'] ?? false,
      completedDate: json['completedDate'] != null
          ? DateTime.parse(json['completedDate'])
          : null,
      activitiesCompleted:
          Map<String, bool>.from(json['activitiesCompleted'] ?? {}),
    );
  }
}

/// Represents a badge/achievement
class Badge {
  final String id;
  final String name; // Arabic name
  final String description; // Arabic description
  final String iconPath;
  final BadgeType type;
  final DateTime? earnedDate;

  Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.iconPath,
    required this.type,
    this.earnedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconPath': iconPath,
      'type': type.toString(),
      'earnedDate': earnedDate?.toIso8601String(),
    };
  }

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      iconPath: json['iconPath'],
      type: BadgeType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      earnedDate: json['earnedDate'] != null
          ? DateTime.parse(json['earnedDate'])
          : null,
    );
  }
}

enum BadgeType {
  firstLesson,
  threeStreak,
  sevenStreak,
  tenLessons,
  perfectScore,
  hundredStars,
  allLetters,
}
