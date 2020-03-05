import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';

class ViewWidget extends StatelessWidget {
  final Product product;
  final Stream<Product> streamProduct;

  ViewWidget({@required this.product, @required this.streamProduct});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamProduct,
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
        if (snapshot.hasData) {
          Product product = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(product.image),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                    ),
                    Text(
                      product.subtitle,
                    )
                  ],
                ),
              ),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
