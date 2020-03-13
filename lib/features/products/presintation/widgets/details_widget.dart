import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/details_bloc.dart';

class DetailsWidget extends StatefulWidget {
  DetailsWidget();

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  DetailsProductBloc detailsProductBloc;

  @override
  initState() {
    super.initState();

    detailsProductBloc = BlocProvider.of<DetailsProductBloc>(context);
  }

  @override
  Widget build(BuildContext conte) {
    return StreamBuilder(
        stream: detailsProductBloc.product,
        builder: (BuildContext contex, AsyncSnapshot<Product> snapshot) {
          if (snapshot.hasData) {
            Product product = snapshot.data;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(product.image),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.title,
                      ),
                      Text(
                        product.subtitle,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else
            return Scaffold(
              body: Container(),
            );
        });
  }
}