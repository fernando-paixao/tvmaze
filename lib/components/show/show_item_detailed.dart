import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/components/schedule.dart';
import 'package:jobsityChallenge/components/summary.dart';
import 'package:jobsityChallenge/models/show.dart';

import '../image_container.dart';

class ShowItemDetailed extends StatelessWidget {
  final Show show;

  ShowItemDetailed(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (show.imageUrl != null) ImageContainer(show.imageUrl),
        Text(
          //"Name: " +
          show.name,
          style: Theme.of(context).textTheme.headline3,
        ),
        if (show.genres.isNotEmpty) Text(show.genres.join(", ")), //"Genres: "
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Summary(show.summary),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: Schedule(show),
        ),
      ],
    );
  }
}
