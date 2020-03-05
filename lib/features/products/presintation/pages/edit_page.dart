import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/product_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/edit_widget.dart';

class EditPage extends StatefulWidget {
  final Product product;

  EditPage({@required this.product});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  ProductBloc productBloc;

  EditWidget editWidget;

  @override
  void initState() {
    super.initState();

    productBloc = BlocProvider.of<ProductBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    editWidget = EditWidget(
      productTitleController: TextEditingController(text: widget.product.title),
      productImageController: TextEditingController(text: widget.product.image),
      productSubtitleController:
          TextEditingController(text: widget.product.subtitle),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: editWidget,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.updateProduct(Product(
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
