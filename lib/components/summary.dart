import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jobsityChallenge/models/show.dart';

class Summary extends StatelessWidget {
  final String summary;

  Summary(this.summary);

  @override
  Widget build(BuildContext context) {
    return (summary == null)
        ? SizedBox()
        : Column(children: [
            //Text("Summary:"),
            Html(data: summary),
          ]);
  }
}
