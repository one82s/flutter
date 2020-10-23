import 'package:firstapp/src/models/category.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

List<Category> categoryList = [
  Category(name: "Beef", image: "beef_kebab.jpg"),
  Category(name: "Chicken", image: "nasi_goren_ayam.jpg"),
  Category(name: "Combination", image: "deli_duo.jpg"),
  Category(name: "Rice Meals", image: "nasi_goren_telur.jpg"),
  Category(name: "Add-ons", image: "add_ons.jpg"),
  ];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder:(_, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: lighter_white,
                          boxShadow: [
                            BoxShadow(
                                color: red[50],
                                offset: Offset(4,6),
                                blurRadius:20
                            )
                          ],
                      ),
                      child:Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset("images/${categoryList[index].image}", height:70, width: 70,)
                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(text: categoryList[index].name, size: 14, color: white,)
                ],
              ),
            );
          }
      ),
    );
  }
}

