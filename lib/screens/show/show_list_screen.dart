import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';

import '../../styles.dart';
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
    return Padding(
      padding: const EdgeInsets.all(Styles.PADDING_SIZE),
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.movie_filter),
            hintText: 'Type here to search shows',
            labelText: 'Find',
          ),
          onChanged: (String value) {
            _onSearchChanged(value);
          },
        ),
        ShowListResultScreen(),
      ]),
    );
  }

  _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.isNotEmpty) {
        BlocProvider.of<ShowListBloc>(context).add(RetrieveFilteredList(value));
      } else
        BlocProvider.of<ShowListBloc>(context).add(RetrieveList());
    });
  }
}
