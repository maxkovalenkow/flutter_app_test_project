import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';

class ViewWidget extends StatelessWidget {
  final Product product;

  ViewWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(product.image),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                product.subtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
