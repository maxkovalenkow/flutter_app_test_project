import 'package:flutter/material.dart';
import 'package:flutter_app_test_project/core/data/app_database.dart';
import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/domain/usecases/get_item.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/presintation/bloc/product_bloc.dart';
import 'package:flutter_app_test_project/features/products/presintation/pages/view_page.dart';

class ListItemWidget extends StatelessWidget {
  final Product product;

  ListItemWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: GridTile(
        child: Image.network(product.image, fit: BoxFit.cover,),
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
                bloc: ProductBloc(
                    id: product.id,
                    getItemProduct:
                        GetItemProduct(ProductsRepositoriyImpl.getPR)),
                child: ViewPage(product: product)),
          ),
        );
      },
    );
  }
}
