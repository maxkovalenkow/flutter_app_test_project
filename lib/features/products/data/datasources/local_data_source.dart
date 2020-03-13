import 'package:flutter_app_test_project/core/data/app_database.dart';


abstract class ProductsLocalDataSource {
  Stream<List<Product>> getProducts();

  Stream<Product> getProduct(int id);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final AppDatabase appDatabase;

  ProductsLocalDataSourceImpl({@override this.appDatabase});

  @override
  Stream<List<Product>> getProducts() {
    return appDatabase.watchProducts();
  }

  @override
  Stream<Product> getProduct(int id) {
    return appDatabase.watchProduct(id);
  }
}

