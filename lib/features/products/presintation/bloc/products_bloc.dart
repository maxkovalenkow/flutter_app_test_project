import 'dart:async';

import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  final GetListProducts getListProducts;

  Stream<List<Product>> products;

  String sendState = '';

  ProductsBloc({@override this.getListProducts}) {
    products = getListProducts.call(NoParams());
  }

  insertProduct(Product product) async {
    sendState = (await getListProducts.insert(product) != -1
        ? 'insertProduct'
        : 'error insertProduct');
  }

  updateProduct(Product product) async {
    sendState = (await getListProducts.update(product)
        ? 'updateProduct'
        : 'error updateProduct');
  }

  deleteProduct(Product product) async {
    sendState = (await getListProducts.delete(product) != -1
        ? 'deleteProduct'
        : 'error deleteProduct');
  }
}
