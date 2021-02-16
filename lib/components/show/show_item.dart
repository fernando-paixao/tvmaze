import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/screens/show/show_details_screen.dart';

import '../image_container.dart';

class ShowItem extends StatelessWidget {
  final Show show;

  ShowItem(this.show);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Column(
          children: [
            if (show.imageUrl != null)
              ImageContainer(
                show.imageUrl,
                sizeName: "big",
              ),
            Text(
              //"Name: " +
              show.name,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowDetailsScreen(show)),
          );
        },
      ),
    );
  }
}
