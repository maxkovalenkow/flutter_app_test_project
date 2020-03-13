import 'dart:async';

import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/core/usecase.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class ListProductBloc implements BlocBase {
  final GetListProduct getListProduct;

  Stream<List<Product>> products;

  ListProductBloc({@override this.getListProduct}) {
    products = getListProduct.call(NoParams());
  }
}
