import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class GetItemProduct implements UseCase<Stream<Product>, Product, int> {
  final ProductsRepositoriy repositoriy;

  GetItemProduct(this.repositoriy);

  @override
  Stream<Product> call(int id) {
    return repositoriy.getProduct(id);
  }

  @override
  Future<int> insert(Product product) {
    return repositoriy.insertProduct(product);
  }

  @override
  Future<bool> update(Product product) {
    return repositoriy.updateProduct(product);
  }

  @override
  Future<int> delete(Product product) {
    return repositoriy.deleteProduct(product);
  }
}
