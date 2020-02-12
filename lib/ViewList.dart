import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/MyDatabase/Bloc.dart';
import 'package:flutter_app_test_project/MyDatabase/ViewBloc.dart';
import 'package:flutter_app_test_project/MyDatabase/MyDatabase.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';
import 'package:flutter_app_test_project/EditorPage.dart';
import 'package:flutter_app_test_project/ViewPage.dart';

class ViewListPage extends StatelessWidget {
  final TableTemplate tableTemplate;

  ViewListPage({this.tableTemplate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tableTemplate.nameTemplate),
      ),
      body: ViewList(tableTemplate: tableTemplate,),
    );
  }
}

class ViewList extends StatelessWidget {
  final TableTemplate tableTemplate;

  ViewList({this.tableTemplate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: Bloc(
          handleAdd: (TableTemplate tt) async =>
              await MyDatabase.db.newTableTemplate(tableTemplate),
          getList: () async =>
              await MyDatabase.db.getTableTemplates(tableTemplate)),
      child: NotesPage(
        title: 'TableTemplates',
        tableTemplate: tableTemplate,
      ),
    );
  }
}


class NotesPage extends StatefulWidget {
  NotesPage({this.title, this.tableTemplate});

  final String title;

  final TableTemplate tableTemplate;

  @override
  NNotesPageState createState() => NNotesPageState();
}

class NNotesPageState extends State<NotesPage> {
  Bloc bloc;

  /*void _addNote() async {
    TableTemplate tableTemplate = widget.tableTemplate;

    bloc.inAdd.add(tableTemplate);
  }*/

  navigateToNote(TableTemplate tableTemplate, bool edit) async {
    bool update = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          bloc: ViewBloc(tableTemplate),
          child: edit
              ? EditorPage(
                  tableTemplate: tableTemplate,
                )
              : ViewPage(
                  tableTemplate: tableTemplate,
                ),
        ),
      ),
    );

    if (update != null) {
      bloc.getTableTemplates();
    }

    return update;
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<Bloc>(context);

    return StreamBuilder<List<TableTemplate>>(
      stream: bloc.tableTemplate,
      builder:
          (BuildContext context, AsyncSnapshot<List<TableTemplate>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Card(
              child: ListTile(
                title: Text(
                  'No TableTemplate',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          }

          List<TableTemplate> tableTemplates = snapshot.data;

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              TableTemplate tableTemplate = tableTemplates[index];

              return GestureDetector(
                child: widget.tableTemplate
                    .listItem(tableTemplate, this),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
