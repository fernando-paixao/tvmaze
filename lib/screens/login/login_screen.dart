import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';
import 'package:jobsityChallenge/screens/login/login_form_screen.dart';

import '../../styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(AppConstants.APP_TITLE),
        ),
        body: Padding(
            padding: Styles.getMainEdgeInsets(),
            child: Column(
              children: [
                LoginFormScreen(),
              ],
            )));
  }
}
