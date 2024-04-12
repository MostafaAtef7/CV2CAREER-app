import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';

class AddTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final double width;
  final int maxline;
  const AddTextfield(
      {super.key,
      required this.controller,
      required this.title,
      required this.width,
      required this.maxline});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          margin: const EdgeInsets.only(bottom: 10, right: 6, left: 6),
          // height: 35,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: TextFormField(
            onTap: () {
              print("click");
            },
            maxLines: maxline,
            style: const TextStyle(fontSize: 13, color: unSelectedColor),
            controller: controller,
            autofocus: false,
            cursorWidth: 1,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter",
              hintStyle: TextStyle(
                color: chatColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
