/// 
/// PROJECT_NAME: hukumai & FILE_NAME: speech_service
/// Created by Vinoth Kumar on 30/07/23.
///
///
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// The SpeechToTextService class provides functionality for speech recognition and navigation based on recognized speech commands.
class SpeechToTextService {
  stt.SpeechToText? _speechToText; // Add "?" to make it nullable
  Function(String)? _onSpeechToAction; // Add "?" to make it nullable

  SpeechToTextService._();

  static final SpeechToTextService _instance = SpeechToTextService._();

  factory SpeechToTextService() {
    return _instance;
  }

  /// Initializes the speech recognition engine.
  Future<void> onInitSpeech() async {
    _speechToText ??= stt.SpeechToText();
    bool available = await _speechToText!.initialize();
    if (!available) {
      // Speech recognition not available
      // Handle the error or provide feedback to the user
    }
  }


  /// Starts listening for speech input and invokes the provided callback function
  /// when a speech recognition result is received.
  void startListening(Function(String) onSpeechToAction) {
    _onSpeechToAction = onSpeechToAction;
    _speechToText!.listen(
      onResult: onSpeechResult,
    );
  }
  String? previousRecognizedWords;
  // Modify the startListening method in SpeechToTextService class
  void startListeningCallback(Function(String) onSpeechResultCallback) {
    _speechToText!.listen(
      onResult: (result) {
        String recognizedWords = result.recognizedWords;
        if (recognizedWords.isNotEmpty && recognizedWords != previousRecognizedWords) {
          previousRecognizedWords = recognizedWords;
          onSpeechResultCallback(result.recognizedWords);
        }
      },
    );
  }

  /// Stops listening for speech input.
  void stopListening() {
    _speechToText!.stop();
  }

  /// Handles the speech recognition result and invokes the callback function
  /// with the recognized words if they are not empty.
  void onSpeechResult(SpeechRecognitionResult result) {
    String recognizedWords = result.recognizedWords;
    if (recognizedWords.isNotEmpty) {

      print(recognizedWords);
      //_onSpeechToAction!(bestMatch);
    }
  }
}