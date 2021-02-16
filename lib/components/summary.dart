import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Summary extends StatelessWidget {
  final String summary;

  Summary(this.summary);

  @override
  Widget build(BuildContext context) {
    return (summary == null)
        ? SizedBox()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              //Text("Summary:"),
              Html(
                data: summary,
                defaultTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ]),
          );
  }
}
