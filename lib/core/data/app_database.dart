import 'package:flutter_app_test_project/features/products/domain/entities.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// Moor works by source gen. This file will all the generated code.
part 'app_database.g.dart';

// This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Products])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        ))) {
    delete(products).go();

    for (var i = 10; i < 20; i++)
      into(products).insert(Product(
          image: 'https://dummyimage.com/600x400/0$i/fff',
          title: 'title $i',
          subtitle: 'subtitle $i'));
  }

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Product>> watchProducts() => select(products).watch();

  Stream<Product> watchProduct(int id) =>
      (select(products)..where((tbl) => tbl.id.equals(id))).watchSingle();

  Future<int> insertProduct(Product product) => into(products).insert(product);

  // Updates a Product with a matching primary key
  Future<bool> updateProduct(Product product) =>
      update(products).replace(product);

  Future<int> deleteProduct(Product product) =>
      delete(products).delete(product);
}
