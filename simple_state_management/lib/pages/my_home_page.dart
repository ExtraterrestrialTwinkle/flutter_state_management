import 'package:business/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management/pages/shopping_cart_page.dart';

import '../ui_model/product_list_item_model.dart';
import '../widgets/products_list_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  static const routeName = 'Home Page';
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(ShoppingCartPage.routeName);
            },
          )
        ],
      ),
      body: Consumer<StateManager>(
        builder: (context, state, child) {
          if (!state.isLoaded) {
            return const CircularProgressIndicator();
          } else {
            return ProductsListView(
              products: state.products
                  .map((product) => product.toProductListItemModel())
                  .toList(),
              addToCart: (ProductListItemModel item) {
                state.addOneToCart(item.id);
              },
              removeFromCart: (ProductListItemModel item) {
                state.removeOneFromCart(item.id);
              },
            );
          }
        },
      ),
    );
  }
}
