import 'package:flutter/material.dart';
import 'package:simple_state_management/product_widget_model.dart';


class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item}) : super(key: key);
  final ProductListItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        item.image == null
            ? const Icon(Icons.image)
            : Image.network(item.image!),
        Row(children: [
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
      ],
    );
  }
}
