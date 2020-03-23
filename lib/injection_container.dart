import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/local_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/datasources/remote_data_source.dart';
import 'package:flutter_app_test_project/features/products/data/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/repository.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_details.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/details_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  sl.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );

  // Bloc
  sl.registerFactory<ListProductBloc>(
    () => ListProductBloc(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<DetailsProductBloc>(
    () => DetailsProductBloc(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetListProduct>(() => GetListProduct(sl()));

  sl.registerLazySingleton<GetDetailsProduct>(() => GetDetailsProduct(sl()));

  // Repository
  sl.registerLazySingleton<ProductsRepositoriy>(
    () => ProductsRepositoriyImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(appDatabase: sl()),
  );
}
