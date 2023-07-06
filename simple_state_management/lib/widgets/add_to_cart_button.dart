import 'package:flutter/material.dart';
import 'package:simple_state_management/constants.dart';
import 'package:simple_state_management/ui_model/product_list_item_model.dart';

class AddToCartButton extends StatelessWidget {
  final ProductListItemModel product;
  final Function onPlusClicked;
  final Function onMinusClicked;

  const AddToCartButton(
      {Key? key,
      required this.product,
      required this.onPlusClicked,
      required this.onMinusClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ITEM_WIDGET_HEIGHT,
      width: 50.0,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 2.0, color: Colors.black87)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => onPlusClicked(),
              icon: const Icon(
                Icons.add_circle_outline,
                size: 22.0,
              )),
          product.count == 0
              ? const Icon(Icons.add_shopping_cart)
              : Text(
                  product.count.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
          IconButton(
              onPressed: () => onMinusClicked(),
              icon: const Icon(
                Icons.remove_circle_outline,
                size: 22.0,
              )),
        ],
      ),
    );
  }
  //
  // void onPlusClicked() {
  //   print('plus, id = ${product.id}, quantity = ${product.count}');
  // }
  //
  // void onMinusClicked() {
  //   print('minus, ${product.id}, quantity = ${product.count}');
  // }
}
