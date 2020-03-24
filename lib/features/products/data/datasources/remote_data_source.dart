import 'package:flutter_app_test_project/core/data/app_database.dart';

abstract class ProductsRemoteDataSource {
  List<Product> getProducts();

  Product getProduct(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  List<Product> getProducts() {
    return List<Product>();
  }

  @override
  Product getProduct(int id) {
    return Product(id: 0, image: '', title: '', subtitle: '');
  }
}
