import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(    
            elevation: 2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Container(
                       width:300,
                      height: 150,
                  child: GestureDetector(
                     
                onTap: () {
                  
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: product.id,
                      );
                    },
                    child: Image.network(
                      
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(product.title,style: TextStyle(
                      fontSize: 16
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(product.price.toString()+" Euro",style: TextStyle(
                      fontSize: 16
                    ),),
                  ),

                 
        GridTileBar(
         // backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    product.toggleFavoriteStatus();
                  },
                ),
          ),
          title: Text(
        //    product.title,
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
    

                ],
            )
          );
  }
}
