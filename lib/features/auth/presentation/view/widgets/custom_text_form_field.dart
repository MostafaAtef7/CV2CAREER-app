import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    required this.onSumbitted,
    required this.onChanged,
    required this.validator,
    @required this.controller,
    this.obsureText = false,
  });
  final String hintText;
  final Icon suffixIcon;
  final bool obsureText;
  final Function(String)? onSumbitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onSumbitted,
        validator: validator,
        obscureText: obsureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          enabledBorder: OutlineInputBorder(
              gapPadding: 16, borderRadius: BorderRadius.circular(32)),
          focusedBorder: OutlineInputBorder(
              gapPadding: 16, borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }
}
