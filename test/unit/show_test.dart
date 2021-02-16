import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/utils/file_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  test('fromJson', () async {
    String fileContents =
        await FileUtil.getContentFromFile("test/mocks/shows.json");
    List<dynamic> showsJson = json.decode(fileContents);
    List<Show> shows = showsJson.map((e) => Show.fromJson(e)).toList();
    assert(shows[0] is Show && shows[0].name.isNotEmpty);
  });
}
