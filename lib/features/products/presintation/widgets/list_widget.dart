import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_details.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_item_widget.dart';

class ListWidget extends StatefulWidget {
  final ProductsRepositoriyImpl productsRepositoriy;

  const ListWidget({@override this.productsRepositoriy});

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  ListProductBloc listProductBloc;

  GetDetailsProduct getDetailsProduct;

  @override
  initState() {
    super.initState();

    listProductBloc = BlocProvider.of<ListProductBloc>(context);

    getDetailsProduct = GetDetailsProduct(widget.productsRepositoriy);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listProductBloc.products,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        List<Product> products = snapshot.data ?? List();

        List<Widget> children = List<Widget>();

        products.forEach((element) {
          children.add(ListItemWidget(
              product: element, getDetailsProduct: getDetailsProduct));
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
