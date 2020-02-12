import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/MyDatabase/MyDatabase.dart';
import 'package:flutter_app_test_project/ViewList.dart';

class TableTemplate {
  String nameTemplate = 'Model';

  int id;

  TableTemplate({this.id = -1});

  List<Widget> get widgets => [Text('$id')];

  Widget listItem(TableTemplate note, NNotesPageState notesPage) => null;

  TableTemplate fromShema(Map<String, dynamic> json) =>
      TableTemplate(id: json["id"]);

  fromJson(Map<String, dynamic> json) => {};

  Map<String, dynamic> toJson() => {};
}

class Product extends TableTemplate {
  String nameTemplate = 'Product';

  int id;
  String contents;
  String body;
  String image;

  Product({
    this.id,
    this.contents = '',
    this.body = '',
    this.image = '',
  });

  List<Widget> get widgets => [
        Image.network(image),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  contents,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(body),
              ],
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () async {
                TableTemplate basket = Basket();

                basket.fromJson(toJson());

                await MyDatabase.db.newTableTemplate(basket);
              },
            )
          ],
        ),
      ];

  Widget listItem(TableTemplate note, NNotesPageState notesPage) {
    Product product = note;

    return Card(
        child: ListTile(
            onTap: () async {
              await notesPage.navigateToNote(note, false);
              notesPage.bloc.getTableTemplates();
            },
            title: Column(
              children: <Widget>[
                Image.network(product.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.contents,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(product.body),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () async {
                        TableTemplate basket = Basket();

                        basket.fromJson(note.toJson());

                        await MyDatabase.db.newTableTemplate(basket);
                      },
                    )
                  ],
                ),
              ],
            )));
  }

  TableTemplate fromShema(Map<String, dynamic> json) => new Product(
        id: json["id"],
        contents: json["contents"],
        image: json["image"],
        body: json["body"],
      );

  fromJson(Map<String, dynamic> json) {
    contents = json["contents"];
    image = json["image"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() => {
        "contents": contents,
        "image": image,
        "body": body,
      };
}

class Basket extends Product {
  String nameTemplate = 'Basket';

  int id;
  String contents;
  String body;
  String image;

  Basket({
    this.id,
    this.contents = '',
    this.body = '',
    this.image = '',
  });

  Widget listItem(TableTemplate note, NNotesPageState notesPage) {
    Product basket = note;

    return Card(
        child: ListTile(
            onTap: () {
              notesPage.navigateToNote(note, false);
            },
            title: Column(
              children: <Widget>[
                Image.network(basket.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          basket.contents,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(basket.body),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_shopping_cart),
                      onPressed: () async {
                        await MyDatabase.db.deleteTableTemplate(note);
                        notesPage.bloc.getTableTemplates();
                      },
                    )
                  ],
                ),
              ],
            )));
  }

  TableTemplate fromShema(Map<String, dynamic> json) => new Basket(
        id: json["id"],
        contents: json["contents"],
        body: json["body"],
        image: json["image"],
      );
}

class History extends Product {
  String nameTemplate = 'History';

  int id;
  String contents;
  String body;
  String image;

  History({
    this.id,
    this.contents = '',
    this.body = '',
    this.image = '',
  });

  Widget listItem(TableTemplate note, NNotesPageState notesPage) {
    Product history = note;
    
    return Card(
        child: ListTile(
            onTap: () async {
              await notesPage.navigateToNote(note, false);
            },
            title: Column(
              children: <Widget>[
                Image.network(history.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          history.contents,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(history.body),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }

  TableTemplate fromShema(Map<String, dynamic> json) => new History(
        id: json["id"],
        contents: json["contents"],
        body: json["body"],
        image: json["image"],
      );
}

class Accaunt extends TableTemplate {
  String nameTemplate = 'Accaunt';

  int id;
  String contents;
  String body;

  Accaunt({
    this.id,
    this.contents = '',
    this.body = '',
  });

  List<Widget> get widgets => [
        Text(contents),
        Text(body),
      ];

  TableTemplate fromShema(Map<String, dynamic> json) => new Accaunt(
        id: json["id"],
        contents: json["contents"],
        body: json["body"],
      );

  fromJson(Map<String, dynamic> json) {
    contents = json["contents"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() => {
        "contents": contents,
        "body": body,
      };
}
