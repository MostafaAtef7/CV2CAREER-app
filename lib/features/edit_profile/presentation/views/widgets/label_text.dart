import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
