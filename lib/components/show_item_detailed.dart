import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobsityChallenge/models/show.dart';

import 'image_container.dart';

class ShowItemDetailed extends StatelessWidget {
  final Show show;

  ShowItemDetailed(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (show.imageUrl != null) ImageContainer(show.imageUrl),
        Text("Name: " + show.name),
        Text("Genres: " + show.genres.join(", ")),
        if (show.summary != null)
          Column(children: [
            Text("Summary:"),
            Html(data: show.summary),
          ]),
        Text("Days: " + show.scheduleDays.join(", ")),
        Text("Time: " + show.scheduleTime),
      ],
    );
  }
}
