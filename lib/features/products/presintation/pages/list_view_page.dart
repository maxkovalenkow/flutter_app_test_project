import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/data/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_widget.dart';

class ListViewPage extends StatefulWidget {
 final ProductsRepositoriyImpl productsRepositoriy;

  const ListViewPage({@override this.productsRepositoriy});

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListWidget(productsRepositoriy: widget.productsRepositoriy),
    );
  }
}
