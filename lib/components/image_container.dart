import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final String sizeName;

  ImageContainer(this.imageUrl, {this.sizeName = "medium"});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double sizeFactor = Styles.getSizeFactor(sizeName);

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: 1 / 2 * size.width, maxHeight: 1 / 2 * size.height),
      child: Container(
        child: Image.network(imageUrl),
      ),
    );
  }
}
