import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/details_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/details_page.dart';
import 'package:flutter_app_test_project/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;

  ListItemWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: GridTile(
        child: Image.network(
          product.image,
          fit: BoxFit.cover,
        ),
        footer: InkResponse(
            child: GridTileBar(
                title: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(product.title),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(product.subtitle),
                ))),
      ),
      onTap: () {
        Modular.to.pushNamed('/DetailsModule/${product.id}');
      },
    );
  }
}
