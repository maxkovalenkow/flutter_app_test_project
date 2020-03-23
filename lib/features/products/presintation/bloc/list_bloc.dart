import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecase.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class ListProductBloc extends Bloc<NoParams, List<Product>> {
  final ProductsLocalDataSource localDataSource;

  final ProductsRemoteDataSource remoteDataSource;

  ListProductBloc({
    @required this.localDataSource,
    @required this.remoteDataSource,
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
    yield* transformStates(localDataSource.getProducts());

    yield remoteDataSource.geListProduct();
  }
}
