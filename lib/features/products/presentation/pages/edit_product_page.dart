import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/view_product_bloc.dart';
import 'package:flutter_app_test_project/features/products/data/models/product_model.dart';

class EditProductPage extends StatefulWidget {
  EditProductPage({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  ViewProductBloc _viewProductBloc;
  TextEditingController _productImageController = new TextEditingController();
  TextEditingController _productNameController = new TextEditingController();
  TextEditingController _productContentsController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();

    _viewProductBloc = BlocProvider.of<ViewProductBloc>(context);
    _productImageController.text = widget.product.image;
    _productNameController.text = widget.product.name;
    _productContentsController.text = widget.product.contents;
  }

  void _saveProduct() async {
    widget.product.contents = _productContentsController.text;

    // Add the updated product to the save product stream. This triggers the function
    // we set in the listener.
    _viewProductBloc.inSaveProduct.add(widget.product);
  }

  void _deleteProduct() {
    // Add the product id to the delete product stream. This triggers the function
    // we set in the listener.
    _viewProductBloc.inDeleteProduct.add(widget.product.id);

    // Wait for `deleted` to be set before popping back to the main page. This guarantees there's no
    // mismatch between what's stored in the database and what's being displayed on the page.
    // This is usually only an issue with more database heavy actions, but it's a good thing to
    // add regardless.
    _viewProductBloc.deleted.listen((deleted) {
      if (deleted) {
        // Pop and return true to let the main page know that a product was deleted and that
        // it has to update the products list.
        Navigator.of(context).pop(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveProduct,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteProduct,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Image'),
              maxLines: null,
              controller: _productImageController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Name'),
              maxLines: null,
              controller: _productNameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Contents'),
              maxLines: null,
              controller: _productContentsController,
            ),
          ],
        ),
      ),
    );
  }
}
