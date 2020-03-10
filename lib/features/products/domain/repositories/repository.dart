import 'package:flutter_app_test_project/core/data/app_database.dart';

abstract class ProductsRepositoriy {
  Stream<List<Product>> getProducts();

  Stream<Product> getProduct(int id);

  Future<int> insertProduct(Product product);

  Future<bool> updateProduct(Product product);

  Future<int> deleteProduct(Product product);
}