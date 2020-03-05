import 'package:meta/meta.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/platform/network_info.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class ProductsRepositoriyImpl implements ProductsRepositoriy {
  static final ProductsRepositoriyImpl getPR = ProductsRepositoriyImpl(
      remoteDataSource: ProductsRemoteDataSourceImpl(),
      localDataSource: ProductsLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(true));

  final ProductsRemoteDataSource remoteDataSource;
  
  final ProductsLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  ProductsRepositoriyImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Stream<List<Product>> getProducts() {
    return networkInfo.isConnected
        ? remoteDataSource.getProducts()
        : localDataSource.getProducts();
  }

  @override
  Stream<Product> getProduct(Product product) {
    return networkInfo.isConnected
        ? remoteDataSource.getProduct(product)
        : localDataSource.getProduct(product);
  }
}
