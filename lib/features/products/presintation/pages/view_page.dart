import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/product_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/edit_page.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/view_widget.dart';

class ViewPage extends StatefulWidget {
  final Product product;

  ViewPage({@required this.product});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  ProductBloc productBloc;

  @override
  void initState() {
    super.initState();

    productBloc = BlocProvider.of<ProductBloc>(context);
  }

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext conte) {
    return StreamBuilder(
        stream: productBloc.product,
        builder: (BuildContext contex, AsyncSnapshot<Product> snapshot) {
          if (snapshot.hasData) {
            Product product = snapshot.data;

            return Scaffold(
                key: globalKey,
                appBar: AppBar(title: Text(product.title)),
                body: ViewWidget(
                  product: product,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                            bloc: productBloc,
                            child: EditPage(product: product, editPageType: EditPageType.Edit,)),
                      ),
                    );

                    String msg = productBloc.sendState;

                    if (msg != '') {
                      globalKey.currentState.hideCurrentSnackBar();

                      globalKey.currentState.showSnackBar(SnackBar(
                        content: Text(msg),
                      ));

                      productBloc.sendState = '';
                    }
                  },
                  child: Icon(Icons.edit),
                ));
          } else
            return Scaffold(
              body: Container(),
            );
        });
  }
}
