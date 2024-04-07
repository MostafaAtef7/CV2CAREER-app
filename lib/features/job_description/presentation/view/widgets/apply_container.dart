import 'package:flutter/material.dart';
import 'package:gp_app/core/widgets/defaultbutton.dart';
import 'package:gp_app/features/job_description/presentation/view/widgets/text_component.dart';

class ApplyContainer extends StatelessWidget {
  const ApplyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 25, left: 25),
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0.9,
                blurRadius: 4)
          ]),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextComponent(txt: "Name Job", fontW: FontWeight.w600),
          SizedBox(height: 10),
          Row(
            children: [
              TextComponent(txt: "Location", fontW: FontWeight.w300),
              SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextComponent(txt: "Type", fontW: FontWeight.w300),
            ],
          ),
          SizedBox(height: 7),
          Row(
            children: [
              TextComponent(txt: "Deadline", fontW: FontWeight.w300),
              SizedBox(
                child: Text(
                  " - ",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextComponent(txt: "Salary", fontW: FontWeight.w300),
            ],
          ),
          DefaultButton(
            text: "Apply",
          )
        ],
      ),
    );
  }
}
