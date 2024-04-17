import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.onSumbitted,
    required this.onChanged,
    required this.validator,
    @required this.controller,
    required this.isPassword,
  });

  final String hintText;
  final Icon suffixIcon;
  final Function(String)? onSumbitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    bool obsureText = isPassword;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSumbitted,
        validator: validator,
        obscureText: obsureText,
        cursorColor: kPrimaryColor,
        obscuringCharacter: '●',
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          enabledBorder: OutlineInputBorder(
              gapPadding: 16, borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              gapPadding: 16, borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
