import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class SqlLiteDatabase {
  String databasesPath;

  String path;

  sqflite.Database database;

  Future<SqlLiteDatabase> init(
      {String nameDatabase, Map tables, bool debugMode = false}) async {
    databasesPath = await sqflite.getDatabasesPath();

    path = join(databasesPath, '$nameDatabase.db');

    if (debugMode) await sqflite.deleteDatabase(path);

    database = await sqflite.openDatabase(path, version: 1,
        onCreate: (sqflite.Database db, int version) async {
      StringBuffer tablesText = StringBuffer();

      tables.forEach((table, v) async {
        tablesText.clear();

        tablesText.write('CREATE TABLE $table (');

        StringBuffer valuesText = StringBuffer();

        tables[table].forEach((name, value) {
          valuesText.write('$name $value, ');
        });

        String values = valuesText.toString();

        values = values.substring(0, values.length - 2);

        tablesText.writeln('$values)');

        await db.execute(tablesText.toString());
      });
    });

    return this;
  }

  Future<List<Map<String, Object>>> query(String sql,
          [List<Object> arguments]) async =>
      await database.rawQuery(sql, arguments);
}

class SqlLiteTable {
  SqlLiteDatabase sqlLiteDatabase;

  String table;

  SqlLiteTable({this.sqlLiteDatabase, this.table});

  Future<List<Map<String, Object>>> query(
          {bool distinct,
          List<String> columns,
          String where,
          List<Object> whereArgs,
          String groupBy,
          String having,
          String orderBy,
          int limit,
          int offset}) async =>
      await sqlLiteDatabase.database.query(table,
          distinct: distinct,
          columns: columns,
          where: where,
          whereArgs: whereArgs,
          groupBy: groupBy,
          having: having,
          orderBy: orderBy,
          limit: limit,
          offset: offset);

  Future<int> delete({String where, List<dynamic> whereArgs}) async =>
      await sqlLiteDatabase.database
          .delete(table, where: where, whereArgs: whereArgs);

  Future<int> insert(Map<String, Object> values) async =>
      await sqlLiteDatabase.database.insert(table, values);

  Future<int> update(Map<String, Object> values) async =>
      await sqlLiteDatabase.database.update(table, values);
}

class SqlLiteUser {
  String uid;
}
