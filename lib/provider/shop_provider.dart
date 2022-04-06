import 'package:flutter/material.dart';
import 'package:demo_cuticare/model/cart_item.dart';

class ShopProvider with ChangeNotifier {
  var _tag;
  Map<String, CartItem> _items = {};

  String get tag => _tag;

  set tag(String tag) {
    _tag = tag;
    notifyListeners();
  }

  ShopProvider() {
    _items = {
      '1': CartItem(
        id: '1',
        title: 'Camomile Cologne',
        description:
        'Want to relieve itchy, dry skin? This nourishing body lotion with chamomile can help. Clinically proven to be just as gentle on sensitive skin as fragrance-free products, its unique formula contains Triple Oat Complex for smooth skin and 24 hour moisturization',
        price: 50,
        imgUrl: 'assets/camomile.jpg',
        quantity: 1,
        content: '250ml',
      ),
      '2': CartItem(
        id: '2',
        title: 'Mountain Dew',
        description:
        'Premium quality ingredients with no harsh chemicals, no parabens, and no artificial colors or fragrances. Vegan & Cruelty-Free.',
        price: 28,
        imgUrl: 'assets/amare.jpg',
        quantity: 1,
        content: '50ml',
      ),
    };
  }

  Map<String, CartItem> get items => _items;

  set items(Map<String, CartItem> value) {
    _items = value;
  }

  int get itemCount => _items.length;

  void addItem({
    product,
  }) {
    if (items.containsKey(product.id)) {
      items.update(
        product.id,
            (cartItem) => cartItem.copy(quantity: cartItem.quantity + 1),
      );
    } else {
      items.putIfAbsent(
        product.id,
            () => product.copy(
          id: DateTime.now().toString(),
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }
}

