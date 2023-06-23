import 'package:data/src/product_model.dart';
import 'dart:async';

abstract interface class NetworkService {
  Future<List<ProductModel>> fetchAllProducts();
}
