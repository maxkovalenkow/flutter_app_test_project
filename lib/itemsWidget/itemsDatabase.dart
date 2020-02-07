import 'dart:async';
import 'package:flutter_app_test_project/itemsWidget/itemsWidget.dart';
import 'package:flutter_app_test_project/sqlLite/sqlLite.dart';

class Item {
  final int id;

  final String title;

  final String image;

  final String subtitle;

  final String body;

  Item({
    this.id,
    this.title,
    this.image,
    this.subtitle,
    this.body,
  });
}

class Arrays {
  bool connected = false;

  Function setState = (v) {};

  String body =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porta interdum felis nec mattis. In sodales metus sed dictum lacinia. Duis id nunc suscipit, facilisis augue at, aliquet ante. Duis non malesuada augue, vel porta magna. Ut auctor lobortis arcu, quis venenatis libero dictum a. Etiam rutrum aliquet arcu a pellentesque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.';

  Array items = Array();

  Array basketItems = Array();

  Array historyItems = Array();

  Arrays() {
    init();
  }

  init() async {
    SqlLiteDatabase sld = SqlLiteDatabase();

    await sld.init(
        nameDatabase: 'Test',
        tables: {
          'items': {
            'id': 'INTEGER PRIMARY KEY',
            'title': 'TEXT',
            'subtitle': 'TEXT',
            'body': 'TEXT',
            'image': 'TEXT',
          },
          'basketItems': {
            'id': 'INTEGER PRIMARY KEY',
            'title': 'TEXT',
            'subtitle': 'TEXT',
            'body': 'TEXT',
            'image': 'TEXT',
          },
          'historyItems': {
            'id': 'INTEGER PRIMARY KEY',
            'title': 'TEXT',
            'subtitle': 'TEXT',
            'body': 'TEXT',
            'image': 'TEXT',
          },
        },
        debugMode: true);

    items = Array(slt: SqlLiteTable(table: 'items', sqlLiteDatabase: sld));

    basketItems =
        Array(slt: SqlLiteTable(table: 'basketItems', sqlLiteDatabase: sld));

    historyItems =
        Array(slt: SqlLiteTable(table: 'historyItems', sqlLiteDatabase: sld));

    List _items = List();

    for (var i = 10; i < 40; i++)
      items.slt.insert({
        'title': 'title $i',
        'subtitle': 'subtitle $i',
        'body': body,
        'image': 'https://dummyimage.com/600x400/0$i/fff',
      });

    items.clone(_items);

    setState(() {
      connected = true;
    });
  }
}

class Array {
  Function setState = (v) {};

  List array = List();

  SqlLiteTable slt = SqlLiteTable();

  Array({this.slt});

  int get length => array.length;

  import(_setState) async {
    setState = _setState;

    List _array = List();

    List<Map<String, Object>> query = await slt.query();

    for (Map<String, Object> item in query) {
      _array.add(Item(
        id: item['id'],
        title: item['title'],
        subtitle: item['subtitle'],
        body: item['body'],
        image: item['image'],
      ));
    }

    clone(_array);
  }

  upload() async {
    for (Item item in array) {
      slt.insert({
        'title': item.title,
        'subtitle': item.subtitle,
        'body': item.body,
        'image': item.image,
      });
    }
  }

  getById(int i) {
    return array[i];
  }

  add(Item value) {
    setState(() => array.add(value));
    slt.insert({
      'title': value.title,
      'subtitle': value.subtitle,
      'body': value.body,
      'image': value.image,
    });
  }

  remove(Item value) {
    setState(() => array.remove(value));
    slt.delete(where: 'id = ${value.id}');
  }

  clone(List value) {
    setState(() => array = value);
  }

  clear() {
    setState(() => array.clear());
  }
}
