import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/itemsWidget/itemsDatabase.dart';
import 'package:flutter_app_test_project/userInfo/itemInfo.dart';
//import 'package:flutter_app_test_project/sqlLite/sqlLite.dart';
import 'package:provider/provider.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: Arrays(),
      child: ItemsService(),
    );
  }
}

class ItemsService extends StatefulWidget {
  @override
  _ItemsServiceState createState() => _ItemsServiceState();
}

class _ItemsServiceState extends State<ItemsService> {
  int _screen = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_screen) {
      case 0:
        body = ItemsListWidget(
          bassket: false,
        );
        break;
      case 1:
        body = ItemsListWidget(
          bassket: true,
        );
        break;
      case 2:
        body = UserInfo();
        break;
    }

    return SafeArea(
      child: Scaffold(
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), title: Text('Basket')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), title: Text('Accaunt')),
          ],
          currentIndex: _screen,
          onTap: (e) {
            setState(() {
              _screen = e;
            });
          },
        ),
      ),
    );
  }
}

class ItemsListWidget extends StatefulWidget {
  final bool bassket;

  ItemsListWidget({this.bassket = false});

  @override
  _ItemsListWidgetState createState() => _ItemsListWidgetState();
}

class _ItemsListWidgetState extends State<ItemsListWidget> {
  @override
  Widget build(BuildContext context) {
    Arrays arrays = Provider.of<Arrays>(context);

    arrays.setState = setState;

    Array items;

    Function onPressed;

    Function onPressedAdd = (Item item) {
      arrays.basketItems.add(item);
    };

    if (widget.bassket) {
      items = arrays.basketItems;

      onPressed = (Item item) {
        arrays.basketItems.remove(item);
      };
    } else {
      items = arrays.items;

      onPressed = onPressedAdd;
    }

    items.import(setState);

    return arrays.connected
        ? ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext bc, int i) {
              return ItemWidget(
                  item: items.getById(i),
                  onPressed: onPressed,
                  arrays: arrays,
                  bassket: widget.bassket);
            })
        : Container();
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  final Function onPressed;

  final Arrays arrays;

  final bool bassket;

  ItemWidget({this.item, this.onPressed, this.arrays, this.bassket});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/ItemInfo', arguments: {
                'item': item,
                'arrays': arrays,
              });
            },
            title: Column(
              children: <Widget>[
                Image.network(item.image),
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
                      icon: bassket
                          ? Icon(Icons.remove_shopping_cart)
                          : Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        onPressed(item);
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
