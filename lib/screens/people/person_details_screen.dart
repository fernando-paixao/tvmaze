import 'package:flutter/material.dart';
//import 'package:jobsityChallenge/components/person/person_item_detailed.dart';
import 'package:jobsityChallenge/components/show/show_item.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';
import 'package:jobsityChallenge/models/person.dart';
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
  List<ShowItem> shows;

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
    List<Widget> list = [];
    //PersonItemDetailed(widget.person),
    //];
    /*if (isLoaded) {
      var seasonItems = List.generate(
        shows.length,
        (index) => PersonSeasonContainer(shows.elementAt(index)),
      );
      list.addAll(seasonItems);
    } else {
      list.add(Text("Loading"));
    }*/

    return Scaffold(
      /*drawer: Drawer(
        child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              )
            ]),
      ),*/
      appBar: AppBar(
        actions: [],
        title: Text(AppConstants.APP_TITLE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Styles.PADDING_SIZE),
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
