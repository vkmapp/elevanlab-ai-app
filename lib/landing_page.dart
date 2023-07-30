///
/// PROJECT_NAME: hukumai & FILE_NAME: landing_page
/// Created by Vinoth Kumar on 30/07/23.
///
///
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

///
/// PROJECT_NAME: app & FILE_NAME: landing_page
/// Created by Vinoth Kumar on 30/07/23.
///
///
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hukumai/speech_service.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:elevenlabs/elevenlabs.dart';
import '../common_widgets/app_bar_widget.dart';
import '../common_widgets/speech_text_widget.dart';
import '../constant/assets.dart';
import '../constant/constant.dart';
import 'common_widgets/text_regular_widget.dart';

/// Speech To Text
bool speechText = false;
AudioPlayer audioPlayer = AudioPlayer();
class LandingWidget extends StatefulWidget {
  const LandingWidget({Key? key}) : super(key: key);

  @override
  State<LandingWidget> createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {

  SpeechToTextService speechToTextService = SpeechToTextService();
  String _text = 'Boss eagerly waiting for your command. Ready and excited to talk!';

  String textSpeech =
      "Boss eagerly waiting for your command. Ready and excited to talk!";
  String motivation = "In the darkest night, a single spark ignited hope. With unwavering courage, they conquered the impossible, illuminating a path for others to follow. Dreams transformed into reality, proving that even the smallest light can dispel the deepest darkness.";

  @override
  void initState() {
    super.initState();
    speechToTextService.onInitSpeech();
    _hukumAI();
  }

  void startListening() {
    setState(() {
      speechText = true;
    });
    speechToTextService.startListeningCallback((String recognizedWords) {
      print(recognizedWords);
      setState(() {
        _text = recognizedWords;

      });
    });
  }

  void stopListening() {
    speechToTextService.stopListening();

    setState(() {
      _text = motivation;
      speechText = false;
    });
    _motivationalStory();
  }


  /// Boss Command
  _hukumAI() async {
    File file = await ElevenLabs.instance.create(
      text: textSpeech,
      voiceId: "ErXwobaYiN019PkySvjV", //"ErXwobaYiN019PkySvjV",
      fileName: "Hukum10001",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  /// Abdul Kalam Voice
  _motivationalStory() async {
    File file = await ElevenLabs.instance.create(
      text: motivation,
      voiceId: "SovZFO2BUV3qlWSg4M4y", //"ErXwobaYiN019PkySvjV",
      fileName: "Motivation10001",
      stability: 0.4,
      similarityBoost: 0.6,
    );
    print(file.path);
    await audioPlayer.play(DeviceFileSource(file.path), volume: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: DraggableBottomSheet(
          minExtent: 270,
          useSafeArea: false,
          curve: Curves.easeIn,
          previewWidget: _previewWidget(),
          expandedWidget: _expandedWidget(),
          backgroundWidget: _backgroundWidget(),
          maxExtent: MediaQuery.of(context).size.height * 0.9,
          onDragging: (pos) {},
        ),
      );
    });
  }

  Widget _backgroundWidget() {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: const AppBarWidget(), //
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawChip(
              avatar: SvgPicture.asset(
                ranking, // Replace with your SVG file path
                color: kGreen, // You can set the color of the SVG icon
              ),
              label: const Text(
                'Default Voice',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kGreen,
                ),
              ),
              backgroundColor: kChip,
              shape:
                  const StadiumBorder(), // Use StadiumBorder to make it more rounded
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(
              height: 80.0,
            ),
            Expanded(
              child: ListView(
                children:  [
                  const SayGoodMorningWidget(),

                  /*DefaultTextStyle(
                    style: const TextStyle(
                      color: kWhite,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(_text),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),*/
                  SpeechTextWidget(
                    text: _text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Speech Icon
  Widget _previewWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kSheet,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: kBorder,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          const Spacer(),
          Center(
              child: speechText
                  ? InkWell(
                onTap: stopListening,
                    child: Column(
                children: [
                    SvgPicture.asset(
                      chat,
                      color:
                      kWhite, // You can set the color of the SVG icon
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TextRegularWidgetGray(text: 'Keep Speaking ...')
                ],
              ),
                  )
                  : InkWell(
                onTap: startListening,
                    child: Column(
                children: [
                    SvgPicture.asset(
                      tts, // Replace with your SVG file path
                      color:
                      kWhite, // You can set the color of the SVG icon
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TextRegularWidgetGray(text: 'Just tap here')
                ],
              ),
                  )),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kSheet,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          SizedBox(height: 8),
          LovedOnesWidget(),
          SizedBox(
            height: 20.0,
          ),
          SpeechTextWidget(
            text: 'See with Your Heart, \nHear with HukumAI',
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}

/// Say good morning widget
class SayGoodMorningWidget extends StatelessWidget {
  const SayGoodMorningWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextRegularWidgetGray(text: 'Good morning, Hukum!');
  }
}

/// Say good morning widget
class LovedOnesWidget extends StatelessWidget {
  const LovedOnesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Connecting You to Loved Ones Voice',
      style: TextStyle(
        color: kButton,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        height: 1.5,
      ),
      //textAlign: TextAlign.center,
    );
  }
}

//kButton

/// Say good morning widget
class ComingWidget extends StatelessWidget {
  const ComingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextRegularWidgetGray(
        text: 'Coming Soon...');
  }
}