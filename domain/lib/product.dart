import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String price,
    String? category,
    String? description,
    String? image,
  }) = _Product;
}
