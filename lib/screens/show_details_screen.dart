import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/show_item_detailed.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/models/show_season.dart';
import 'package:jobsityChallenge/screens/show_season_container.dart';
import 'package:jobsityChallenge/services/api.dart';

import '../styles.dart';

class ShowDetailsScreen extends StatefulWidget {
  final Show show;

  ShowDetailsScreen(this.show);

  @override
  _ShowDetailsScreen createState() => _ShowDetailsScreen();
}

class _ShowDetailsScreen extends State<ShowDetailsScreen> {
  bool isLoaded;
  List<ShowSeason> seasons;

  void _loadSeasons() async {
    seasons = await Api().getShowSeasons(widget.show.id);
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
      ShowItemDetailed(widget.show),
    ];
    if (isLoaded) {
      var seasonItems = List.generate(
        seasons.length,
        (index) => ShowSeasonContainer(seasons.elementAt(index)),
      );
      list.addAll(seasonItems);
    } else {
      list.add(Text("Loading"));
    }

    return Scaffold(
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
