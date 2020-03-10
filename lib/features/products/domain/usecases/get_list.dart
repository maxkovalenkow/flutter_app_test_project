import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class GetListProducts
    implements UseCase<Stream<List<Product>>, Product, NoParams> {
  final ProductsRepositoriy repositoriy;

  GetListProducts(this.repositoriy);

  @override
  Stream<List<Product>> call(NoParams id) {
    return repositoriy.getProducts();
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
