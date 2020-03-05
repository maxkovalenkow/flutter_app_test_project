import 'dart:async';

import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ProductBloc implements BlocBase {
  final GetItemProduct getItemProduct;

  Stream<Product> product;

  ProductBloc({@override this.getItemProduct, @override Product product}) {
    this.product = getItemProduct.call(params: Params<Product>(product));
  }

  void updateProduct(Product product) {
    Database.getDB.updateProduct(product);
  }

  void deleteProduct(Product product) {
    Database.getDB.deleteProduct(product);
  }
}
