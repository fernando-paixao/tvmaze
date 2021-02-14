import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/show_item_detailed.dart';
import 'package:jobsityChallenge/models/show.dart';

class ShowDetailsScreen extends StatefulWidget {
  final Show show;

  ShowDetailsScreen(this.show);

  @override
  _ShowDetailsScreen createState() => _ShowDetailsScreen();
}

class _ShowDetailsScreen extends State<ShowDetailsScreen> {
  //@override
  //void initState() {
  //  //BlocProvider.of<ShowListBloc>(context).add(RetrieveList());
  //  super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
            physics:
                RangeMaintainingScrollPhysics(parent: BouncingScrollPhysics()),
            children: [ShowItemDetailed(widget.show)],
          )),
        ],
      ),
    );
  }
}
