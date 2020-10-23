import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/categories.dart';
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
                      text:"What do you desire?",
                      size: 18.0,
                      color: white
                  )
                ),
                Stack(
                  children: [
                    IconButton(
                      icon:Icon(Icons.notifications_none, color: white),
                      onPressed: (){},
                    ),
                    Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height:10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey[300],
                      offset: Offset(1,1),
                      blurRadius:4
                    )
                  ]
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: red),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Seach your cravings",
                      border: InputBorder.none,
                      hintStyle:   TextStyle(
                          fontSize: 14.0,
                          color: grey
                      ),

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
              child: CustomText(text: 'Best Seller', size: 20.0, color: white,),
            ),
            Container(
              height: 240.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (_, index){
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                          height:240.0,
                          width: 220.0,
                          decoration: BoxDecoration(
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: grey[300],
                                    offset: Offset(1,1),
                                    blurRadius:4)
                              ]
                          ),
                          child: Column(
                            children: [
                              Image.asset('images/beef_kebab.jpg', height:140.0, width:140.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomText(text:'Bravo Beef Kebab'),
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
                                            child: Icon(Icons.favorite_border, color: red, size: 18,)
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
                                          child: CustomText(text: 'Rating: 4.7', color: grey, size: 14,)
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
                                    child: CustomText(text: 'Php 150', weight: FontWeight.bold),
                                  )
                                ],
                              )

//                              Image.asset('images/nasi_goren_ayam_telur.jpg', height:100.0, width:140.0),
                            ],
                          )
                      ),
                    );

                  }),
            ),
          ],
        ),
      )

    );
  }
}
