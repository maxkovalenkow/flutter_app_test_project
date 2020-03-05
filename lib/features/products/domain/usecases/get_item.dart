import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repositories/repository.dart';

class GetItemProduct implements UseCase<Stream<Product>, Params<Product>> {
  final ProductsRepositoriy repositoriy;

  GetItemProduct(this.repositoriy);

  @override
  Stream<Product> call({@override Params<Product> params}) {
    return repositoriy.getProduct(params.value);
  }
}
