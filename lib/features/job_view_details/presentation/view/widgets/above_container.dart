import 'package:flutter/material.dart';

class AboveContainer extends StatelessWidget {
  const AboveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(right: 8.0, top: 8),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius:  BorderRadius.only(
            topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.account_circle,color: Colors.white,),
          Text(
            " Posted by",
            style: TextStyle(
              fontFamily: "Rubik",
              color: Colors.white,
            ),
          ),
          Text(
            " Microsoft Company",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Rubik",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
