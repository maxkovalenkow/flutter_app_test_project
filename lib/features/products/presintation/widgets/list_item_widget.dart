import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/product_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/view_page.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;

  ListItemWidget({@required this.product});

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
              builder: (context) => BlocProvider(
                  bloc: ProductBloc(
                      product: product,
                      getItemProduct:
                          GetItemProduct(ProductsRepositoriyImpl.getPR)),
                  child: ViewPage(product: product)),
            ),
          );
        },
      ),
    );
  }
}
