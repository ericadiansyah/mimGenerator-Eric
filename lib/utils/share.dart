// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';

class ShareUtils {
  static Future<void> shareMeme(Uint8List bytes) async {
    try {
      var output;

      if (Platform.isIOS) {
        output = await getTemporaryDirectory();
      } else {
        output = await getExternalStorageDirectory();
      }
      final file = File("${output.path}/doc.png");
      await file.writeAsBytes(bytes);

      await FlutterShare.shareFile(title: 'Ngememe Kuy', filePath: file.path);
    } catch (e) {}
  }
}
