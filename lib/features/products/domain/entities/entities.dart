import 'package:moor_flutter/moor_flutter.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 50)();
  TextColumn get image => text().withLength(min: 1, max: 50)();
  TextColumn get subtitle => text().withLength(min: 1, max: 50)();
}