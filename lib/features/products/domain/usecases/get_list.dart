import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repository.dart';

class GetListProduct implements UseCase<Stream<List<Product>>, NoParams> {
  final ProductsRepositoriy repositoriy;

  GetListProduct(this.repositoriy);

  @override
  Stream<List<Product>> call(NoParams id) {
    return repositoriy.getProducts();
  }
}
