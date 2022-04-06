import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_cuticare/data/products.dart';
import 'package:demo_cuticare/model/cart_item.dart';
import 'package:demo_cuticare/page/cart_page.dart';
import 'package:demo_cuticare/provider/shop_provider.dart';
import 'package:demo_cuticare/widget/cart_header_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../main.dart';
import 'package:demo_cuticare/data/tags.dart';
import 'package:demo_cuticare/transitions/custom_page_route.dart';
import 'package:demo_cuticare/page/product_page.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xFFf6f5ee),
    appBar: AppBar(
      // title: Text(
      //   MyApp.title,
      //   style: TextStyle(color: Colors.black),
      // ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list, color: Colors.black),
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ],
    ),
    body: SlidingUpPanel(
      parallaxEnabled: true,
      parallaxOffset: 1,
      minHeight: 70,
      body: Container(
        margin: EdgeInsets.only(bottom: 150),
        child: Stack(
          children: [
            buildProducts(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      panelBuilder: (_) => CartPage(),
      collapsed: CartHeaderWidget(),
    ),
  );

  Widget buildProducts() {
    final double spacing = 12;

    return GridView(
      padding: EdgeInsets.all(spacing),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 3 / 4,
      ),
      children: products
          .map((product) => GestureDetector(
        onTap: () {
          final provider =
          Provider.of<ShopProvider>(context, listen: false);
          provider.tag = Tags.imageProducts(product.imgUrl);

          Navigator.of(context).push(CustomRoute(
            child: ProductPage(product: product),
          ));
        },
        child: buildProduct(product),
      ))
          .toList(),
    );
  }

  Widget buildProduct(CartItem product) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: Tags.imageProducts(product.imgUrl),
                child: Image.asset(product.imgUrl),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\$${product.price}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            product.title,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            product.content,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    ),
  );
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = 50;

    final path = Path()
      ..arcToPoint(Offset(radius, size.height),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width - radius, size.height)
      ..arcToPoint(Offset(size.width, 0),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
