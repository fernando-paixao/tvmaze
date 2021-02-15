import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/screens/show/show_list_screen.dart';

import 'bloc/show_list_screen/show_list_bloc.dart';
import 'screens/people/people_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShowListBloc()),
      ],
      child: MaterialApp(
        title: 'Jobsity Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PeopleListScreen(),
      ),
    );
  }
}
