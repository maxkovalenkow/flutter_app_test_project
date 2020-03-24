import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/list_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/list_view_page.dart';
import 'package:flutter_app_test_project/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Listbloc extends Disposable {
  @override
  void dispose() {}
}

class ListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Listbloc()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ListRouter(),
        ),
      ];

  static Inject get to => Inject<ListModule>.of();
}

class ListRouter extends StatelessWidget {
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