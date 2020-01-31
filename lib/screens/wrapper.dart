import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/screens/home/home.dart';
import 'package:flutter_app_test_project/models/user.dart';
import 'package:flutter_app_test_project/services/auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null) {
      _auth.signInAnon();
      return Container();
    } else {
      return Home();
    }
  }
}
