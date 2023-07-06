import 'package:business/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/ui_model/product_list_item_model.dart';

import '../widgets/cart_view.dart';

class ShoppingCartPage extends StatelessWidget {

  static const routeName = "Shopping Cart Page";
  final String title;

  const ShoppingCartPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer<StateManager>(
        builder: (context, state, child) {
          if (!state.isLoaded) {
            return const CircularProgressIndicator();
          } else {
            return CartView(
              products: state.products
                  .map<ProductListItemModel>((product) => product.toProductListItemModel())
                  .where((element) => element.count != 0)
                  .toList(),
              removeAll: (ProductListItemModel item) {
                state.removeAllFromCart(item.id);
              },
            );
          }
        },
      ),
    );
  }
}

