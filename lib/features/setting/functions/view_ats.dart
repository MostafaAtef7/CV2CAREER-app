import 'package:flutter/material.dart';
import 'package:gp_app/core/utils/functions/open_pdf.dart';
import 'package:gp_app/features/cv_view/data/cv_data.dart';

void viewATS(BuildContext context) async {
  const url = 'users/Lecture 3_Polygon Fill Area.pdf';
  final file = await CvApi.loadFirebasePdf(url: url);
  openPdf(file: file, context: context);
}
