import 'package:flutter_app_test_project/core/app_database.dart';

abstract class ProductsRepositoriy {
  Stream<List<Product>> getProducts();
  Stream<Product> getProduct(Product product);
}