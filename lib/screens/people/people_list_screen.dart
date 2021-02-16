import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/people_list_screen/people_list_bloc.dart';

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
      padding: Styles.getMainEdgeInsets(),
      child: Container(
        height: 500,
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Icon(
                  Icons.person,
                  size: 32.0,
                ),
              ),
              hintText: 'Type here to search people',
              labelText: 'Find',
            ),
            onChanged: (String value) {
              _onSearchChanged(value);
            },
          ),
          PeopleListResultScreen(),
        ]),
      ),
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
