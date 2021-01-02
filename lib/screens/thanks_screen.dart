import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';

class ThanksScreen extends StatelessWidget {
  static const routeName = '/thanks';

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanks Page'),
      ),
      drawer: AppDrawer(),
      body:  
    Column(children: <Widget>[
    
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.network('https://clogenz.com/wp-content/uploads/2021/01/ordersucess.png'),
            ),
                       Text("Commande envoyée !", style: TextStyle(fontSize: 30),),
                      Text("Elle vous attendra à la fin de votre cours !", style: TextStyle(fontSize: 20),),

          ]
          
          ),
      
    );
  }
}
