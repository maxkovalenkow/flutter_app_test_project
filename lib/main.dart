import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/pages/add.dart';
import 'package:flutter_app_test_project/pages/home.dart';
import 'package:flutter_app_test_project/pages/list.dart';
import 'package:flutter_app_test_project/pages/info.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => ProjectHome(),
      '/ProjectList': (context) => ProjectList(),
      '/ProjectInfo': (context) => ProjectInfo(),
      '/ProjectAdd': (context) => ProjectAdd(),
    },
  )
);