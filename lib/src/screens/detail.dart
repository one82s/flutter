import 'package:firstapp/src/models/product.dart';
import 'package:firstapp/src/utils/commons.dart';
import 'package:flutter/material.dart';

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
            Text(widget.product.name, style: TextStyle(color: white))
          ],
        ),
      ),
    );
  }
}
