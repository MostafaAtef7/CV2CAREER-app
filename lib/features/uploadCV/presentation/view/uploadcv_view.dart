import 'package:flutter/material.dart';
import 'widgets/uploadcv_view_body.dart';

class UploadCvView extends StatelessWidget {
  const UploadCvView({super.key, required this.checkHR});
  final String checkHR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UploadCvViewBody(checkHR: checkHR),
    );
  }
}
