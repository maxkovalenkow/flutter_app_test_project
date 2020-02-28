import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/view_bloc.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';
import 'package:flutter_app_test_project/features/products/presentation/pages/view_page.dart';

class ProductsListPage extends StatefulWidget {
  ProductsListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductsListPageState createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();

    // Thanks to the BlocProvider providing this page with the ProductsBloc,
    // we can simply use this to retrieve it.
    _productsBloc = BlocProvider.of<ProductsBloc>(context);
  }

  /*void _addProduct() async {
    Product product = Product(contents: '');

    // Add this newly created product to the add product stream. Doing this
    // will trigger the listener in `products_bloc.dart` and call `_handleAddProduct`.
    _productsBloc.inAddProduct.add(product);
  }*/

  void _navigateToProduct(Product product) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        // Once again, use the BlocProvider to pass the ViewProductBloc
        // to the ViewProductPage
        builder: (context) => BlocProvider(
          bloc: ViewProductBloc(),
          child: ViewProductPage(
            product: product,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              // The streambuilder allows us to make use of our streams and display
              // that data on our page. It automatically updates when the stream updates.
              // Whenever you want to display stream data, you'll use the StreamBuilder.
              child: StreamBuilder<List<Product>>(
                stream: _productsBloc.products,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  // Make sure data exists and is actually loaded
                  if (snapshot.hasData) {
                    // If there are no products (data), display this message.
                    if (snapshot.data.length == 0) {
                      return Text('No products');
                    }

                    List<Product> products = snapshot.data;

                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = products[index];

                        return Card(
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(product.image),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Text(
                                  product.name,
                                ),
                              ],
                            ),
                            onTap: () {
                              _navigateToProduct(product);
                            },
                          ),
                        );
                      },
                    );
                  }

                  // If the data is loading in, display a progress indicator
                  // to indicate that. You don't have to use a progress
                  // indicator, but the StreamBuilder has to return a widget.
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: Icon(Icons.add),
      ),*/
    );
  }
}
