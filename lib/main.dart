import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/itemInfo/itemInfo.dart';
import 'package:flutter_app_test_project/itemsWidget/itemsWidget.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => ItemsWidget(),
    '/ItemInfo': (context) => ItemInfo(),
  },
));