import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_cuticare/model/cart_item.dart';
import 'package:demo_cuticare/provider/shop_provider.dart';
import 'package:demo_cuticare/data/tags.dart';

class CartHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        children: [
          Text(
            'Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: provider.items.values.map(buildCardItem).toList(),
              ),
            ),
          ),
          SizedBox(width: 12),
          if (provider.items.isNotEmpty) buildItemCount(context)
        ],
      ),
    );
  }

  Widget buildCardItem(CartItem cardItem) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Hero(
      tag: Tags.imageCart(cardItem.imgUrl),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(cardItem.imgUrl),
      ),
    ),
  );

  Widget buildItemCount(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);

    return CircleAvatar(
      radius: 20,
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(
        provider.itemCount.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}