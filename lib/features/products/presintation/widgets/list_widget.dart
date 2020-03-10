import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/products_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_item_widget.dart';

class ListWidget extends StatelessWidget {
  final ProductsBloc productsBloc;

  const ListWidget({@required this.productsBloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsBloc.products,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        List<Product> products = snapshot.data ?? List();

        List<Widget> children = List<Widget>();

        products.forEach((element) {
          children.add(ListItemWidget(
            product: element,
          ));
        });

        return GridView.count(
          primary: false,
          padding: EdgeInsets.all(4),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 2,
          children: children,
        );
      },
    );
  }
}
