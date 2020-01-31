import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/services/auth.dart';
import 'package:flutter_app_test_project/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleBiew;

  Register({this.toggleBiew});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  final _fromKey = GlobalKey<FormState>();

  bool loading = false;

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  String error = '';

  @override
  Widget build(BuildContext context) {

    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {widget.toggleBiew();}, icon: Icon(Icons.person), label: Text('Sig In'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _fromKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(controller: email, validator: (v) => v.isEmpty ? 'Enter an email' : null,),
              SizedBox(height: 20.0,),
              TextFormField(controller: password, validator: (v) => v.length < 6 ? 'Enter a password 6+ chars long' : null, obscureText: true,),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_fromKey.currentState.validate())
                  {
                    setState(() {
                      loading = true;
                    });

                    dynamic result = await _auth.registerWithEmailAndPassword(email.text, password.text);

                    if(result == null)
                      setState(() {
                        error = 'please supply a valid email';
                        loading = false;
                      });
                  }
                },
              ),
              SizedBox(height: 18.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
