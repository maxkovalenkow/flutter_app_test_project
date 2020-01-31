import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/models/item.dart';

class ItemTitle extends StatelessWidget {

  final Item item;

  ItemTitle({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[item.strenght],
            //backgroundImage: AssetImage('assets/icon.png'),
          ),
          title: Text(item.name),
          subtitle: Text('Takes ${item.sugars} sugar(s)'),
        ),
        ),
      );
  }
}