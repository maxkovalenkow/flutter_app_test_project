import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_details.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/details_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/details_page.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;

  final GetDetailsProduct getDetailsProduct;

  ListItemWidget({@required this.product, @required this.getDetailsProduct});

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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
                bloc:
                    DetailsProductBloc(id: product.id, getDetailsProduct: getDetailsProduct),
                child: DetailsPage()),
          ),
        );
      },
    );
  }
}
