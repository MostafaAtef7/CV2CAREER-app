import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 2, bottom: 2),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
