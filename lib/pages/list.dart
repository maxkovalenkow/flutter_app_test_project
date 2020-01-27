

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/pages/home.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  Map items;

  Map shopping_basket = {
    'sum': 0,
    'items': [],
    'icon': Icons.done,
    'icon1': Icons.clear,
  };

  @override
  Widget build(BuildContext context) {

    items = items != null ? items : ModalRoute.of(context).settings.arguments;

    return  Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ProjectListView(
        items: items['items'],
        onPressed: (item) {
          if(items['icon1'] == Icons.add_shopping_cart)
          {
            setState(() => items['sum'] += item['price']);
            shopping_basket['sum'] = items['sum'];
            shopping_basket['items'].add(item);
          }
          else
          {
            setState(() {
              items['sum'] -= item['price'];
              items['items'].remove(item);
            });
            shopping_basket['sum'] = items['sum'];
          }
        },
        icon: Icon(items['icon1']),
        onTap: (item, index) async {
          if(items['icon'] == Icons.add)
          {
            dynamic result = await Navigator.pushNamed(context, '/ProjectAdd', arguments: item);

            if(result != null)
              setState(() => items['items'][index] = result);
          }
          else
            Navigator.pushNamed(context, '/ProjectInfo', arguments: item);
        },
      ),
      persistentFooterButtons: <Widget>[
        Text('${items['icon'] == Icons.add ? '' : 'Sum: ${items['sum']}'}'),
        RaisedButton(
          onPressed: () async {
            if(items['icon'] == Icons.shopping_basket)
            {
              await Navigator.pushNamed(context, '/ProjectList', arguments: shopping_basket);
              setState(() => items['sum'] = shopping_basket['sum']);
            }
            else if(items['icon'] == Icons.add)
            {
              dynamic result = await Navigator.pushNamed(context, '/ProjectAdd');

              if(result != null)
                setState(() => items['items'].add(result));
            }
            else
            {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false, arguments: {'loop': true});
            }
          },
          color: Colors.blueGrey,
          child: Icon(
            items['icon'],
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ProjectListView extends StatelessWidget {
  List items = [];

  Function onPressed;

  Function onTap;

  Icon icon;

  ProjectListView({this.items, this.onPressed, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ProjectCard(
          title: ProjectTitle(
            item: items[index],
            onPressed: onPressed,
            icon: icon,
          ),
          onTap: () {
            onTap(items[index], index);
          },
        )
    );
  }
}

// ignore: must_be_immutable
class ProjectTitle extends StatelessWidget {
  Map item = {};

  Function onPressed;

  Icon icon;

  ProjectTitle({this.item, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item['name'],
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item['title'],
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Text('${item['price']} руб.'),
        IconButton(
          onPressed: () {
            onPressed(item);
          },
          icon: icon,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ProjectTitleInfo extends StatelessWidget {
  Map item = {};

  ProjectTitleInfo({this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
        Text(item['name']),
        SizedBox(height: 16.0,),
        Text('Price:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
        Text('${item['price']} руб.'),
        SizedBox(height: 16.0,),
        Text('Title:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
        Text(item['title']),
        SizedBox(height: 16.0,),
        Text('Description:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
        Text(item['description']),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Widget title;

  final GestureTapCallback onTap;

  ProjectCard({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: title,
      ),
    );
  }
}
