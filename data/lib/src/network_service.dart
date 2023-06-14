import 'package:data/src/product_model.dart';
import 'dart:async';

interface class NetworkService {
  Future<List<ProductModel>> fetchAllProducts() async => List.empty();
}
