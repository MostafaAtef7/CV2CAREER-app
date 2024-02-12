import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key, this.image, this.title, this.description});
  final String? image;
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image!,
          height: 250,
        ),
        const Spacer(),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(description!,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
        const Spacer(),
        //
      ],
    );
  }
}
