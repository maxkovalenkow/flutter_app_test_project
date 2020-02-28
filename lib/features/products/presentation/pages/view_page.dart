import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

class ViewProductPage extends StatefulWidget {
  ViewProductPage({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(widget.product.image),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(widget.product.contents),
            )
          ],
        ),
      ),
    );
  }
}
