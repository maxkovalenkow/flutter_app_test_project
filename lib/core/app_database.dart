import 'package:flutter_app_test_project/features/products/domain/entities/entities.dart';
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
        )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Product>> watchProducts() => select(products).watch();

  Stream<Product> watchProduct(Product product) =>
      (select(products)..where((tbl) => tbl.id.equals(product.id)))
          .watchSingle();

  Future insertProduct(Product product) => into(products).insert(product);

  // Updates a Product with a matching primary key
  Future updateProduct(Product product) => update(products).replace(product);

  Future deleteProduct(Product product) => delete(products).delete(product);
}

class Database {
  Database._();

  static final AppDatabase getDB = AppDatabase();
}
