import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      appBar: AppBar(
        backgroundColor: red,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
            text: "Shopping Cart",
            color: white,
            size: 20,
            weight: FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.shopping_cart, color: white, size: 25.0),
                ),
                Positioned(
                  right: 5.0,
                  top: 10.0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow:[
                            BoxShadow(
                                color: grey[100],
                                offset: Offset(2,1),
                                blurRadius: 2
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: CustomText(text: "99", color: white, size: 9, weight: FontWeight.bold,),
                      )
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
