import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/features/products/presintation/widgets/details_widget.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage();

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext conte) {
    return Scaffold(
        appBar: AppBar(title: Text('DetailsPage')), body: DetailsWidget());
  }
}
