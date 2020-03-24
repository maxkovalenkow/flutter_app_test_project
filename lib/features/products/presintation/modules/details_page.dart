import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/details_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/details_page.dart';
import 'package:flutter_app_test_project/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(
          ":id",
          child: (_, args) => DetailsRouter(id: int.parse(args.params['id'])),
        ),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}

class DetailsRouter extends StatelessWidget {
  final int id;

  DetailsRouter({@required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<DetailsProductBloc>(), child: DetailsPage(id: id));
  }
}
