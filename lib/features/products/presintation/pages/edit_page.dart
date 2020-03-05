import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/edit_widget.dart';

class EditPage extends StatefulWidget {
  final Product product;
  final Stream<Product> getItemProduct;

  EditPage({
    @required this.product,
    @required this.getItemProduct,
  });

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    EditWidget editWidget = EditWidget(
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      product: widget.product,
      streamProduct: widget.getItemProduct,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: editWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Database.getDB.updateProduct(Product(
            id: widget.product.id,
            title: editWidget.productTitleController.text,
            image: editWidget.productImageController.text,
            subtitle: editWidget.productSubtitleController.text,
          ));
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
