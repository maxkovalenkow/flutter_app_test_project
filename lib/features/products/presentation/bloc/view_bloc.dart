import 'dart:async';

import 'package:flutter_app_test_project/features/products/data/repositories/repository_impl.dart';
import 'package:flutter_app_test_project/features/products/presentation/bloc/bloc_provider.dart';
import 'package:flutter_app_test_project/features/products/data/models/model.dart';

class ViewProductBloc implements BlocBase {
	final _saveProductController = StreamController<Product>.broadcast();
	StreamSink<Product> get inSaveProduct => _saveProductController.sink;

	final _deleteProductController = StreamController<int>.broadcast();
	StreamSink<int> get inDeleteProduct => _deleteProductController.sink;

	// This bool StreamController will be used to ensure we don't do anything
	// else until a product is actually deleted from the database.
	final _productDeletedController = StreamController<bool>.broadcast();
	StreamSink<bool> get _inDeleted => _productDeletedController.sink;
	Stream<bool> get deleted => _productDeletedController.stream;

	ViewProductBloc() {
		// Listen for changes to the stream, and execute a function when a change is made
		_saveProductController.stream.listen(_handleSaveProduct);
		_deleteProductController.stream.listen(_handleDeleteProduct);
	}

	@override
	void dispose() {
		_saveProductController.close();
		_deleteProductController.close();
		_productDeletedController.close();
	}

	void _handleSaveProduct(Product product) async {
		await ProductRepositoryImpl.getThisRepository.updateProduct(product.id, product);
	}

	void _handleDeleteProduct(int id) async {
		await ProductRepositoryImpl.getThisRepository.deleteProduct(id);

		// Set this to true in order to ensure a product is deleted
		// before doing anything else
		_inDeleted.add(true);
	}
}