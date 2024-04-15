import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField(
      {super.key, required this.hintText, required this.onSumbitted});
  final String hintText;
  final Function(String)? onSumbitted;
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(8),
      elevation: 10,
      child: SizedBox(
        height: 45,
        width: 246,
        child: TextField(
            onSubmitted: onSumbitted,
            decoration: InputDecoration(
                // fillColor: Theme.of(context).colorScheme.primary,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xffACACAC),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ))),
      ),
    );
  }
}
