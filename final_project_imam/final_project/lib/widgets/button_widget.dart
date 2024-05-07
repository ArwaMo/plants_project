import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.fun});
  final String text;
  final Function() fun;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xffb7c099),
      onPressed: () {
        fun();
      },
      child: Text(
        text,
        style: const TextStyle(color: Color(0xff262515)),
      ),
    );
  }
}
