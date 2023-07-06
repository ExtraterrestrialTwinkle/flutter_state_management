import 'package:flutter/material.dart';
import 'package:simple_state_management/product_list_item_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item, required this.onTap})
      : super(key: key);
  final ProductListItemModel item;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            item.image == null
                ? const Icon(Icons.image)
                : Image.network(item.image!, height: 150.0, width: 150,),
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
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${item.price}\$',
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  )
                ]),
              ),
            ),
            IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.add_shopping_cart, color: Colors.black),
                color: Colors.lightBlue)
          ],
        ),
      ),
    );
  }
}
