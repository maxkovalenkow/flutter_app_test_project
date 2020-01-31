//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/models/item.dart';
import 'package:flutter_app_test_project/screens/home/item_list.dart';
import 'package:flutter_app_test_project/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  var _screen = 0;

  @override
  Widget build(BuildContext context) {
    switch (_screen) {
      case 1:
        return StreamProvider<List<Item>>.value(
          value: DatabaseService().itemsBasket,
          child: buildScaffold('Basket'),
        );
        break;
      case 2:
        return StreamProvider<List<Item>>.value(
          value: DatabaseService().itemsHistory,
          child: buildScaffold('History'),
        );
        break;
      default:
        return StreamProvider<List<Item>>.value(
          value: DatabaseService().items,
          child: buildScaffold('Home'),
        );
        break;
    }
  }

  Widget buildScaffold(String name) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Basket'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('History'),
            ),
          ],
          currentIndex: _screen,
          selectedItemColor: Colors.amber[800],
          onTap: (e) {
            setState(() {
              _screen = e;
            });
          },
        ),
        body: Container(child: Itemlist()));
  }
}
