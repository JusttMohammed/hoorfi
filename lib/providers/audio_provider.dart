import 'package:flutter/foundation.dart';
import '../services/audio_service.dart';

/// Provider for managing audio settings and playback
class AudioProvider with ChangeNotifier {
  final AudioService _audioService = AudioService();

  bool get isMuted => _audioService.isMuted;

  /// Play letter audio
  Future<void> playLetter(String audioPath) async {
    await _audioService.playLetterAudio(audioPath);
  }

  /// Play word audio
  Future<void> playWord(String audioPath) async {
    await _audioService.playWordAudio(audioPath);
  }

  /// Play feedback sound
  Future<void> playFeedback(FeedbackSound sound) async {
    await _audioService.playFeedback(sound);
  }

  /// Play encouragement
  Future<void> playEncouragement(String audioPath) async {
    await _audioService.playEncouragement(audioPath);
  }

  /// Stop all audio
  Future<void> stopAll() async {
    await _audioService.stopAll();
  }

  /// Toggle mute
  void toggleMute() {
    _audioService.toggleMute();
    notifyListeners();
  }

  /// Set volume
  Future<void> setVolume(double volume) async {
    await _audioService.setVolume(volume);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }
}
