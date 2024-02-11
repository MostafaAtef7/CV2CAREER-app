import 'package:flutter/material.dart';

import 'package:gp_app/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconButton? iconButton;
  const CustomAppBar({
    super.key,
    @required this.iconButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: iconButton ?? const SizedBox(),
      centerTitle: true,
      title: const Text(
        "CV2CAREER",
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Rubik",
        ),
      ),
    );
  }
}
