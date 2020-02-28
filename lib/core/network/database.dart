import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqfLite;

class Database {
  // Create a singleton
  Database._();

  static final Database db = Database._();
  sqfLite.Database _database;

  Future<sqfLite.Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Get the location of our apps directory. This is where files for our app, and only our app, are stored.
    // Files in this directory are deleted when the app is deleted.
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'app.db');

    sqfLite.deleteDatabase(path);

    return await sqfLite.openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (sqfLite.Database db, int version) async {
      // Create the products table
      await db.execute('''
				CREATE TABLE products(
					id INTEGER PRIMARY KEY,
					image TEXT DEFAULT '',
					name TEXT DEFAULT '',
					contents TEXT DEFAULT ''
				)
			''');

      for (var i = 0; i < 10; i++) {
        await db.insert('products', {
          'image': 'https://dummyimage.com/600x400/0$i/fff',
          'name': 'name $i',
          'contents': 'contents $i',
          });
      }
    });
  }

  Future<int> newLine(String table, Map<String, dynamic> values) async {
    final db = await database;

    var res = await db.insert(table, values);

    return res;
  }

  Future<List<Map<String, dynamic>>> getLines(String table) async {
    final db = await database;

    var res = await db.query(table);

    return res.isNotEmpty ? res : [];
  }

  Future<Map<String, dynamic>> getLine(String table, int id) async {
    final db = await database;

    var res = await db.query(table, where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? res[0] : {};
  }

  Future<int> updateLine(
      String table, int id, Map<String, dynamic> values) async {
    final db = await database;

    var res = await db.update(table, values, where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteLine(String table, int id) async {
    final db = await database;

    var res = await db.delete(table, where: 'id = ?', whereArgs: [id]);

    return res;
  }
}