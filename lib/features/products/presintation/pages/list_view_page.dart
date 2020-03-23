import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  initState() {
    super.initState();
    
    context.bloc<ListProductBloc>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ListProductBloc, List<Product>>(
      builder: (context, products) {
        List<Widget> children = List<Widget>();

        products.forEach((element) {
          children.add(ListItemWidget(product: element));
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
    ),
    );
  }
}
