import 'package:flutter/material.dart';

class CustomMode extends StatelessWidget {
  const CustomMode(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      required this.iconColor,
      required this.iconData,
      required this.onPressed});
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Color iconColor;
  final IconData iconData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 79,
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color and opacity
              spreadRadius: 0, // Spread radius
              blurRadius: 18, // Blur radius
              offset: const Offset(0, 4), // Offset of the shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color: textColor,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
