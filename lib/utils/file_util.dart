import 'dart:io';

class FileUtil {
  static Future<String> getContentFromFile(String fileName) async {
    if (fileName == null || fileName.isEmpty) {
      return '';
    }

    final String content = await File(fileName).readAsString();

    return content;
  }
}
