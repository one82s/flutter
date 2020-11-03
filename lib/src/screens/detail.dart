import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/utils/commons.dart';
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
//            Image.asset(widget.product.image)
            Container(
              height: 300.0,
              child: Carousel(
                images: [
                  AssetImage(widget.product.image),
                  AssetImage(widget.product.image),
                  AssetImage(widget.product.image)
                ],
                dotBgColor: red,
                dotColor: grey,
                dotIncreasedColor: white,
                dotIncreaseSize: 1.5,
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
