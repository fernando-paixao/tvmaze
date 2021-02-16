import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsityChallenge/models/person.dart';
import 'package:jobsityChallenge/screens/people/person_details_screen.dart';
//import 'package:jobsityChallenge/screens/person/person_details_screen.dart';

import '../image_container.dart';

class PersonItem extends StatelessWidget {
  final Person person;
  final String titleSuffix;

  PersonItem(this.person, {this.titleSuffix});

  @override
  Widget build(BuildContext context) {
    String title = person.name;
    if (titleSuffix != null) title += " - $titleSuffix";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Column(
          children: [
            if (person.imageUrl != null)
              ImageContainer(
                person.imageUrl,
                sizeName: "big",
              ),
            Text(
              //"Name: " +
              title,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonDetailsScreen(person)),
          );
        },
      ),
    );
  }
}
