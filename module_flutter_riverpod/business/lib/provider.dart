import 'package:business/product.dart';
import 'package:business/products_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((_) => ProductsNotifier());