import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/list_view_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewPage(),
    );
  }
}