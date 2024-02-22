import 'package:flutter/material.dart';
import 'package:gp_app/features/description/presentation/view/widgets/descrption_view_body.dart';

class descrption_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: descrption_view_body(),
      ),
    );
  }
}
