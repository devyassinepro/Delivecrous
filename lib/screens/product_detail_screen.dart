import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import './cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
 

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
       final cart = Provider.of<Cart>(context, listen: false);

    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
          actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                  child: ch,
                  value: cart.itemCount.toString(),
                ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.title,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
              Container(
          child: IconButton(
            icon: Icon(
            
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(loadedProduct.id, loadedProduct.price, loadedProduct.title);
            },
            color: Theme.of(context).accentColor,
          ),
              ),
            
          ],
        ),
      ),
    );
  }
}
