import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/utils/file_util.dart';

void main() async {
  String fileContents =
      await FileUtil.getContentFromFile("test/mocks/shows.json");
  List<dynamic> showsJson = json.decode(fileContents);
  List<Show> shows = showsJson.map((e) => Show.fromJson(e)).toList();

  group('ShowListBloc: ', () {
    blocTest(
      'Basic load shows',
      build: () {
        return ShowListBloc();
      },
      act: (otpListBloc) => otpListBloc.add(RetrieveFilteredList("good place")),
      expect: [
        ShowListLoading(),
        ShowFilteredListLoaded(shows),
      ],
    );
  });
}
