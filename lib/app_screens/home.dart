import "package:flutter/material.dart";

class Home extends StatelessWidget {
  static const fontSize = 35.0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.redAccent,
            margin: EdgeInsets.all(50.0),
            child: getRow()));
  }

  Text getText(String text, double textSize) {
    return Text(text,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: textSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: Colors.white));
  }

  Row getRow(){
    return Row(
      children: [
        Expanded(
            child: getText("Cebu Pacific", 35.0)),
        Expanded(
            child: getText("From Manila to Siargao", 25.0))
      ],
    );
  }
}
