import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
import 'package:firstapp/src/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Detail extends StatefulWidget {
  final Product product;

  Detail({@required this.product});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300.0,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Carousel(
                      images: [
                        AssetImage(widget.product.image),
                        AssetImage(widget.product.image),
                        AssetImage(widget.product.image)
                      ],
                      dotBgColor: red,
                      dotColor: grey,
                      dotIncreasedColor: white,
                      dotIncreaseSize: 1.2,
                      autoplay: false,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);}, color: white),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Icon(Icons.shopping_cart, color: white, size: 30.0),
                                  ],
                                ),
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
                                          color: grey,
                                          offset: Offset(2,1),
                                          blurRadius: 3
                                        )
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                      child: CustomText(text: "99", color: white, size: 10, weight: FontWeight.bold,),
                                    )
                                ),
                              )
                            ]
                        )
                      )
                    ],
                  ),
                  Positioned(
                    right: 10.0,
                    bottom: 60.0,
                    child: SmallButton(Icons.favorite, white, red)
                  ),
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: widget.product.name, color: white, size: 22, weight: FontWeight.bold),
                  CustomText(text: "P "+widget.product.price.toString(), color: white, size: 18, weight: FontWeight.w600),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove, color: white), onPressed: null),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                      decoration: BoxDecoration(color: white),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,10,20,10),
                        child: CustomText(text: "Add to Cart", color: red, size: 22, weight: FontWeight.w600,),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add, color: white), onPressed: null),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
