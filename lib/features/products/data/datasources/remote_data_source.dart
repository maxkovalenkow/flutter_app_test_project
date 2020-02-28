import 'dart:async';

import 'package:flutter_app_test_project/core/network/database.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

class ProductRemoteDataSource {
  Future<int> newProduct(Product product) async {
    int res = await Database.db.newLine('products', {
      'image': product.image,
      'name': product.name,
      'contents': product.contents
    });

    return res;
  }

  Future<List<Product>> getProducts() async {
    List<Map<String, dynamic>> res = await Database.db.getLines('products');

    return res
        .map((product) => Product(
            id: product['id'],
            image: product['image'],
            name: product['name'],
            contents: product['contents']))
        .toList();
  }

  Future<Product> getProduct(int id) async {
    Map<String, dynamic> res = await Database.db.getLine('products', id);

    return Product(
        id: res['id'],
        image: res['image'],
        name: res['name'],
        contents: res['contents']);
  }

  Future<int> updateProduct(int id, Product product) async {
    int res = await Database.db.updateLine('products', id, {
      'id': product.id,
      'image': product.image,
      'name': product.name,
      'contents': product.contents
    });

    return res;
  }

  Future<int> deleteProduct(int id) async {
    int res = await Database.db.deleteLine('products', id);

    return res;
  }
}
