import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'SAINT JACQUES',
      description: 'En carpaccio, mayonnaise raifort, choux fleur, Wakame, sésame, pétales de navet mariné',
      price: 23.99,
      imageUrl:
         'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
     ),
    Product(
      id: 'p2',
      title: 'FOIE GRAS',
      description: 'Escalopes poêlées, champignons sautés,Bouillon miso, royale champignons, Pain vapeur, coriandre',
      price: 23.99,
      imageUrl:
       'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
     ),
    Product(
      id: 'p3',
      title: 'CABILLAUD',
      description: 'En médaillon, poché en base température,Velouté de courges, poivre d’Assam, butternut',
      price: 18.99,
      imageUrl:
      'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
       ),
    Product(
      id: 'p4',
      title: 'VOLAILLES',
      description: 'Ballottine de volaille et canard à la sauge,Copeaux de carotte, betterave, Crème de jus de volaille',
      price: 18.99,
      imageUrl:
        'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
      ),
        Product(
      id: 'p5',
      title: 'BROUILLADE',
      description: 'D’oeuf à la truffe dautomne',
      price: 19.99,
      imageUrl:
         'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
     ),
        Product(
      id: 'p6',
      title: 'LANGUE LUCULLUS',
      description: 'De notre fumoir Confit d’échalotes au vin rouge, pain céréales au levain',
      price: 49.99,
      imageUrl:
       'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/master/pass/Smashburger-recipe-120219.jpg',
      ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
