import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/list_view_page.dart';
import 'package:flutter_app_test_project/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

main() async {
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<ListProductBloc>(),
        child: ListViewPage(),
      ),
    );
  }
}
