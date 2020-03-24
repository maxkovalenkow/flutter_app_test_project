import 'package:flutter_app_test_project/features/products/domain/repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';

class ProductsRepositoriyImpl implements ProductsRepositoriy {
  final ProductsLocalDataSource localDataSource;

  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoriyImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource});

  @override
  Stream<List<Product>> getProducts() async* {
    yield* localDataSource.getProducts();

    yield remoteDataSource.getProducts();
  }

  @override
  Stream<Product> getProduct(int id) async* {
    yield* localDataSource.getProduct(id);
    
    yield remoteDataSource.getProduct(id);
  }
}
