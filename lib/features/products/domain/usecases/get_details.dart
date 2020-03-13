import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repository.dart';

class GetDetailsProduct implements UseCase<Stream<Product>, int> {
  final ProductsRepositoriy repositoriy;

  GetDetailsProduct(this.repositoriy);

  @override
  Stream<Product> call(int id) {
    return repositoriy.getProduct(id);
  }
}
