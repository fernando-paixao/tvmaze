import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/show.dart';
import 'package:jobsityChallenge/screens/show_details_screen.dart';

class ShowItem extends StatelessWidget {
  final Show show;

  ShowItem(this.show);

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
        RaisedButton(onPressed: () {
          print("clicked");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowDetailsScreen(show)),
          );
        })
      ],
    );
  }
}
