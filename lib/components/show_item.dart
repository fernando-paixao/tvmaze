import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/screens/show_details_screen.dart';

import 'image_container.dart';

class ShowItem extends StatelessWidget {
  final Show show;

  ShowItem(this.show);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (show.imageUrl != null)
          ImageContainer(
            show.imageUrl,
            size: "big",
          ),
        Text("Name: " + show.name),
        RaisedButton(
          child: Text("See More"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShowDetailsScreen(show)),
            );
          },
        )
      ],
    );
  }
}
