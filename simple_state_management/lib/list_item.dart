import 'package:flutter/material.dart';
import 'package:simple_state_management/product_list_item_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item, required this.onTap})
      : super(key: key);
  final ProductListItemModel item;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          item.image == null
              ? const Icon(Icons.image)
              : Image.network(item.image!),
          Text(
            item.title,
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            item.price,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 12.0, color: Colors.black12),
          )
        ]),
        IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
            color: Colors.lightBlue)
      ],
    );
  }
}
