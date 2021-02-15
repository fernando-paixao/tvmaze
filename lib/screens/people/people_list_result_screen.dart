import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/people_list_screen/people_list_bloc.dart';
import 'package:jobsityChallenge/components/pagination.dart';
import 'package:jobsityChallenge/components/person/person_item.dart';
import 'package:jobsityChallenge/models/person.dart';

import '../empty_list.dart';

class PeopleListResultScreen extends StatefulWidget {
  @override
  _PeopleListResultScreenState createState() => _PeopleListResultScreenState();
}

class _PeopleListResultScreenState extends State<PeopleListResultScreen> {
  @override
  void initState() {
    BlocProvider.of<PeopleListBloc>(context).add(RetrieveFilteredList(""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return //Text("broa");
        BlocConsumer<PeopleListBloc, PeopleListState>(
      builder: (context, state) {
        if (state is PeopleListEmpty)
          return _buildPersonListEmpty(context);
        else if (state is PeopleListLoading)
          return _buildPersonListLoading(context);
        else if (state is PeopleFilteredListLoaded)
          return _buildPersonListLoaded(context, state.updatedPeopleList);
        else if (state is PeopleListError)
          return _buildPersonListError(context);
        else
          return _buildPersonListError(context);
      },
      listener: (context, state) {},
    );
  }

  Widget _buildPersonListEmpty(BuildContext context) => EmptyList();

  Widget _buildPersonListLoading(BuildContext context) => EmptyList(
        text: "loading",
      );

  Widget _buildPersonListLoaded(
      BuildContext context, List<Person> updatedOtpList,
      {int page}) {
    var personItems = List.generate(
      updatedOtpList.length,
      (index) => PersonItem(updatedOtpList.elementAt(index)),
    );

    List<Widget> listItems = [];
    if (page != null) {
      listItems.add(Pagination(page, personItems.length));
    }
    listItems.addAll(personItems);
    if (page != null) {
      listItems.add(Pagination(page, personItems.length));
    }

    return Expanded(
        child: ListView(
      physics: RangeMaintainingScrollPhysics(parent: BouncingScrollPhysics()),
      children: listItems,
    ));
  }

  Widget _buildPersonListError(BuildContext context) => EmptyList(
        text: "has error",
      );
}
