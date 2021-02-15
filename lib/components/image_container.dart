import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final String size;

  ImageContainer(this.imageUrl, {this.size = "medium"});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightFactor = 7 / 10;
    if (size == "big") {
      heightFactor = 3 / 4;
    }
    double widthFactor = 7 / 10;
    if (size == "big") {
      widthFactor = 3 / 4;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: widthFactor * size.width,
          maxHeight: heightFactor * size.height),
      child: Container(
        child: Image.network(imageUrl),
      ),
    );
  }
}
