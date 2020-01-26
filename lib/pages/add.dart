import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list.dart';

class ProjectAdd extends StatefulWidget {
  @override
  _ProjectAddState createState() => _ProjectAddState();
}

class _ProjectAddState extends State<ProjectAdd> {
  Map item;

  Icon i = Icon(Icons.add);

  TextEditingController tec_name = TextEditingController();
  TextEditingController tec_price = TextEditingController();
  TextEditingController tec_title = TextEditingController();
  TextEditingController tec_description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context).settings.arguments;

    if(item != null)
    {
      tec_name.text = item['name'];
      tec_price.text = '${item['price']}';
      tec_title.text = item['title'];
      tec_description.text = item['description'];
      i = Icon(Icons.done);
    }

    return  Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: ProjectCard(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: tec_name,
              decoration: InputDecoration(
                  labelText: 'name'
              ),
            ),
            TextField(
              controller: tec_price,
              decoration: InputDecoration(
                  labelText: 'price'
              ),
            ),
            TextField(
              controller: tec_title,
              decoration: InputDecoration(
                  labelText: 'title'
              ),
            ),
            TextField(
              controller: tec_description,
              decoration: InputDecoration(
                  labelText: 'description'
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, {
            'name': tec_name.text,
            'price': int.parse(tec_price.text),
            'title': tec_title.text,
            'description': tec_description.text,
          });
        },
        child: i,
        backgroundColor: Colors.red,
      ),
    );
  }
}
