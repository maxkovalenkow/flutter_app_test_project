import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/products_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/list_view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: ProductsBloc(
            getListProducts: GetListProducts(ProductsRepositoriyImpl.getPR)),
        child: ListViewPage(),
      ),
    );
  }
}
