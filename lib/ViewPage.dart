import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/EditorPage.dart';
import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/MyDatabase/ViewBloc.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';

class ViewPage extends StatefulWidget {
  ViewPage({this.tableTemplate});

  final TableTemplate tableTemplate;

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    View view = View(
      tableTemplate: widget.tableTemplate,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('TableTemplate ' + widget.tableTemplate.id.toString()),
        actions: view.actions,
      ),
      body: view,
    );
  }
}

class View extends StatelessWidget {
  TableTemplate tableTemplate;

  ViewBloc viewBloc;

  List<Widget> children = List<Widget>();
  List<Widget> actions = List<Widget>();

  BuildContext _context;

  View({this.tableTemplate, bool delete = false, bool edit = false}) {
    if (edit)
      actions.add(IconButton(
        icon: Icon(Icons.edit),
        onPressed: _save,
      ));

    if (delete)
      actions.add(IconButton(
        icon: Icon(Icons.delete),
        onPressed: _delete,
      ));

    update();
  }

  void update() {
    children = tableTemplate.widgets;
  }

  _save() async {
    bool update = await Navigator.of(_context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          bloc: ViewBloc(tableTemplate),
          child: EditorPage(
            tableTemplate: tableTemplate,
          ),
        ),
      ),
    );

    if (update != null) {
      viewBloc.getTableTemplate(tableTemplate);
    }
  }

  _delete() {
    viewBloc.inDeleteTableTemplate.add(tableTemplate);

    viewBloc.deleted.listen((deleted) {
      if (deleted) {
        Navigator.of(_context).pop(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    viewBloc = BlocProvider.of<ViewBloc>(_context);

    return Container(
      child: StreamBuilder<TableTemplate>(
        stream: viewBloc.tableTemplate,
        builder: (BuildContext context, AsyncSnapshot<TableTemplate> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return Card(
                child: ListTile(
                  title: Text(
                    'No TableTemplate',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            } else if (snapshot.data.id == -1) {
              Timer(Duration(microseconds: 100), () {
                Navigator.of(context).pop(true);
              });
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            tableTemplate = snapshot.data;

            update();

            return Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
