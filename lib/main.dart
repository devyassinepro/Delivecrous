import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/thanks_screen.dart';

import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Color col = const Color(0xFF42A5F5);

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),

      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Delivecrous',
          theme: ThemeData(
            primarySwatch: Colors.brown,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            ThanksScreen.routeName: (ctx) => ThanksScreen(),

          }),
    );
  }
}
