import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:firstapp/src/widgets/custom_text.dart';
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
                ],
              ),
            )
//            IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);}, color: white,),
//            Text(widget.product.name, style: TextStyle(color: white))
          ],
        ),
      ),
    );
  }
}
