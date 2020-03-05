import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  final TextEditingController productImageController;

  final TextEditingController productTitleController;

  final TextEditingController productSubtitleController;

  EditWidget(
      {this.productImageController,
      this.productTitleController,
      this.productSubtitleController});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Image'),
              controller: productImageController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: productTitleController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Subtitle'),
              controller: productSubtitleController,
            ),
          ],
        ));
  }
}
