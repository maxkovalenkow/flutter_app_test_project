import 'package:flutter_app_test_project/core/data/app_database.dart';

abstract class ProductsRemoteDataSource {
  Stream<List<Product>> getProducts();
  
  Stream<Product> getProduct(Product product);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  Stream<List<Product>> getProducts() {
    return AppDatabase.getDB.watchProducts();
  }

  @override
  Stream<Product> getProduct(Product product) {
    return AppDatabase.getDB.watchProduct(product);
  }
}