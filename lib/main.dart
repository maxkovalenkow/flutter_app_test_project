import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/list_view_page.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProductsRepositoriyImpl productsRepositoriy;
  AppDatabase appDatabase;

  @override
  initState() {
    super.initState();

    appDatabase = AppDatabase();

    productsRepositoriy = ProductsRepositoriyImpl(
        localDataSource: ProductsLocalDataSourceImpl(appDatabase: appDatabase),
        remoteDataSource: ProductsRemoteDataSourceImpl());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: ListProductBloc(
            getListProduct: GetListProduct(productsRepositoriy)),
        child: ListViewPage(productsRepositoriy: productsRepositoriy),
      ),
    );
  }
}
