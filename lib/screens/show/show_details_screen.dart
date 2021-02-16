import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/loading.dart';
import 'package:jobsityChallenge/components/show/show_item_detailed.dart';
import 'package:jobsityChallenge/constants/app_constants.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/models/show_season.dart';
import 'package:jobsityChallenge/screens/season/show_season_container.dart';
import 'package:jobsityChallenge/services/api.dart';

import '../../styles.dart';

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
