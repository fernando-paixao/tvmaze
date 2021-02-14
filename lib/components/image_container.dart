import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final String size;

  ImageContainer(this.imageUrl, {this.size = "medium"});

  @override
  Widget build(BuildContext context) {
    double height = 200;
    if (size == "big") {
      height = 250;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 150),
      child: Container(
        //color: Colors.blue,
        child: Image.network(
          imageUrl,
          height: height,
        ),
      ),
    );
  }
}
