import 'package:flutter_app_test_project/core/data/app_database.dart';


abstract class ProductsLocalDataSource {
  Stream<List<Product>> getProducts();

  Stream<Product> getProduct(int id);

  Future<int> insertProduct(Product product);

  Future<bool> updateProduct(Product product);

  Future<int> deleteProduct(Product product);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  @override
  Stream<List<Product>> getProducts() {
    return AppDatabase.getDB.watchProducts();
  }

  @override
  Stream<Product> getProduct(int id) {
    return AppDatabase.getDB.watchProduct(id);
  }

  @override
  Future<int> insertProduct(Product product) {
    return AppDatabase.getDB.insertProduct(product);
  }

  @override
  Future<bool> updateProduct(Product product) {
    return AppDatabase.getDB.updateProduct(product);
  }

  @override
  Future<int> deleteProduct(Product product) {
    return AppDatabase.getDB.deleteProduct(product);
  }
}

