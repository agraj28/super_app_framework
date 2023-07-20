import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AppDirectory {
  static Future<String> getDocumentsDirectory() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory?.path ?? '';
  }
}
