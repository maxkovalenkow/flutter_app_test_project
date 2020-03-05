import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/core/platform/network_info.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/block.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/list_widget.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    ProductsRepositoriy productsRepositoriy = ProductsRepositoriyImpl(
        remoteDataSource: ProductsRemoteDataSourceImpl(),
        localDataSource: ProductsLocalDataSourceImpl(),
        networkInfo: NetworkInfoImpl(true));

    ProductsBloc productsBloc = ProductsBloc(
        getListProducts: GetListProducts(productsRepositoriy),
        getItemProduct: GetItemProduct(productsRepositoriy));

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListWidget(productsBloc: productsBloc,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Database.getDB.insertProduct(Product(
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
