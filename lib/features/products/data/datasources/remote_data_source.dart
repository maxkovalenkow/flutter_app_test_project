import 'package:flutter_app_test_project/core/data/app_database.dart';

abstract class ProductsRemoteDataSource {
  List<Product> getProducts();

  Product getProduct(int id);

  Future<int> insertProduct(Product product);

  Future<bool> updateProduct(Product product);

  Future<int> deleteProduct(Product product);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  @override
  List<Product> getProducts() {
    return null;
  }

  @override
  Product getProduct(int id) {
    return null;
  }

  @override
  Future<int> insertProduct(Product product) {
    return null;
  }

  @override
  Future<bool> updateProduct(Product product) {
    return null;
  }

  @override
  Future<int> deleteProduct(Product product) {
    return null;
  }
}
