import 'package:flutter/material.dart';

import 'widgets/template_view_body.dart';

class TemplateView extends StatelessWidget {
  const TemplateView({super.key, required this.checkHR});
  final String checkHR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateViewBody(
        checkHR: checkHR,
      ),
    );
  }
}
