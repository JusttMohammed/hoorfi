import 'package:audioplayers/audioplayers.dart';

/// Service for managing audio playback
class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _feedbackPlayer = AudioPlayer();
  
  bool _isMuted = false;
  
  bool get isMuted => _isMuted;

  /// Play letter pronunciation audio
  Future<void> playLetterAudio(String audioPath) async {
    if (_isMuted) return;
    
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      print('Error playing letter audio: $e');
    }
  }

  /// Play word pronunciation audio
  Future<void> playWordAudio(String audioPath) async {
    if (_isMuted) return;
    
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      print('Error playing word audio: $e');
    }
  }

  /// Play feedback sound (correct, incorrect, etc.)
  Future<void> playFeedback(FeedbackSound sound) async {
    if (_isMuted) return;
    
    try {
      final soundPath = _getFeedbackPath(sound);
      await _feedbackPlayer.play(AssetSource(soundPath));
    } catch (e) {
      print('Error playing feedback sound: $e');
    }
  }

  /// Play encouragement audio
  Future<void> playEncouragement(String audioPath) async {
    if (_isMuted) return;
    
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      print('Error playing encouragement: $e');
    }
  }

  /// Stop all audio playback
  Future<void> stopAll() async {
    await _audioPlayer.stop();
    await _feedbackPlayer.stop();
  }

  /// Toggle mute
  void toggleMute() {
    _isMuted = !_isMuted;
    if (_isMuted) {
      stopAll();
    }
  }

  /// Set volume (0.0 to 1.0)
  Future<void> setVolume(double volume) async {
    await _audioPlayer.setVolume(volume);
    await _feedbackPlayer.setVolume(volume);
  }

  String _getFeedbackPath(FeedbackSound sound) {
    switch (sound) {
      case FeedbackSound.correct:
        return 'audio/sounds/correct.mp3';
      case FeedbackSound.incorrect:
        return 'audio/sounds/incorrect.mp3';
      case FeedbackSound.celebration:
        return 'audio/sounds/celebration.mp3';
      case FeedbackSound.buttonTap:
        return 'audio/sounds/button_tap.mp3';
      case FeedbackSound.starCollect:
        return 'audio/sounds/star_collect.mp3';
    }
  }

  /// Dispose of players
  void dispose() {
    _audioPlayer.dispose();
    _feedbackPlayer.dispose();
  }
}

enum FeedbackSound {
  correct,
  incorrect,
  celebration,
  buttonTap,
  starCollect,
}
