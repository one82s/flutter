import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final FontStyle style;


  CustomText({@required this.text, this.size, this.color, this.weight, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(fontSize: this.size, color: this.color, fontWeight: this.weight));
  }
}
