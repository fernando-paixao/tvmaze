import 'package:flutter/widgets.dart';

class EmptyList extends StatelessWidget {
  final String text;

  EmptyList({this.text = "No results"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        child: Text(text),
      ),
    );
  }
}
