import 'package:business/utils.dart';
import 'package:data/data.dart';
import 'package:business/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class StateManager with ChangeNotifier {
  final NetworkService _service;
  List<Product> products = List.empty();

  bool get isLoaded => products.isNotEmpty;

  StateManager(this._service) {
    initProducts();
  }

  void initProducts() async {
    products = (await _service.fetchAllProducts())
        .map((productItem) => productItem.toProduct())
        .toList();
    notifyListeners();
  }

  void addOneToCart(int productId) async {
    Product product = products.firstWhere((element) => element.id == productId);
    Product newProduct = product.copyWith(inCart: product.inCart + 1);
    await products.changeElement(newProduct);
    notifyListeners();
  }

  void removeOneFromCart(int productId) async {
    Product product = products.firstWhere((element) => element.id == productId);
    Product newProduct =
        product.copyWith(inCart: product.inCart > 0 ? product.inCart - 1 : 0);
    await products.changeElement(newProduct);
    notifyListeners();
  }

  void removeAllFromCart(int productId) async {
    Product product = products.firstWhere((element) => element.id == productId);
    Product newProduct = product.copyWith(inCart: 0);
    await products.changeElement(newProduct);
    notifyListeners();
  }
}
