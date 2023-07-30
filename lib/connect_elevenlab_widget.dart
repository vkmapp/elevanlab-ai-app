import 'dart:convert';

import 'package:flutter/material.dart';

///
/// PROJECT_NAME: hukumai & FILE_NAME: connect_elevenlab_widget
/// Created by Vinoth Kumar on 30/07/23.
///
///

import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:elevenlabs/elevenlabs.dart';

import 'connect_open_ai_widget.dart';

class ConnectElevenLab extends StatefulWidget {
  const ConnectElevenLab({Key? key}) : super(key: key);

  @override
  State<ConnectElevenLab> createState() => _ConnectElevenLabState();
}

class _ConnectElevenLabState extends State<ConnectElevenLab> {
  String text =
      "Boss eagerly waiting for your command. Ready and excited to talk!";

  String motivation = "In the darkest night, a single spark ignited hope. With unwavering courage, they conquered the impossible, illuminating a path for others to follow. Dreams transformed into reality, proving that even the smallest light can dispel the deepest darkness.";


  /// Boss Command
  _hukumAI() async {
    File file = await ElevenLabs.instance.create(
      text: text,
      voiceId: "ErXwobaYiN019PkySvjV", //"ErXwobaYiN019PkySvjV",
      fileName: "Hukum10000",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  /// Abdul Kalam Voice
  _motivationalStory() async {
    File file = await ElevenLabs.instance.create(
      text: text,
      voiceId: "SovZFO2BUV3qlWSg4M4y", //"ErXwobaYiN019PkySvjV",
      fileName: "Motivation10000",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  Future<void> getAndDisplayPoem() async {
    final String prompt = 'The moon shines bright,\nOver the city at night.\nA cat strolls by.';
    final response = await generatePoem(prompt);

    if (response != null) {
      Map<String, dynamic> jsonResponse = jsonDecode(response);
      String poem = jsonResponse['choices'][0]['text'];
      // Display or use the poem in your app as required
      print('poem poem poem poem ');
      print(poem);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => _hukumAI(), child: const Text("Hukum!")),
            ElevatedButton(
                onPressed: () => _motivationalStory(), child: const Text("Motivation Story")),
            //generatePoem
            ElevatedButton(
                onPressed: () => getAndDisplayPoem(), child: const Text("Get and Display Story")),
          ],
        ),
      ),
    );
  }
}



AudioPlayer audioPlayer = AudioPlayer();
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String text =
      "Once men turned their thinking over to machines in the hope that this would set them free. But that only permitted other men with machines to enslave them.";

  _playDemo() async {
    File file = await ElevenLabs.instance.create(
      text: text,
      voiceId: "ErXwobaYiN019PkySvjV",
      fileName: "Hello World",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  _playDagothUr() async {
    await audioPlayer.play(AssetSource("DagothUr.mp3"), volume: 2.0);
  }

  listVoices() async {
    final voices = await ElevenLabs.instance.listVoices();
    for (var i in voices) {
      print(
          'Voice Name: ${i.name}, Voice ID: ${i.voiceId}, Category: ${i.category}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => _playDemo(), child: const Text("Play Demo")),
            ElevatedButton(
                onPressed: () => _playDagothUr(),
                child: const Text("Dagoth Ur")),
            ElevatedButton(
                onPressed: () => listVoices(),
                child: const Text("Fetch Voices")),
          ],
        ),
      ),
    );
  }
}