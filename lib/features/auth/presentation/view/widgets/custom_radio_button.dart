import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/auth/presentation/view/widgets/custom_text.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});
  static String? groupValue = 'HR';
  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomText(text: 'Type'),
        Radio(
          value: 'HR',
          activeColor: kPrimaryColor,
          groupValue: CustomRadioButton.groupValue,
          onChanged: (value) {
            CustomRadioButton.groupValue = value;
            setState(() {});
          },
        ),
        const Text('HR'),
        const SizedBox(
          width: 5,
        ),
        Radio(
          value: 'Job Seeker',
          activeColor: kPrimaryColor,
          groupValue: CustomRadioButton.groupValue,
          onChanged: (value) {
            CustomRadioButton.groupValue = value;
            setState(
              () {},
            );
          },
        ),
        const Text('Job Seeker'),
      ],
    );
  }
}
