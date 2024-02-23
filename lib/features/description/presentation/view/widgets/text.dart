import 'package:flutter/material.dart';

class TextCompnent extends StatelessWidget {
  final String txt;
  final FontWeight fontW;

  const TextCompnent({super.key, required this.txt, required this.fontW});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontWeight: fontW),
    );
  }
}
