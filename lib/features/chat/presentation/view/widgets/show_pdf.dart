import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class Showpdf extends StatefulWidget {
//   final File file;
//   const Showpdf({super.key, required this.file});

//   @override
//   State<Showpdf> createState() => _ShowpdfState();
// }

// class _ShowpdfState extends State<Showpdf> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: SfPdfViewer.network(widget.file.path));
//   }
// }

class Showpdf extends StatefulWidget {
  final String url;
  const Showpdf({super.key, required this.url});

  @override
  State<Showpdf> createState() => _ShowpdfState();
}

class _ShowpdfState extends State<Showpdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.network(widget.url));
  }
}
