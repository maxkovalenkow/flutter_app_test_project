import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

class ProductRepositoryImpl {
  ProductRepositoryImpl._();

  static final ProductRepositoryImpl getThisRepository = ProductRepositoryImpl._();

  ProductRemoteDataSource productRemoteDataSource = ProductRemoteDataSource();

  Future<Product> getProduct(
    int number,
  ) async =>
      await productRemoteDataSource.getProduct(number);

  Future<List<Product>> getProducts() async =>
      await productRemoteDataSource.getProducts();

  Future<int> newProduct(Product product) async =>
      await productRemoteDataSource.newProduct(product);

  Future<int> updateProduct(int id, Product product) async =>
      await productRemoteDataSource.updateProduct(product.id, product);

  Future<int> deleteProduct(int id) async =>
      await productRemoteDataSource.deleteProduct(id);
}
