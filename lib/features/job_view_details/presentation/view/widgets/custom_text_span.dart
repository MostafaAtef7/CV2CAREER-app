import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String title, subtitle;
  const CustomTextSpan(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
            ),
          ),
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: "Rubik",
            ),
          ),
        ],
      ),
    );
  }
}
