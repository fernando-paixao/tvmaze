import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsityChallenge/bloc/show_list_screen/show_list_bloc.dart';
import 'package:jobsityChallenge/components/pagination.dart';
import 'package:jobsityChallenge/components/show_item.dart';
import 'package:jobsityChallenge/models/show.dart';

import 'empty_list.dart';

class ShowListResultScreen extends StatefulWidget {
  @override
  _ShowListResultScreenState createState() => _ShowListResultScreenState();
}

class _ShowListResultScreenState extends State<ShowListResultScreen> {
  @override
  void initState() {
    BlocProvider.of<ShowListBloc>(context).add(RetrieveList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowListBloc, ShowListState>(
      builder: (context, state) {
        if (state is ShowListEmpty)
          return _buildShowListEmpty(context);
        else if (state is ShowListLoading)
          return _buildShowListLoading(context);
        else if (state is ShowListLoaded)
          return _buildShowListLoaded(context, state.updatedShowList,
              page: state.page);
        else if (state is ShowFilteredListLoaded)
          return _buildShowListLoaded(context, state.updatedShowList);
        else if (state is ShowListError)
          return _buildShowListError(context);
        else
          return _buildShowListError(context);
      },
      listener: (context, state) {},
    );
  }

  Widget _buildShowListEmpty(BuildContext context) => EmptyList();

  Widget _buildShowListLoading(BuildContext context) => EmptyList(
        text: "loading",
      );

  Widget _buildShowListLoaded(BuildContext context, List<Show> updatedOtpList,
      {int page}) {
    var showItems = List.generate(
      updatedOtpList.length,
      (index) => ShowItem(updatedOtpList.elementAt(index)),
    );

    List<Widget> listItems = [];
    if (page != null) {
      listItems.add(Pagination(page, showItems.length));
    }
    listItems.addAll(showItems);
    if (page != null) {
      listItems.add(Pagination(page, showItems.length));
    }

    return Expanded(
        child: ListView(
      physics: RangeMaintainingScrollPhysics(parent: BouncingScrollPhysics()),
      children: listItems,
    ));
  }

  Widget _buildShowListError(BuildContext context) => EmptyList(
        text: "has error",
      );
}
