import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presentation/pages/list_page.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // We want to provide our ProductsPage with the ProductsBloc so we
      // can retrieve it from within the ProductsPage later
      home: BlocProvider(
        bloc: ProductsBloc(),
        child: ProductsListPage(title: 'Products'),
      ),
    );
  }
}
