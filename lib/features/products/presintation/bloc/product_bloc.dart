import 'dart:async';

import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ProductBloc implements BlocBase {
  final GetItemProduct getItemProduct;

  Stream<Product> product;

  String sendState = '';

  ProductBloc({@override this.getItemProduct, int id}) {
    if (id != -1) this.product = getItemProduct.call(id);
  }

  insertProduct(Product product) async {
    sendState = (await getItemProduct.insert(product) != -1
        ? 'insertProduct'
        : 'error insertProduct');
  }

  updateProduct(Product product) async {
    sendState = (await getItemProduct.update(product)
        ? 'updateProduct'
        : 'error updateProduct');
  }

  deleteProduct(Product product) async {
    sendState = (await getItemProduct.delete(product) != -1
        ? 'deleteProduct'
        : 'error deleteProduct');
  }
}
