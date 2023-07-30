import 'package:flutter/material.dart';
import 'package:hukumai/speech_service.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

///
/// PROJECT_NAME: hukumai & FILE_NAME: speech_to_text_page
/// Created by Vinoth Kumar on 30/07/23.
///
///
class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({Key? key}) : super(key: key);

  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {

  SpeechToTextService speechToTextService = SpeechToTextService();
  String _text = '';

  @override
  void initState() {
    super.initState();
    speechToTextService.onInitSpeech();
  }

  void startListening() {
    speechToTextService.startListeningCallback((String recognizedWords) {
     print(recognizedWords);
       setState(() {
         _text = recognizedWords;
       });
    });
  }

  void stopListening() {
    speechToTextService.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(_text),
            ElevatedButton(
              onPressed: startListening,
              child: Text('Start Speech'),
            ),
            ElevatedButton(
              onPressed: stopListening,
              child: Text('Stop Speech'),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
