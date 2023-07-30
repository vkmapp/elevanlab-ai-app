import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../constant/sizes.dart';

///
/// PROJECT_NAME: app & FILE_NAME: text_widget
/// Created by Vinoth Kumar on 29/07/23.
///

class SpeechTextWidget extends StatelessWidget {
  const SpeechTextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.style,
    this.onPressed,
  });
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          Text(
            text,
            textAlign: textAlign,
            style: const TextStyle(
                color: kWhite,
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
                height: 1.5,),
            //textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
