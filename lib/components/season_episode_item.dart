import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobsityChallenge/models/season_episode.dart';

import 'image_container.dart';
import 'summary.dart';

class SeasonEpisodeItem extends StatelessWidget {
  final SeasonEpisode seasonEpisode;

  SeasonEpisodeItem(this.seasonEpisode);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (seasonEpisode.imageUrl != null)
          ImageContainer(
            seasonEpisode.imageUrl,
          ),
        Text("Number: " + seasonEpisode.number),
        Text("Name: " + seasonEpisode.name),
        Summary(seasonEpisode.summary),
      ],
    );
  }
}
