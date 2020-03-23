import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class DetailsProductBloc extends Bloc<int, Product> {
  final ProductsLocalDataSource localDataSource;

  final ProductsRemoteDataSource remoteDataSource;

  DetailsProductBloc({
    @required this.localDataSource,
    @required this.remoteDataSource,
  });

  void getProduct({int id}) async {
    add(id);
  }

  @override
  Product get initialState => Product(id: 0, image: 'https://dummyimage.com/600x400/000/fff', title: 'title', subtitle: 'subtitle');

  @override
  Stream<Product> transformStates(Stream<Product> states) => states;

  @override
  Stream<Product> mapEventToState(int event) async* {
    yield* transformStates(localDataSource.getProduct(event));

    yield remoteDataSource.getProduct(event);
  }
}
