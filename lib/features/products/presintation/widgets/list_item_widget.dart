import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/view_page.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;
  final GetItemProduct getItemProduct;

  ListItemWidget({@required this.product, @required this.getItemProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(product.image),
            SizedBox(
              height: 16.0,
            ),
            Text(
              product.title,
            ),
          ],
        ),
        subtitle: Text(
          product.subtitle,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ViewPage(
                  product: product,
                  getItemProduct:
                      getItemProduct.call(params: Params<Product>(product))),
            ),
          );
        },
      ),
    );
  }
}
