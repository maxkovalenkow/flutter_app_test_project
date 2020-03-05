import 'package:meta/meta.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_list.dart';
/*import 'package:flutter_app_test_project/features/products/presintation/bloc/products_event.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';*/

class ProductsBloc/* extends Bloc<ProductsEvent, ProductsState>*/ {
  final GetItemProduct getItemProduct;
  final GetListProducts getListProducts;

  ProductsBloc({
    @required this.getItemProduct,
    @required this.getListProducts,
  });

  /*@override
  ProductsState get initialState => Empty();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) {
    throw UnimplementedError();
  }*/
}
