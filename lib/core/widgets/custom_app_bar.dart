import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? widget;
  final double paddingHorizontal;
  final double paddingVertical;
  const CustomAppBar({
    super.key,
    @required this.widget,
    required this.paddingHorizontal,
    required this.paddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.9],
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: widget,
      ),
    );
  }
}
