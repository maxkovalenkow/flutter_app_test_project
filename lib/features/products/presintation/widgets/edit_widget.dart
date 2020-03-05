import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';

class EditWidget extends StatefulWidget {
  final TextEditingController productImageController;

  final TextEditingController productTitleController;

  final TextEditingController productSubtitleController;

  final Product product;
  final Stream<Product> streamProduct;

  EditWidget(this.productImageController, this.productTitleController, this.productSubtitleController, {@required this.product, @required this.streamProduct});

  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: widget.streamProduct,
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            if (snapshot.hasData) {
              Product product = snapshot.data;

              widget.productImageController.text = product.image;
              widget.productTitleController.text = product.title;
              widget.productSubtitleController.text = product.subtitle;

              return Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Image'),
                    controller: widget.productImageController,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Title'),
                    controller: widget.productTitleController,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Subtitle'),
                    controller: widget.productSubtitleController,
                  ),
                ],
              );
            } else
              return Container();
          },
        ));
  }
}
