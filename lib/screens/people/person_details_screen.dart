import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/loading.dart';
import 'package:jobsityChallenge/components/person/person_item.dart';
//import 'package:jobsityChallenge/components/person/person_item_detailed.dart';
import 'package:jobsityChallenge/components/show/show_item.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';
import 'package:jobsityChallenge/models/person.dart';
import 'package:jobsityChallenge/models/show.dart';
//import 'package:jobsityChallenge/models/person_season.dart';
//import 'package:jobsityChallenge/screens/season/person_season_container.dart';
import 'package:jobsityChallenge/services/api.dart';

import '../../styles.dart';

class PersonDetailsScreen extends StatefulWidget {
  final Person person;

  PersonDetailsScreen(this.person);

  @override
  _PersonDetailsScreen createState() => _PersonDetailsScreen();
}

class _PersonDetailsScreen extends State<PersonDetailsScreen> {
  bool isLoaded;
  List<Show> shows;

  void _loadSeasons() async {
    shows = await Api().getPeopleCast(widget.person.id);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    isLoaded = false;
    _loadSeasons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      PersonItem(
        widget.person,
        titleSuffix: "Cast",
      )
    ];
    if (isLoaded) {
      var showsItems = List.generate(
        shows.length,
        (index) => ShowItem(shows.elementAt(index)),
      );
      list.addAll(showsItems);
    } else {
      list.add(Loading());
    }

    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(AppConstants.APP_TITLE),
      ),
      body: Padding(
        padding: Styles.getMainEdgeInsets(),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              physics: RangeMaintainingScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: list,
            )),
          ],
        ),
      ),
    );
  }
}
