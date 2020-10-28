import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/best_seller.dart';
import 'package:firstapp/src/widgets/categories.dart';
import 'package:firstapp/src/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/src/widgets/custom_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                        text: "What do you desire?", size: 18.0, color: white)),
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_none, color: white),
                      onPressed: () {},
                    ),
                    Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(20.0)),
                        ))
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                      color: grey[300], offset: Offset(1, 1), blurRadius: 4)
                ]),
                child: ListTile(
                  leading: Icon(Icons.search, color: red),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Seach your cravings",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 14.0, color: grey),
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: red),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Best Seller',
                size: 20.0,
                color: white,
              ),
            ),
            BestSeller(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Most Popular',
                size: 20.0,
                color: white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('images/beef_kebab.jpg')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                //                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.star,
                                      color: yellow[900],
                                      size: 20,
                                    ),
                                  ),
                                  Text('4.7')
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70.0,
        color: red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.home, color: white, size: 20.0,),
                    SizedBox(height: 2),
                    CustomText(text:'Home', color: white)
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[
                    Icon(Icons.shopping_cart, color: white, size: 20.0,),
                    SizedBox(height: 2),
                    CustomText(text:'Cart', color: white)
                  ]
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Column(
                    children:[
                      Icon(Icons.account_box, color: white, size: 20.0),
                      SizedBox(height: 2),
                      CustomText(text:'Account', color: white)
                    ]
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
