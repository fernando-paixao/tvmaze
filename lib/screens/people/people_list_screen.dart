import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/people_list_screen/people_list_bloc.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';

import '../../styles.dart';
import '../people/people_list_result_screen.dart';

class PeopleListScreen extends StatefulWidget {
  @override
  _PeopleListScreenState createState() => _PeopleListScreenState();
}

class _PeopleListScreenState extends State<PeopleListScreen> {
  Timer _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Styles.PADDING_SIZE),
      child: Scaffold(
          /*drawer: Drawer(
            child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  /*DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),*/
                  ListTile(
                    title: Text('Version'),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ]),
          ),*/
          appBar: AppBar(
            actions: [],
            title: Text(AppConstants.APP_TITLE),
          ),
          body: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Type here to search people',
                labelText: 'Find',
              ),
              onChanged: (String value) {
                _onSearchChanged(value);
              },
            ),
            PeopleListResultScreen(),
          ])),
    );
  }

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.isNotEmpty) {
        BlocProvider.of<PeopleListBloc>(context)
            .add(RetrieveFilteredList(value));
      }
    });
  }
}