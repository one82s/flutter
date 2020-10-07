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
            child: Row(
              children: [
                Expanded(
                    child: getText("Cebu Pacific")),
                Expanded(
                    child: getText("From Manila to Siargao"))
              ],
            )));
  }

  Text getText(String text) {
    return Text(text,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: fontSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: Colors.white));
  }
}
