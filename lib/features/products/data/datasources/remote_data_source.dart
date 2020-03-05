import 'package:flutter_app_test_project/core/app_database.dart';

abstract class ProductsRemoteDataSource {
  Stream<List<Product>> getProducts();
  Stream<Product> getProduct(Product product);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Stream<List<Product>> getProducts() {
    return Database.getDB.watchProducts();
  }

  @override
  Stream<Product> getProduct(Product product) {
    return Database.getDB.watchProduct(product);
  }
}