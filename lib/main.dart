import 'package:elevenlabs/elevenlabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'connect_elevenlab_widget.dart';
import 'landing_page.dart';
import 'speech_to_text_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// To set the status bar color to white
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
  ));
  // Initialize ElevenLabs
  await ElevenLabs.init(apiKey: "API_KEY_11LAB");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HukumAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const LandingWidget(),
      //home: const ConnectElevenLab(),
      //home: const SpeechToTextPage(),
    );
  }
}
