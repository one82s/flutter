import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/screens/detail.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/utils/screen_navigation.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

List<Product> productList = [
  Product(name: 'Bravo Beef Kebab', image: 'images/beef_kebab.jpg', details: 'Beef Kebab is the best kebab',rating: 4.7, price: 149.0, wishList: true),
  Product(name: 'Nasi Goreng Ayam Telur', image: 'images/nasi_goren_ayam_telur.jpg', details: 'Nasi Goreng Ayam Telur is an authentic Asian cuisine'
      ,rating: 4.7, price: 159.0, wishList: true),
  Product(name: 'Deli Duo', image: 'images/deli_duo.jpg', details: 'Deli Duo is the best of both worlds',rating: 4.7, price: 269.0, wishList: true),

];
class BestSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (_, index){
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  changeScreen(_,Detail(product: productList[index]));
                },
                child: Container(
                    height:240.0,
                    width: 220.0,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: grey[50],
                              offset: Offset(10, 3),
                              blurRadius:4)
                        ]
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(productList[index].image, height:140.0, width:140.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CustomText(text:productList[index].name),
                            ),
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: grey[350],
                                            offset: Offset(1,1),
                                            blurRadius:4)
                                      ]
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child:
                                      productList[index].wishList ?
                                        Icon(Icons.favorite, color: red, size: 18,) :
                                        Icon(Icons.favorite_border, color: red, size: 18,)
                                  ),
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left:8.0, right: 8.0),
                                    child: CustomText(text: 'Rating: ${productList[index].rating}', color: grey, size: 14,)
                                ),
                                Icon(Icons.star, color: red, size: 14),
                                Icon(Icons.star, color: red, size: 14),
                                Icon(Icons.star, color: red, size: 14),
                                Icon(Icons.star, color: red, size: 14),
                                Icon(Icons.star, color: red, size: 14),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: CustomText(text: 'P ${productList[index].price}', weight: FontWeight.bold),
                            )
                          ],
                        )

//                              Image.asset('images/nasi_goren_ayam_telur.jpg', height:100.0, width:140.0),
                      ],
                    )
                ),
              ),
            );

          }),
    );
  }
}
