import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/edit_page.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/view_widget.dart';

class ViewPage extends StatefulWidget {
  final Product product;
  final Stream<Product> getItemProduct;

  ViewPage({
    @required this.product,
    @required this.getItemProduct,
  });

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ViewWidget(
        product: widget.product,
        streamProduct: widget.getItemProduct,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditPage(
                  product: widget.product,
                  getItemProduct: widget.getItemProduct),
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
