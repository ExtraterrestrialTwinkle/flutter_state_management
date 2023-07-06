import 'package:flutter/material.dart';
import 'package:simple_state_management/widgets/list_item.dart';
import 'package:simple_state_management/ui_model/product_list_item_model.dart';

class ProductsListView extends StatelessWidget {
  final List<ProductListItemModel> products;
  final Function(ProductListItemModel item) addToCart;
  final Function(ProductListItemModel item) removeFromCart;

  const ProductsListView(
      {Key? key,
      required this.products,
      required this.addToCart,
      required this.removeFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return ListItem(
          item: product,
          onPlus: () => addToCart(product),
          onMinus: () => removeFromCart(product),
        );
      },
    );
  }
}
