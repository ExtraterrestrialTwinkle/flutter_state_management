import 'package:business/utils.dart';
import 'package:data/data.dart';
import 'package:business/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsNotifier extends StateNotifier<List<Product>> {
  final NetworkService _service;

  bool get isLoaded => state.isNotEmpty;

  ProductsNotifier(this._service) : super([]) {
    _initProducts();
  }

  void _initProducts() async {
    state = (await _service.fetchAllProducts())
        .map((productItem) => productItem.toProduct())
        .toList();
  }

  void addOneToCart(int productId) async {
    Product product = state.firstWhere((element) => element.id == productId);
    Product newProduct = product.copyWith(inCart: product.inCart + 1);
    await state.changeElement(newProduct);
  }

  void removeOneFromCart(int productId) async {
    Product product = state.firstWhere((element) => element.id == productId);
    Product newProduct =
        product.copyWith(inCart: product.inCart > 0 ? product.inCart - 1 : 0);
    await state.changeElement(newProduct);
  }

  void removeAllFromCart(int productId) async {
    Product product = state.firstWhere((element) => element.id == productId);
    Product newProduct = product.copyWith(inCart: 0);
    await state.changeElement(newProduct);
  }
}
