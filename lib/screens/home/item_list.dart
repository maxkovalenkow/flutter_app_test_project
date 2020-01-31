import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/screens/home/item_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_test_project/models/item.dart';

class Itemlist extends StatefulWidget {
  @override
  _ItemlistState createState() => _ItemlistState();
}

class _ItemlistState extends State<Itemlist> {
  @override
  Widget build(BuildContext context) {

    final items = Provider.of<List<Item>>(context) ?? [];

    items.forEach((item) {
      print('${item.name} ${item.sugars} ${item.strenght}');
    });

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (c, i) {
        return ItemTitle(item: items[i]);
      },
    );
  }
}