import 'package:flutter/material.dart';
import 'package:simple_state_management/list_item.dart';
import 'package:simple_state_management/product_list_item_model.dart';

class ListPage extends StatelessWidget {
  final List<ProductListItemModel> products;
  final Function(ProductListItemModel item) addedToCart;
  const ListPage({Key? key, required this.products, required this.addedToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return ListItem(
            item: product,
            onTap: () => addedToCart(product),
        );
      },

    );
  }
}
