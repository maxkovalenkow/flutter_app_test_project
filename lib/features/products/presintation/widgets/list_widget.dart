import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/block.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_item_widget.dart';

class ListWidget extends StatelessWidget {
  final ProductsBloc productsBloc;

  const ListWidget({@required this.productsBloc});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: productsBloc.getListProducts.call(),
    builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
      List<Product> products = snapshot.data ?? List();

      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          Product itemProducts = products[index];
          return ListItemWidget(
            product: itemProducts,
            getItemProduct: productsBloc.getItemProduct,
          );
        },
      );
    },
  );
  }
}