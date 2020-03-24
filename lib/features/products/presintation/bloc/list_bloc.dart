import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class ListProductBloc extends Bloc<NoParams, List<Product>> {
  final ProductsRepositoriy productsRepositoriy;

  ListProductBloc({
    @required this.productsRepositoriy,
  });

  void getProducts() async {
    add(NoParams());
  }

  @override
  List<Product> get initialState => List<Product>();

  @override
  Stream<List<Product>> transformStates(Stream<List<Product>> states) => states;

  @override
  Stream<List<Product>> mapEventToState(NoParams event) async* {
    yield* transformStates(productsRepositoriy.getProducts());
  }
}
