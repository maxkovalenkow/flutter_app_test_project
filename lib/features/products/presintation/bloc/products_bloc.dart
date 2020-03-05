import 'dart:async';

import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  final GetListProducts getListProducts;

  Stream<List<Product>> products;

  ProductsBloc({@override this.getListProducts}) {
    products = getListProducts.call();
  }

  void insertProduct(Product product) {
    Database.getDB.insertProduct(product);
  }

  void deleteProduct(Product product) {
    Database.getDB.deleteProduct(product);
  }
}
