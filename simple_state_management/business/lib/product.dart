import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:data/data.dart';
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
    required int inCart,
  }) = _Product;
}

extension Mapper on ProductModel {
  Product toProduct() {
    return Product (
      id: id,
      title: title,
      price: price,
      category: category,
      description: description,
      image: image,
      inCart: 0,
    );
  }
}
