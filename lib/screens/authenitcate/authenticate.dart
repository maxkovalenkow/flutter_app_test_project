import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/screens/authenitcate/register.dart';
import 'package:flutter_app_test_project/screens/authenitcate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSigIn = true;

  void toggleBiew(){
    setState(() {
      showSigIn = !showSigIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSigIn) {
      return SigIn(toggleBiew: toggleBiew);
    } else
      return Register(toggleBiew: toggleBiew);
  }
}
