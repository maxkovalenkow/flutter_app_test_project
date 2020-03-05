import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/products_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_widget.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ProductsBloc productsBloc;

  @override
  void initState() {
    super.initState();

    productsBloc = BlocProvider.of<ProductsBloc>(context);
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListWidget(
        productsBloc: productsBloc,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productsBloc.insertProduct(Product(
            title: 'title $i',
            image: 'https://dummyimage.com/600x400/0${i}0/fff',
            subtitle: 'subtitle $i',
          ));

          i++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
