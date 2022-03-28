import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_cuticare/data/tags.dart';
import 'package:demo_cuticare/model/cart_item.dart';
import 'package:demo_cuticare/provider/shop_provider.dart';
import 'package:demo_cuticare/page/products_page.dart';


class ProductPage extends StatelessWidget {
  final product;

  const ProductPage({
    this.product,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final provider = Provider.of<ShopProvider>(context, listen: false);
        provider.tag = Tags.imageProducts(product.imgUrl);

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: buildProduct(context),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShuttle(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext,
      ) {
    final provider = Provider.of<ShopProvider>(flightContext, listen: false);
    if (flightDirection == HeroFlightDirection.pop &&
        Tags.isImageCartTag(provider.tag)) {
      return FittedBox(fit: BoxFit.cover, child: toHeroContext.widget);
    } else {
      return FittedBox(fit: BoxFit.contain, child: toHeroContext.widget);
    }
  }

  Widget buildProduct(BuildContext context) {
    final tag = Provider.of<ShopProvider>(context).tag;

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: Hero(
              flightShuttleBuilder: buildShuttle,
              tag: tag,
              child: Image.asset(product.imgUrl, fit: BoxFit.cover),
            ),
          ),
        ),
        buildTexts(),
        SizedBox(height: 24),
        Container(
          height: 50,
          width: 200,
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              final provider =
              Provider.of<ShopProvider>(context, listen: false);

              provider.tag = Tags.imageCart(product.imgUrl);
              provider.addItem(product: product);

              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildTexts() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        SizedBox(height: 12),
        Text(
          product.content,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black45,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildQuantity(),
            Text(
              '\$' + product.price.toStringAsFixed(2),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 32),
        Text(
          'About The Product',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 18),
        Text(
          product.description,
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      ],
    ),
  );

  Widget buildQuantity() {
    final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        children: [
          MaterialButton(
            minWidth: 60,
            child: Text('—', style: style),
            onPressed: () {},
          ),
          Text('1', style: style),
          MaterialButton(
            minWidth: 60,
            child: Text('+', style: style),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}