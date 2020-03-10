import 'package:meta/meta.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class ProductsRepositoriyImpl implements ProductsRepositoriy {
  static final ProductsRepositoriyImpl getPR = ProductsRepositoriyImpl(
      localDataSource: ProductsLocalDataSourceImpl(),
      remoteDataSource: ProductsRemoteDataSourceImpl());

  final ProductsLocalDataSource localDataSource;

  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoriyImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource});

  @override
  Stream<List<Product>> getProducts() {
    return localDataSource.getProducts();
  }

  @override
  Stream<Product> getProduct(int id) {
    return localDataSource.getProduct(id);
  }

  @override
  Future<int> insertProduct(Product product) {
    return localDataSource.insertProduct(product);
  }

  @override
  Future<bool> updateProduct(Product product) {
    return localDataSource.updateProduct(product);
  }

  @override
  Future<int> deleteProduct(Product product) {
    return localDataSource.deleteProduct(product);
  }
}
