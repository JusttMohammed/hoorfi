import '../models/arabic_letter.dart';
import '../models/lesson.dart';
import 'arabic_letters_data.dart';

/// Service for managing lesson and letter data
class DataService {
  /// Get all Arabic letters (28 letters)
  static List<ArabicLetter> getAllLetters() {
    return ArabicLettersData.getAllLetters();
  }

  /// Generate lessons for all letters
  static List<Lesson> generateLessons() {
    final letters = getAllLetters();
    return letters.map((letter) {
      return Lesson(
        id: 'lesson_${letter.order}',
        title: 'تعلم حرف ${letter.name}',
        description: 'دعنا نتعلم حرف ${letter.character} معاً!',
        letter: letter,
        order: letter.order,
        activities: [
          LessonActivity(
            id: 'recognition_${letter.id}',
            type: ActivityType.recognition,
            instructions: 'اضغط على حرف ${letter.character}',
            data: {
              'correctLetter': letter.character,
              'options': _generateLetterOptions(letter.character),
            },
          ),
          LessonActivity(
            id: 'pronunciation_${letter.id}',
            type: ActivityType.pronunciation,
            instructions: 'استمع وكرر',
            data: {
              'audioPath': letter.audioPath,
              'letter': letter.character,
            },
          ),
          LessonActivity(
            id: 'tracing_${letter.id}',
            type: ActivityType.tracing,
            instructions: 'تتبع الحرف بإصبعك',
            data: {
              'letter': letter.character,
              'tracePath': 'paths/${letter.id}_trace.json',
            },
          ),
        ],
        iconPath: letter.imagePath,
      );
    }).toList();
  }

  /// Generate options for letter recognition activity
  static List<String> _generateLetterOptions(String correctLetter) {
    final allLetters = ['ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ', 'د'];
    final options = <String>[correctLetter];
    
    // Add 3 random wrong options
    final wrongOptions = allLetters.where((l) => l != correctLetter).toList();
    wrongOptions.shuffle();
    options.addAll(wrongOptions.take(3));
    
    // Shuffle all options
    options.shuffle();
    
    return options;
  }

  /// Get lesson by ID
  static Lesson? getLessonById(String lessonId) {
    final lessons = generateLessons();
    try {
      return lessons.firstWhere((lesson) => lesson.id == lessonId);
    } catch (e) {
      return null;
    }
  }

  /// Get letter by ID
  static ArabicLetter? getLetterById(String letterId) {
    final letters = getAllLetters();
    try {
      return letters.firstWhere((letter) => letter.id == letterId);
    } catch (e) {
      return null;
    }
  }

  /// Get next lesson
  static Lesson? getNextLesson(int currentOrder) {
    final lessons = generateLessons();
    try {
      return lessons.firstWhere((lesson) => lesson.order == currentOrder + 1);
    } catch (e) {
      return null;
    }
  }
}
