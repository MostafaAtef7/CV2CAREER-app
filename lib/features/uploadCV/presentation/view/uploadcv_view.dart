import 'package:flutter/material.dart';
import 'widgets/uploadcv_view_body.dart';

class uploadcv_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: uploadcv_view_body(),
      ),
    );
  }
}
