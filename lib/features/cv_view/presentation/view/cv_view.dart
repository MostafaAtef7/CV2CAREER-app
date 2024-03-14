import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class CvView extends StatelessWidget {
  const CvView({super.key, required this.file});
  final File file;
  @override
  Widget build(BuildContext context) {
    final fileName = basename(file.path);
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
      ),
      body: PDFView(
        filePath: file.path,
      ),
    );
  }
}