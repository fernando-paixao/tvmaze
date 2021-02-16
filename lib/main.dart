import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';
import 'package:jobsityChallenge/styles.dart';

import 'bloc/people_list_screen/people_list_bloc.dart';
import 'bloc/show_list_screen/show_list_bloc.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShowListBloc()),
        BlocProvider(create: (_) => PeopleListBloc()),
      ],
      child: MaterialApp(
        title: AppConstants.APP_TITLE,
        theme: ThemeData(
          primarySwatch: Styles.appPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
