import 'package:meta/meta.dart';

class CartItem {
  final id;
  final title;
  final quantity;
  final imgUrl;
  final price;
  final description;
  final content;

  const CartItem({
    this.imgUrl,
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.description,
    this.content,
  });

  CartItem copy({
    id,
    title,
    quantity,
    imgUrl,
    price,
    description,
    content,
  }) =>
      CartItem(
        id: id ?? this.id,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity,
        imgUrl: imgUrl ?? this.imgUrl,
        price: price ?? this.price,
        description: description ?? this.description,
        content: content ?? this.content,
      );
}