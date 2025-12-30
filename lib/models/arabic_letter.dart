/// Model representing an Arabic letter
class ArabicLetter {
  final String id;
  final String name; // Arabic name (e.g., "ألف", "باء")
  final String character; // The letter itself (e.g., "ا", "ب")
  final String isolatedForm; // Isolated form
  final String initialForm; // Initial form
  final String medialForm; // Medial form
  final String finalForm; // Final form
  final String englishName; // Transliteration (e.g., "Alif", "Ba")
  final int order; // Position in alphabet (1-28)
  final String audioPath; // Path to pronunciation audio
  final List<String> exampleWords; // Example words starting with this letter
  final String imagePath; // Path to letter illustration

  ArabicLetter({
    required this.id,
    required this.name,
    required this.character,
    required this.isolatedForm,
    required this.initialForm,
    required this.medialForm,
    required this.finalForm,
    required this.englishName,
    required this.order,
    required this.audioPath,
    required this.exampleWords,
    required this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'character': character,
      'isolatedForm': isolatedForm,
      'initialForm': initialForm,
      'medialForm': medialForm,
      'finalForm': finalForm,
      'englishName': englishName,
      'order': order,
      'audioPath': audioPath,
      'exampleWords': exampleWords,
      'imagePath': imagePath,
    };
  }

  factory ArabicLetter.fromJson(Map<String, dynamic> json) {
    return ArabicLetter(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      isolatedForm: json['isolatedForm'],
      initialForm: json['initialForm'],
      medialForm: json['medialForm'],
      finalForm: json['finalForm'],
      englishName: json['englishName'],
      order: json['order'],
      audioPath: json['audioPath'],
      exampleWords: List<String>.from(json['exampleWords']),
      imagePath: json['imagePath'],
    );
  }
}
