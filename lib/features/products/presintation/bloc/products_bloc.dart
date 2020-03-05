import 'dart:async';

import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  final GetListProducts getListProducts;

  Stream<List<Product>> products;

  ProductsBloc({@override this.getListProducts}) {
    products = getListProducts.call();
  }

  void insertProduct(Product product) {
    AppDatabase.getDB.insertProduct(product);
  }

  void deleteProduct(Product product) {
    AppDatabase.getDB.deleteProduct(product);
  }
}
