import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Product> productList = [
    Product(name: 'Bravo Beef Kebab', image: 'images/beef_kebab.jpg', details: 'Beef Kebab is the best kebab',rating: 4.7, price: 149.0, wishList: true),
    Product(name: 'Nasi Goreng Ayam Telur', image: 'images/nasi_goren_ayam_telur.jpg', details: 'Nasi Goreng Ayam Telur is an authentic Asian cuisine'
        ,rating: 4.7, price: 159.0, wishList: true),
    Product(name: 'Deli Duo', image: 'images/deli_duo.jpg', details: 'Deli Duo is the best of both worlds',rating: 4.7, price: 269.0, wishList: true),

  ];
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
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: red,
                  boxShadow: [
                    BoxShadow(
                        color: white,
                        offset: Offset(3,5),
                        blurRadius: 40
                    )
                  ]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:5.0, right: 5.0),
                    child: Image.asset(productList[index].image, height:100.0, width:120.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(children: [
                        TextSpan(text: productList[index].name + '\n', style: TextStyle(color: white, fontSize: 16.0, fontWeight: FontWeight.w400)),
                        TextSpan(text: 'P' + productList[index].price.toString(), style: TextStyle(color: white, fontSize: 14.0, fontWeight: FontWeight.bold)),
                      ]),),
                      SizedBox(width: 40),
                      IconButton(icon: Icon(Icons.delete, color: white), onPressed: null)
                    ],
                  )
                ],
              ),
            ),
          );
        }
//        children: [
//
//        ],
      ),
    );
  }
}
