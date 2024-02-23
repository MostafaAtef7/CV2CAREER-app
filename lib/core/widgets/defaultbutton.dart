import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;

  const DefaultButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 200,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              colors: [kSecondColor, kPrimaryColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
            onPressed: () {
              // Do Thing
              // Send CV to HR
            },
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }
}
