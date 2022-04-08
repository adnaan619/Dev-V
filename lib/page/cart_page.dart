import 'package:flutter/material.dart';
import 'package:demo_cuticare/model/cart_item.dart';
import 'package:demo_cuticare/provider/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Clear Cart'),
                  textColor: Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: buildCardItems(context),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  '\$80.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height:50.0),
          ],
        ),
      ),
    );
  }

  Widget buildCardItems(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);

    if (provider.items.isEmpty) {
      return Center(
        child: Text(
          'Cart Is Empty',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    } else {
      return ListView(
        physics: BouncingScrollPhysics(),
        children: provider.items.values.map(buildCardItem).toList(),
      );
    }
  }

  Widget buildCardItem(CartItem cartItem) => ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage(cartItem.imgUrl),
    ),
    title: Row(
      children: [
        Text(
          '${cartItem.quantity}x',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            cartItem.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
    trailing: Text(
      '\$${cartItem.price}',
      style: TextStyle(color: Colors.white),
    ),
  );
}