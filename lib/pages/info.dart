import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';

class ProjectInfo extends StatefulWidget {
  @override
  _ProjectInfoState createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  Map item = {};

  @override
  Widget build(BuildContext context) {
    item = item.isNotEmpty ? item : ModalRoute.of(context).settings.arguments;

    return  Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: ProjectCard(
        title: ProjectTitle1(item: item),
      ),
    );
  }
}
