// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget(
      {super.key,
      required this.text1,
      required this.text2,
      required this.fun,
      this.size1,
      this.size2});
  final String text1;
  final String text2;
  final Function() fun;
  final double? size1;

  final double? size2;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: RichText(
            text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text1,
              style: TextStyle(color: Colors.black87, fontSize: size1),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size2),
              recognizer: TapGestureRecognizer()..onTap = () => fun(),
            ),
          ],
        )),
      ),
    );
  }
}
