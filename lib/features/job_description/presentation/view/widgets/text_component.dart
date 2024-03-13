import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String txt;
  final FontWeight fontW;

  const TextComponent({super.key, required this.txt, required this.fontW});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontWeight: fontW),
    );
  }
}
