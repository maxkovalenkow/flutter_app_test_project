import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectHome extends StatefulWidget {
  @override
  _ProjectHomeState createState() => _ProjectHomeState();
}

class _ProjectHomeState extends State<ProjectHome> {
  Map items = {};
  
  Map defaultItems = {
    'items': [
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
      {'name': 'name', 'title': 'title', 'description': 'description', 'price': 300},
    ]
  };

  @override
  Widget build(BuildContext context) {

    Widget child;

    bool b = false;

    if(items.isEmpty){
      Map arguments = ModalRoute.of(context).settings.arguments;

      if(arguments != null)
      {
        if(arguments['loop'] != null)
        {
          b = true;

          items = defaultItems;
        }
        else
          items = arguments;
      }
      else
        items = defaultItems;
    }

    if(b)
      child = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your order has been successfully placed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                items['sum'] = 0;
                items['icon'] = Icons.shopping_basket;
                items['icon1'] = Icons.add_shopping_cart;
                Navigator.pushNamed(context, '/ProjectList', arguments: items);
              },
              child: Text('Create a new order'),
            ),
          ]
      );
    else
      child = RaisedButton(
        onPressed: () {
          items['sum'] = 0;
          items['icon'] = Icons.shopping_basket;
          items['icon1'] = Icons.add_shopping_cart;
          Navigator.pushNamed(context, '/ProjectList', arguments: items);
        },
        child: Text('Create order'),
      );

    return  Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: child,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          items['sum'] = 0;
          items['icon'] = Icons.add;
          items['icon1'] = Icons.clear;
          await Navigator.pushNamed(context, '/ProjectList', arguments: items);
        },
        child: Icon(Icons.mode_edit),
        backgroundColor: Colors.red,
      ),
    );
  }
}
