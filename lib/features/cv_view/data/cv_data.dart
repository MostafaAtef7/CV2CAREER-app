import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CvApi {
  static Future<File> _storeFile(
      {required String url, required List<int> bytes}) async {
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<File> loadFirebasePdf({required String url}) async {
    final refPdf = FirebaseStorage.instance.ref().child(url);
    final bytes = await refPdf.getData();
    return _storeFile(url: url, bytes: bytes!);
  }
}