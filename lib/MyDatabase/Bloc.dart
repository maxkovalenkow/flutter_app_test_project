import 'dart:async';

import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';

class Bloc implements BlocBase {
  final controller = StreamController<List<TableTemplate>>.broadcast();

  StreamSink<List<TableTemplate>> get _inTableTemplate => controller.sink;

  Stream<List<TableTemplate>> get tableTemplate => controller.stream;

  final _addController = StreamController<TableTemplate>.broadcast();
  StreamSink<TableTemplate> get inAdd => _addController.sink;

  Function handleAdd;
  Function getList;

  Bloc({this.handleAdd, this.getList}) {
    getTableTemplates();

    _addController.stream.listen(_handleAddNote);
  }

  @override
  void dispose() {
    controller.close();
    _addController.close();
  }

  void getTableTemplates() async {
    List<TableTemplate> tableTemplates = await getList();

    _inTableTemplate.add(tableTemplates);
  }

  void _handleAddNote(TableTemplate note) async {
    await handleAdd(note);

    getTableTemplates();
  }
}
