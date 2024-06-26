import 'package:flutter/material.dart';

import 'widgets/github_view_body.dart';

class GithubView extends StatelessWidget {
  const GithubView({super.key, required this.checkHR});
  final String checkHR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GithubViewBody(checkHR: checkHR),
    );
  }
}
