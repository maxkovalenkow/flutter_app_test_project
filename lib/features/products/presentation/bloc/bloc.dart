import 'dart:async';

import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

class ProductsBloc implements BlocBase {
	// Create a broadcast controller that allows this stream to be listened
	// to multiple times. This is the primary, if not only, type of stream you'll be using.
	final _productsController = StreamController<List<Product>>.broadcast();

	// Input stream. We add our products to the stream using this variable.
	StreamSink<List<Product>> get _inProducts => _productsController.sink;

	// Output stream. This one will be used within our pages to display the products.
	Stream<List<Product>> get products => _productsController.stream;

	// Input stream for adding new products. We'll call this from our pages.
	final _addProductController = StreamController<Product>.broadcast();
	StreamSink<Product> get inAddProduct => _addProductController.sink;

	ProductsBloc() {
		// Retrieve all the products on initialization
		getProducts();

		// Listens for changes to the addProductController and calls _handleAddProduct on change
		_addProductController.stream.listen(_handleAddProduct);
	}

	// All stream controllers you create should be closed within this function
	@override
	void dispose() {
		_productsController.close();
		_addProductController.close();
	}

	void getProducts() async {
		// Add all of the products to the stream so we can grab them later from our pages
		_inProducts.add(await ProductRepositoryImpl.getThisRepository.getProducts());
	}

	void _handleAddProduct(Product product) async {
		// Create the product in the database
		await ProductRepositoryImpl.getThisRepository.newProduct(product);

		// Retrieve all the products again after one is added.
		// This allows our pages to update properly and display the
		// newly added product.
		getProducts();
	}
}