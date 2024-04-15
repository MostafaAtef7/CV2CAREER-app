import 'package:flutter/material.dart';
import 'package:gp_app/features/setting/functions/logout.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => logout(context),
      child: Container(
        width: 214,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF78EA79),
              Color(0xFF3FC3AE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.9],
          ),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log out',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 22,
            ),
            Icon(
              Icons.logout_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
