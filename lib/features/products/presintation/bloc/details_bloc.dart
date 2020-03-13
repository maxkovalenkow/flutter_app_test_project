import 'dart:async';

import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_details.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';

class DetailsProductBloc implements BlocBase {
  final GetDetailsProduct getDetailsProduct;

  Stream<Product> product;

  DetailsProductBloc({@override this.getDetailsProduct, int id}) {
    product = getDetailsProduct.call(id);
  }
}
