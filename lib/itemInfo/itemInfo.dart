import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/itemsWidget/itemsDatabase.dart';
//import 'package:flutter_app_test_project/sqlLite/sqlLite.dart';
//import 'package:provider/provider.dart';

class ItemInfo extends StatefulWidget {
  @override
  _ItemInfoState createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context).settings.arguments;

    Item item = arg['item'];

    Arrays arrays = arg['arrays'];

    return Scaffold(
        body: Column(
      children: <Widget>[
        Image.network(item.image),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(item.subtitle),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        arrays.basketItems.add(item);
                      },
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: item.body,
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
