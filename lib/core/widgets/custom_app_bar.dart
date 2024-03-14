import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? widget;
  const CustomAppBar({
    super.key,
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 6,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
          child: const Text(""),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
