import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/itemsWidget/itemsDatabase.dart';
//import 'package:flutter_app_test_project/sqlLite/sqlLite.dart';
//import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    //Map arg = ModalRoute.of(context).settings.arguments;

    //Item item = arg['item'];

    //Arrays arrays = arg['arrays'];

    return Column(
      children: <Widget>[
        //Image.network(item.image),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('item.subtitle'),
              FlatButton(child: Text('History'), onPressed: () {},)
            ],
          ),
        ),
      ],
    );
  }
}
