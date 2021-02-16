import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/season_episode.dart';

import '../image_container.dart';
import '../summary.dart';

class SeasonEpisodeItem extends StatelessWidget {
  final SeasonEpisode seasonEpisode;

  SeasonEpisodeItem(this.seasonEpisode);

  @override
  Widget build(BuildContext context) {
    String title = seasonEpisode.number;
    if (seasonEpisode.name.isNotEmpty) title += " - " + seasonEpisode.name;
    return Column(
      children: [
        if (seasonEpisode.imageUrl != null)
          ImageContainer(
            seasonEpisode.imageUrl,
          ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Summary(seasonEpisode.summary),
      ],
    );
  }
}
