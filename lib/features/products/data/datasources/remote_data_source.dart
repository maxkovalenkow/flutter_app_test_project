import 'package:flutter_app_test_project/core/data/app_database.dart';

abstract class ProductsRemoteDataSource {
  List<Product> geListProduct();

  Product getProduct(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  List<Product> geListProduct() {
    return List<Product>();
  }

  @override
  Product getProduct(int id) {
    return Product(id: 0, image: '', title: '', subtitle: '');
  }
}
