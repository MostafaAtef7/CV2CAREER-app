import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.currentPassword,
      required this.updatePassword});
  final String firstName;
  final String lastName;
  final String email;
  final String currentPassword;
  final String updatePassword;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: save changes
      },
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
        child: const Center(
          child: Text(
            'Save Changes',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
