import 'package:flutter_app_test_project/core/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class GetListProducts implements UseCase<Stream<List<Product>>, NoParams> {
  final ProductsRepositoriy repositoriy;

  GetListProducts(this.repositoriy);

  @override
  Stream<List<Product>> call({NoParams params}) {
    return repositoriy.getProducts();
  }
}