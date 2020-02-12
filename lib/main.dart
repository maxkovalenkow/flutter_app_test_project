import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/MyDatabase/MyDatabase.dart';
import 'package:flutter_app_test_project/MyDatabase/ViewBloc.dart';
import 'package:flutter_app_test_project/ViewList.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';
import 'package:flutter_app_test_project/ViewPage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/History': (context) => ViewListPage(tableTemplate: History(),),
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget body;
  List<Widget> actions;

  int _screen = 0;

  String title;

  Widget floatingActionButton;

  @override
  Widget build(BuildContext context) {
    switch (_screen) {
      case 0:
        actions = null;
        floatingActionButton = null;

        Product product = Product();
        title = product.nameTemplate;
        body = Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ViewList(
                  tableTemplate: product,
                ),
              ),
            ],
          ),
        );
        break;
      case 1:
        actions = null;
        floatingActionButton = FloatingActionButton(
          child: Text('Buy'),
          onPressed: () async {
            await MyDatabase.db.moveTableTemplate(Basket(), History());
            setState(() {});
          },
        );

        Basket basket = Basket();
        title = basket.nameTemplate;

        body = Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ViewList(
                  tableTemplate: basket,
                ),
              ),
            ],
          ),
        );
        break;
      case 2:
        actions = null;
        floatingActionButton = FloatingActionButton(
          child: Text('History'),
          onPressed: () {
            Navigator.pushNamed(context, '/History');
          },
        );

        Accaunt user = Accaunt(id: 1);

        View view = View(
          tableTemplate: Accaunt(id: 1),
          edit: true,
        );

        title = user.nameTemplate;

        actions = view.actions;

        body = BlocProvider(
          bloc: ViewBloc(view.tableTemplate),
          child: view,
        );

        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Product')),
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
      floatingActionButton: floatingActionButton,
    );
  }
}
