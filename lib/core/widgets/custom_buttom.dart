import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  final double width, height;
  const CustomButton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24.0), // Adjust the radius as needed
          ),
        ),
      ),
      child: const Text(
        "Apply",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Rubik",
        ),
      ),
    );
  }
}
