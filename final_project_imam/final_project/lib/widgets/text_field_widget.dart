import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.controller, required this.type, required this.text});
  final TextEditingController controller;
  final TextInputType type;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
