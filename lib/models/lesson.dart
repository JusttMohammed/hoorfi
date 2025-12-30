import 'arabic_letter.dart';

/// Represents a lesson in the learning path
class Lesson {
  final String id;
  final String title; // Arabic title
  final String description; // Arabic description
  final ArabicLetter letter;
  final int order; // Position in the lesson path
  final List<LessonActivity> activities;
  final int totalStars; // Maximum stars that can be earned
  final String iconPath;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.letter,
    required this.order,
    required this.activities,
    this.totalStars = 3,
    required this.iconPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'letter': letter.toJson(),
      'order': order,
      'activities': activities.map((a) => a.toJson()).toList(),
      'totalStars': totalStars,
      'iconPath': iconPath,
    };
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      letter: ArabicLetter.fromJson(json['letter']),
      order: json['order'],
      activities: (json['activities'] as List)
          .map((a) => LessonActivity.fromJson(a))
          .toList(),
      totalStars: json['totalStars'] ?? 3,
      iconPath: json['iconPath'],
    );
  }
}

/// Types of activities in a lesson
enum ActivityType {
  recognition, // Recognize the letter
  pronunciation, // Listen and repeat
  tracing, // Trace the letter
  matching, // Match letter to sound or word
  quiz, // Multiple choice
}

/// Represents an activity within a lesson
class LessonActivity {
  final String id;
  final ActivityType type;
  final String instructions; // Arabic instructions
  final Map<String, dynamic> data; // Activity-specific data

  LessonActivity({
    required this.id,
    required this.type,
    required this.instructions,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'instructions': instructions,
      'data': data,
    };
  }

  factory LessonActivity.fromJson(Map<String, dynamic> json) {
    return LessonActivity(
      id: json['id'],
      type: ActivityType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      instructions: json['instructions'],
      data: json['data'],
    );
  }
}
