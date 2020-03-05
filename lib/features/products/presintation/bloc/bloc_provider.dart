import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/usecases/usecase.dart';

abstract class BlocBase {
  BlocBase({@override UseCase useCase});
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    @required this.child,
    @required this.bloc,
  });

  final T bloc;
  
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType();

    return provider.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
