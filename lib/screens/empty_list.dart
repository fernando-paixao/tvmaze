import 'package:flutter/widgets.dart';

class EmptyList extends StatelessWidget {
  final String text;

  EmptyList({this.text = "Lista vazia"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(text),
    );
  }
}
