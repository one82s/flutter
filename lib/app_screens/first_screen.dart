import 'dart:math';
import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Material(
        color: Colors.redAccent,
        child:
        Center(
          child:
          Text(generateLuckyNumber(),
              textDirection:TextDirection.ltr,
              style: TextStyle(color: Colors.white, fontSize: 40.0)),
        )
    );
  }

  String generateLuckyNumber(){
    int luckyNumber = Random().nextInt(10);
    return "Hello World! Your lucky number is $luckyNumber";
  }

}