import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/product_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/products_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/edit_page.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_widget.dart';
import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ProductsBloc productsBloc;

  ProductBloc productBloc = ProductBloc(
      id: -1, getItemProduct: GetItemProduct(ProductsRepositoriyImpl.getPR));

  @override
  void initState() {
    super.initState();

    productsBloc = BlocProvider.of<ProductsBloc>(context);
  }

  final globalKey = GlobalKey<ScaffoldState>();

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text('Products')),
      body: ListWidget(
        productsBloc: productsBloc,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                  bloc: productBloc,
                  child: EditPage(
                    product: Product(
                        id: -1,
                        image: 'https://dummyimage.com/600x400/000/fff',
                        title: '',
                        subtitle: ''),
                    editPageType: EditPageType.Add,
                  )),
            ),
          );

          String msg = productBloc.sendState;

          if (msg != '') {
            globalKey.currentState.hideCurrentSnackBar();

            globalKey.currentState.showSnackBar(SnackBar(
              content: Text(msg),
            ));

            productBloc.sendState = '';

            i++;
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
