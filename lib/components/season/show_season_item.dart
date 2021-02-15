import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/show_season.dart';

import '../image_container.dart';
import '../summary.dart';

class ShowSeasonItem extends StatelessWidget {
  final ShowSeason showSeason;

  ShowSeasonItem(this.showSeason);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showSeason.imageUrl != null) ImageContainer(showSeason.imageUrl),
        Text(
          "Season " + showSeason.number,
          style: Theme.of(context).textTheme.headline5,
        ),
        if (showSeason.name.isNotEmpty) Text("Name: " + showSeason.name),
        Summary(showSeason.summary),
      ],
    );
  }
}
