import 'package:data/data.dart';
import 'package:business/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class StateManager with ChangeNotifier {
  final NetworkService _service;
  List<Product> products = List.empty();

  StateManager(this._service) {
    initProducts();
  }

  void initProducts() async {
    products = (await _service.fetchAllProducts())
        .map((productItem) => productItem.toProduct())
        .toList();
    notifyListeners();
  }
}
