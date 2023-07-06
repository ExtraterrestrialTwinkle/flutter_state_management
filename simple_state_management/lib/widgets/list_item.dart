import 'package:flutter/material.dart';
import 'package:simple_state_management/constants.dart';
import 'package:simple_state_management/ui_model/product_list_item_model.dart';
import 'package:simple_state_management/widgets/add_to_cart_button.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {Key? key,
      required this.item,
      required this.onPlus,
      required this.onMinus})
      : super(key: key);
  final ProductListItemModel item;
  final GestureTapCallback onPlus;
  final GestureTapCallback onMinus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            item.image == null
                ? const Icon(Icons.image)
                : Image.network(
                    item.image!,
                    height: ITEM_WIDGET_HEIGHT,
                    width: ITEM_WIDGET_HEIGHT,
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${item.price}\$',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.black),
                      )
                    ]),
              ),
            ),
            AddToCartButton(
              product: item,
              onPlusClicked: onPlus,
              onMinusClicked: onMinus,
            )
          ],
        ),
      ),
    );
  }
}
