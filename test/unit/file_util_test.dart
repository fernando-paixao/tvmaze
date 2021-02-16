import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobsityChallenge/utils/file_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  test('getContentFromFile', () async {
    String fileContents =
        await FileUtil.getContentFromFile("test/mocks/cast.json");
    assert(fileContents.isNotEmpty);
  });
}
