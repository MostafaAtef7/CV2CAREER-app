import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CVContainer extends StatelessWidget {
  final String txt;
  final double per;
  const CVContainer({super.key, required this.txt, required this.per});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color.fromARGB(238, 239, 241, 240),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 5.0,
            percent: per,
            center: Text(
              "${per * 100}%",
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800),
            ),
            progressColor: kPrimaryColor,
            animation: true,
            animationDuration: 1200,
          )
        ],
      ),
    );
  }
}
