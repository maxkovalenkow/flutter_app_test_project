import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/models/user.dart';
import 'package:flutter_app_test_project/services/database.dart';
import 'package:flutter_app_test_project/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> sugars = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];

  String _currentName;

  String _currentSugars;

  int _currentStrenght;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your item settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    validator: (v) =>
                        v.isEmpty ? 'Enter an _currentName' : null,
                    onChanged: (v) {
                      setState(() {
                        _currentName = v;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    value: _currentSugars ?? userData.sugars,
                    items: sugars.map((sugar) {
                      var text = Text('$sugar sugars');
                      return DropdownMenuItem(
                        value: sugar,
                        child: text,
                      );
                    }).toList(),
                    onChanged: (v) {
                      setState(() {
                        _currentSugars = v;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Slider(
                    value: (_currentStrenght ?? userData.strenght).toDouble(),
                    activeColor: Colors.brown[userData.strenght],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (v) {
                      setState(() {
                        _currentStrenght = v.round();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print('$_currentName $_currentSugars $_currentStrenght');

                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars ?? userData.sugars,
                            _currentName ?? userData.name,
                            _currentStrenght ?? userData.strenght);

                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
