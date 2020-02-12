import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/MyDatabase/BlocProvider.dart';
import 'package:flutter_app_test_project/MyDatabase/ViewBloc.dart';
import 'package:flutter_app_test_project/TableTemplate.dart';

class EditorPage extends StatefulWidget {
  EditorPage({this.tableTemplate, this.delete = false});

  final TableTemplate tableTemplate;
  final bool delete;

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  ViewBloc viewBloc;

  Map<String, TextEditingController> controllers =
      Map<String, TextEditingController>();

  List<Widget> children = List<Widget>();

  @override
  void initState() {
    super.initState();

    viewBloc = BlocProvider.of<ViewBloc>(context);

    Map<String, dynamic> _controllers = widget.tableTemplate.toJson();

    _controllers.forEach((key, value) {
      controllers[key] = TextEditingController(text: '$value');

      children.add(TextField(
        decoration: InputDecoration(hintText: key),
        maxLines: null,
        controller: controllers[key],
      ));
    });
  }

  void _save() async {
    Map<String, dynamic> _controllers = Map<String, dynamic>();

    controllers.forEach((key, value) {
      _controllers[key] = value.text;
    });

    widget.tableTemplate.fromJson(_controllers);

    viewBloc.inSaveTableTemplate.add(widget.tableTemplate);

    Navigator.of(context).pop(true);
  }

  void _delete() {
    viewBloc.inDeleteTableTemplate.add(widget.tableTemplate);

    viewBloc.deleted.listen((deleted) {
      if (deleted) {
        Navigator.of(context).pop(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = List<Widget>();

    actions.add(IconButton(
      icon: Icon(Icons.save),
      onPressed: _save,
    ));

    if (widget.delete)
      actions.add(IconButton(
        icon: Icon(Icons.delete),
        onPressed: _delete,
      ));

    return Scaffold(
      appBar: AppBar(
        title: Text('TableTemplate ' + widget.tableTemplate.id.toString()),
        actions: actions,
      ),
      body: Container(
        child: Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
