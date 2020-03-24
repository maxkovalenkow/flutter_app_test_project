import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/modules/details_page.dart';
import 'package:flutter_app_test_project/features/products/presintation/modules/list_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'injection_container.dart' as di;

main() async {
  await di.init();

  runApp(ModularApp(module: AppModule()));
}

class AppBloc extends Disposable {
  @override
  void dispose() {}
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Modular.initialRoute,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: ListModule()),
        Router("/DetailsModule/", module: DetailsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
