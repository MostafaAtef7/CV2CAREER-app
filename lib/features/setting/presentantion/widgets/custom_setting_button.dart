import 'package:flutter/material.dart';

class CustomSettingButton extends StatelessWidget {
  const CustomSettingButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon,
      this.iconSize = 20});
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context); // Get the current theme
    // final buttonColor = theme.colorScheme.primary; // Get the primary color from the color scheme
    // Get the button color from the theme

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color and opacity
            spreadRadius: 0, // Spread radius
            blurRadius: 18, // Blur radius
            offset: const Offset(0, 4), // Offset of the shadow
          ),
        ],
      ),
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        // backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
