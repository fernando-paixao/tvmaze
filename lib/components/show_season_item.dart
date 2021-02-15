import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobsityChallenge/models/show_season.dart';

import 'image_container.dart';
import 'summary.dart';

class ShowSeasonItem extends StatelessWidget {
  final ShowSeason showSeason;

  ShowSeasonItem(this.showSeason);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showSeason.imageUrl != null) ImageContainer(showSeason.imageUrl),
        Text("Season Number: " + showSeason.number),
        Text("Name: " + showSeason.name),
        Summary(showSeason.summary),
      ],
    );
  }
}
