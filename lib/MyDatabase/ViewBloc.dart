import 'dart:async';

import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/MyDatabase/MyDatabase.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';

class ViewBloc implements BlocBase {
  final _saveController = StreamController<TableTemplate>.broadcast();
  StreamSink<TableTemplate> get inSaveTableTemplate => _saveController.sink;

  final _deleteController = StreamController<TableTemplate>.broadcast();
  StreamSink<TableTemplate> get inDeleteTableTemplate => _deleteController.sink;

  final _noteDeletedController = StreamController<bool>.broadcast();
  StreamSink<bool> get _inDeleted => _noteDeletedController.sink;
  Stream<bool> get deleted => _noteDeletedController.stream;

  final _tableTemplatesController = StreamController<TableTemplate>.broadcast();

  StreamSink<TableTemplate> get _inTableTemplate => _tableTemplatesController.sink;

  Stream<TableTemplate> get tableTemplate => _tableTemplatesController.stream;

  ViewBloc(TableTemplate note) {
    getTableTemplate(note);
    _saveController.stream.listen(_handleSaveTableTemplate);
    _deleteController.stream.listen(_handleDeleteNote);
  }

  @override
  void dispose() {
    _saveController.close();

    _deleteController.close();

    _noteDeletedController.close();

    _tableTemplatesController.close();
  }

  void _handleSaveTableTemplate(TableTemplate tableTemplate) async {
    await MyDatabase.db.updateTableTemplate(tableTemplate);
  }

  void getTableTemplate(TableTemplate tableTemplate) async {
    tableTemplate = await MyDatabase.db.getTableTemplate(tableTemplate);
    
    _inTableTemplate.add(tableTemplate == null ? TableTemplate() : tableTemplate);
  }

  void _handleDeleteNote(TableTemplate tableTemplate) async {
    await MyDatabase.db.deleteTableTemplate(tableTemplate);

    _inDeleted.add(true);
  }
}
