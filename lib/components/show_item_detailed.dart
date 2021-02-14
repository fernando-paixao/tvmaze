import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobsityChallenge/models/show.dart';

class ShowItemDetailed extends StatelessWidget {
  final Show show;

  ShowItemDetailed(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text("Imagem: " + show.imageUrl),
        if (show.imageUrl != null)
          Image.network(
            show.imageUrl,
            height: 200,
          ),
        Text("Name: " + show.name),
        Text("Genres: " + show.genres.join(", ")),
        Text("Summary:"),
        Html(data: show.summary),
        Text("Days: " + show.scheduleDays.join(", ")),
        Text("Time: " + show.scheduleTime),
      ],
    );
  }
}
