import 'package:flutter/material.dart';
import 'package:simple_state_management/ui_model/product_list_item_model.dart';

import 'cart_item.dart';

class CartView extends StatelessWidget {
  final List<ProductListItemModel> products;
  final Function(ProductListItemModel item) removeAll;

  const CartView({Key? key, required this.products, required this.removeAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return CartItem(
          item: product,
          removeAll: () => removeAll(product),
        );
      },
    );
  }
}
