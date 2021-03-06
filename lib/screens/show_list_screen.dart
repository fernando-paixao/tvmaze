import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';

import 'show_list_result_screen.dart';

class ShowListScreen extends StatefulWidget {
  @override
  _ShowListScreenState createState() => _ShowListScreenState();
}

class _ShowListScreenState extends State<ShowListScreen> {
  Timer _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.movie_filter),
          hintText: 'Type here to search shows',
          labelText: 'Find',
        ),
        onChanged: (String value) {
          _onSearchChanged(value);
        },
        /*validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },*/
      ),
      ShowListResultScreen(),
    ]));
  }

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      print("onchanged");
      BlocProvider.of<ShowListBloc>(context).add(RetrieveFilteredList(value));
    });
  }
}
