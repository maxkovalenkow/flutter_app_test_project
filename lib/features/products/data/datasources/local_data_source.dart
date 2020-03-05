import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

abstract class ProductsLocalDataSource {
  Stream<List<Product>> getProducts();

  Stream<Product> getProduct(Product product);

  cacheProducts(ProductsModel productsToCache);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  @override
  Stream<List<Product>> getProducts() {
    return Stream<List<Product>>.empty();
  }

  @override
  Stream<Product> getProduct(Product product) {
    return Stream<Product>.empty();
  }

  @override
  cacheProducts(ProductsModel productsToCache) {}
}
