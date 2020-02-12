import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';

class MyDatabase {
  MyDatabase._();

  static final MyDatabase db = MyDatabase._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();

    String path = join(documentsDir.path, 'app.db');

    if (true) await deleteDatabase(path);

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // Create the note table
      await db.execute('''
				CREATE TABLE Product(
					id INTEGER PRIMARY KEY,
					contents TEXT DEFAULT '',
					image TEXT DEFAULT '',
					body TEXT DEFAULT ''
				)
			''');

      await db.execute('''
				CREATE TABLE Basket(
					id INTEGER PRIMARY KEY,
					contents TEXT DEFAULT '',
					image TEXT DEFAULT '',
					body TEXT DEFAULT ''
				)
			''');

      await db.execute('''
				CREATE TABLE History(
					id INTEGER PRIMARY KEY,
					contents TEXT DEFAULT '',
					image TEXT DEFAULT '',
					body TEXT DEFAULT ''
				)
			''');

      await db.execute('''
				CREATE TABLE Accaunt(
					id INTEGER PRIMARY KEY,
					contents TEXT DEFAULT '',
					image TEXT DEFAULT '',
					body TEXT DEFAULT ''
				)
			''');

      for (var i = 10; i < 40; i++) {
        await db.execute('''
				INSERT INTO Product(
					contents,
					image,
					body
				)
        VALUES(
					'Product $i',
					'https://dummyimage.com/600x400/0$i/fff',
					'body $i'
				)
			''');
      }

      await db.execute('''
				INSERT INTO Accaunt(
					contents,
					body
				)
        VALUES(
					'First Name',
					'Last Name'
				)
			''');
    });
  }

  newTableTemplate(TableTemplate tableTemplate) async {
    final db = await MyDatabase.db.database;

    var res =
        await db.insert(tableTemplate.nameTemplate, tableTemplate.toJson());

    return res;
  }

  moveTableTemplate(
      TableTemplate fromTableTemplate, TableTemplate toTableTemplate) async {
    final db = await MyDatabase.db.database;

    await db.execute('''
				INSERT INTO
        ${toTableTemplate.nameTemplate}(
					contents,
					image,
					body
				)
				SELECT contents, image, body
        FROM
        ${fromTableTemplate.nameTemplate}
			''');

    await db.execute('''
				DELETE FROM ${fromTableTemplate.nameTemplate}
			''');
  }

  getTableTemplates(TableTemplate tableTemplate) async {
    final db = await MyDatabase.db.database;

    var res = await db.query(tableTemplate.nameTemplate);

    List<TableTemplate> tableTemplates = res.isNotEmpty
        ? res.map((_note) => tableTemplate.fromShema(_note)).toList()
        : [];

    return tableTemplates;
  }

  getTableTemplate(TableTemplate tableTemplate) async {
    final db = await MyDatabase.db.database;

    var res = await db.query(tableTemplate.nameTemplate,
        where: 'id = ?', whereArgs: [tableTemplate.id]);

    return res.isNotEmpty ? tableTemplate.fromShema(res.first) : null;
  }

  updateTableTemplate(TableTemplate tableTemplate) async {
    final db = await MyDatabase.db.database;

    var res = await db.update(
        tableTemplate.nameTemplate, tableTemplate.toJson(),
        where: 'id = ?', whereArgs: [tableTemplate.id]);

    return res;
  }

  deleteTableTemplate(TableTemplate tableTemplate) async {
    final db = await MyDatabase.db.database;

    db.delete(tableTemplate.nameTemplate,
        where: 'id = ?', whereArgs: [tableTemplate.id]);
  }
}
