import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../data.dart';

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  final allProductsUrl = Uri.https('fakestoreapi.com', '/products');

  Logger logger = Logger();

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await http.get(allProductsUrl);
      logger.i("HTTP response ${response.body}");
      List<dynamic> data = json.decode(response.body);
      return data.map((product) => ProductModel.fromJson(product)).toList();
    } on Exception catch (ex, stack) {
      logger.e("Exception on NetworkService.fetchAllProducts $ex");
      logger.e(stack);
      rethrow;
    }
  }
}