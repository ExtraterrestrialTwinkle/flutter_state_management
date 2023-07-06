import 'package:business/product.dart';

class ProductListItemModel {
  final int id;
  final String title;
  final double price;
  final String? image;
  final int count;

  ProductListItemModel({required this.count, required this.id, required this.title, required this.price, this.image});
}

extension Mapper on Product {
  ProductListItemModel toProductListItemModel() {
    return ProductListItemModel (
      id: id,
      title: title,
      price: price,
      count: inCart,
      image: image
    );
  }
}
